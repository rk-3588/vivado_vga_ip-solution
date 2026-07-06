`timescale 1ns / 1ps

module ov5640_dvp_to_axis #(
    parameter integer H_ACTIVE = 640,
    parameter integer V_ACTIVE = 480,
    parameter integer FIFO_ADDR_WIDTH = 12,
    parameter         VSYNC_ACTIVE_HIGH = 1'b1,
    parameter         HREF_ACTIVE_HIGH  = 1'b1,
    parameter         RGB565_BYTE_ORDER = 1'b0,
    parameter         SWAP_RB = 1'b0
) (
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 pclk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m_axis_video, ASSOCIATED_RESET rstn" *)
    input  wire        pclk,

    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rstn RST" *)
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire        rstn,

    input  wire        cam_vsync,
    input  wire        cam_href,
    input  wire [7:0]  cam_data,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TVALID" *)
    output wire        m_axis_video_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TREADY" *)
    input  wire        m_axis_video_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TDATA" *)
    output wire [23:0] m_axis_video_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TUSER" *)
    output wire [0:0]  m_axis_video_tuser,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TLAST" *)
    output wire [0:0]  m_axis_video_tlast,

    output wire        probe_pixel_valid,
    output wire [15:0] probe_rgb565,
    output wire [15:0] probe_x,
    output wire [15:0] probe_y,
    output reg         probe_overflow
);

    reg        vsync_d;
    reg        href_d;
    reg [7:0]  data_d;

    reg        byte_phase;
    reg [7:0]  first_byte;
    reg [15:0] rgb565;

    reg [15:0] x_cnt;
    reg [15:0] y_cnt;
    reg        line_has_pixel;
    reg        sof_pending;
    reg        frame_active;

    localparam integer FIFO_DEPTH = (1 << FIFO_ADDR_WIDTH);
    localparam integer FIFO_COUNT_WIDTH = FIFO_ADDR_WIDTH + 1;
    localparam [FIFO_COUNT_WIDTH-1:0] FIFO_DEPTH_COUNT = (1 << FIFO_ADDR_WIDTH);

    (* ram_style = "block" *) reg [25:0] fifo_mem [0:FIFO_DEPTH-1];
    reg [FIFO_ADDR_WIDTH-1:0] fifo_wr_ptr;
    reg [FIFO_ADDR_WIDTH-1:0] fifo_rd_ptr;
    reg [FIFO_COUNT_WIDTH-1:0] fifo_count;

    reg        pixel_push;
    reg [23:0] pixel_data;
    reg        pixel_user;
    reg        pixel_last;

    wire fifo_empty = (fifo_count == {FIFO_COUNT_WIDTH{1'b0}});
    wire fifo_full  = (fifo_count == FIFO_DEPTH_COUNT);
    wire fifo_pop   = m_axis_video_tready && !fifo_empty;
    wire fifo_push  = pixel_push && !fifo_full;

    wire vsync_active = VSYNC_ACTIVE_HIGH ? cam_vsync : ~cam_vsync;
    wire href_active  = HREF_ACTIVE_HIGH  ? cam_href  : ~cam_href;

    wire vsync_active_d = VSYNC_ACTIVE_HIGH ? vsync_d : ~vsync_d;
    wire href_active_d  = HREF_ACTIVE_HIGH  ? href_d  : ~href_d;

    wire vsync_start =  vsync_active && !vsync_active_d;
    wire vsync_end   = !vsync_active &&  vsync_active_d;
    wire href_end    = !href_active  &&  href_active_d;

    wire [4:0] pix_r5 = RGB565_BYTE_ORDER ? cam_data[7:3] : first_byte[7:3];
    wire [5:0] pix_g6 = RGB565_BYTE_ORDER ? {cam_data[2:0], first_byte[7:5]} :
                                            {first_byte[2:0], cam_data[7:5]};
    wire [4:0] pix_b5 = RGB565_BYTE_ORDER ? first_byte[4:0] : cam_data[4:0];

    wire [7:0] pix_r = {pix_r5, pix_r5[4:2]};
    wire [7:0] pix_g = {pix_g6, pix_g6[5:4]};
    wire [7:0] pix_b = {pix_b5, pix_b5[4:2]};
    wire [23:0] pixel_rgb888 = SWAP_RB ? {pix_b, pix_g, pix_r} : {pix_r, pix_g, pix_b};

    always @(posedge pclk) begin
        if (!rstn) begin
            vsync_d        <= 1'b0;
            href_d         <= 1'b0;
            data_d         <= 8'h00;
            byte_phase     <= 1'b0;
            first_byte     <= 8'h00;
            rgb565         <= 16'h0000;
            x_cnt          <= 16'd0;
            y_cnt          <= 16'd0;
            line_has_pixel <= 1'b0;
            sof_pending    <= 1'b0;
            frame_active   <= 1'b0;
            fifo_wr_ptr    <= {FIFO_ADDR_WIDTH{1'b0}};
            fifo_rd_ptr    <= {FIFO_ADDR_WIDTH{1'b0}};
            fifo_count     <= {FIFO_COUNT_WIDTH{1'b0}};
            pixel_push     <= 1'b0;
            pixel_data     <= 24'h000000;
            pixel_user     <= 1'b0;
            pixel_last     <= 1'b0;
            probe_overflow <= 1'b0;
        end else begin
            vsync_d     <= cam_vsync;
            href_d      <= cam_href;
            data_d      <= cam_data;
            pixel_push  <= 1'b0;

            if (fifo_pop) begin
                fifo_rd_ptr <= fifo_rd_ptr + 1'b1;
            end

            if (vsync_start) begin
                x_cnt          <= 16'd0;
                y_cnt          <= 16'd0;
                byte_phase     <= 1'b0;
                line_has_pixel <= 1'b0;
                sof_pending    <= 1'b0;
                frame_active   <= 1'b0;
                fifo_wr_ptr    <= {FIFO_ADDR_WIDTH{1'b0}};
                fifo_rd_ptr    <= {FIFO_ADDR_WIDTH{1'b0}};
                fifo_count     <= {FIFO_COUNT_WIDTH{1'b0}};
            end else if (vsync_end) begin
                x_cnt          <= 16'd0;
                y_cnt          <= 16'd0;
                byte_phase     <= 1'b0;
                line_has_pixel <= 1'b0;
                sof_pending    <= 1'b1;
                frame_active   <= 1'b1;
                fifo_wr_ptr    <= {FIFO_ADDR_WIDTH{1'b0}};
                fifo_rd_ptr    <= {FIFO_ADDR_WIDTH{1'b0}};
                fifo_count     <= {FIFO_COUNT_WIDTH{1'b0}};
            end else if (href_end) begin
                x_cnt          <= 16'd0;
                byte_phase     <= 1'b0;
                line_has_pixel <= 1'b0;
                if (line_has_pixel && (y_cnt < V_ACTIVE)) begin
                    y_cnt <= y_cnt + 1'b1;
                end
                if (line_has_pixel && (y_cnt == V_ACTIVE - 1)) begin
                    frame_active <= 1'b0;
                end
            end else if (frame_active && href_active && !vsync_active) begin
                if (!byte_phase) begin
                    first_byte <= cam_data;
                    byte_phase <= 1'b1;
                end else begin
                    byte_phase <= 1'b0;
                    rgb565 <= RGB565_BYTE_ORDER ? {cam_data, first_byte} : {first_byte, cam_data};

                    if ((x_cnt < H_ACTIVE) && (y_cnt < V_ACTIVE)) begin
                        pixel_push     <= 1'b1;
                        pixel_data     <= pixel_rgb888;
                        pixel_user     <= sof_pending;
                        pixel_last     <= (x_cnt == H_ACTIVE - 1);
                        sof_pending    <= 1'b0;
                        line_has_pixel <= 1'b1;
                        x_cnt          <= x_cnt + 1'b1;

                        if (fifo_full && !fifo_pop) begin
                            probe_overflow <= 1'b1;
                        end
                    end
                end
            end else begin
                byte_phase <= 1'b0;
            end

            if (fifo_push) begin
                fifo_mem[fifo_wr_ptr] <= {pixel_user, pixel_last, pixel_data};
                fifo_wr_ptr <= fifo_wr_ptr + 1'b1;
            end

            case ({fifo_push, fifo_pop})
                2'b10: fifo_count <= fifo_count + 1'b1;
                2'b01: fifo_count <= fifo_count - 1'b1;
                default: fifo_count <= fifo_count;
            endcase
        end
    end

    assign m_axis_video_tvalid = !fifo_empty;
    assign m_axis_video_tdata  = fifo_mem[fifo_rd_ptr][23:0];
    assign m_axis_video_tuser  = fifo_mem[fifo_rd_ptr][25];
    assign m_axis_video_tlast  = fifo_mem[fifo_rd_ptr][24];

    assign probe_pixel_valid = pixel_push;
    assign probe_rgb565      = rgb565;
    assign probe_x           = x_cnt;
    assign probe_y           = y_cnt;

endmodule
