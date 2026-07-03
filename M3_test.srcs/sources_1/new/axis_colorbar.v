`timescale 1ns / 1ps

module axis_colorbar #(
    parameter integer H_ACTIVE = 640,
    parameter integer V_ACTIVE = 480
) (
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m_axis_video, ASSOCIATED_RESET ap_rst_n" *)
    input  wire        ap_clk,

    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire        ap_rst_n,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TVALID" *)
    output wire        m_axis_video_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TREADY" *)
    input  wire        m_axis_video_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TDATA" *)
    output wire [23:0] m_axis_video_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TUSER" *)
    output wire [0:0]  m_axis_video_tuser,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TLAST" *)
    output wire [0:0]  m_axis_video_tlast
);

    localparam integer X_BITS = 16;
    localparam integer Y_BITS = 16;

    reg [X_BITS-1:0] x_cnt;
    reg [Y_BITS-1:0] y_cnt;

    wire axis_fire  = m_axis_video_tvalid && m_axis_video_tready;
    wire line_last  = (x_cnt == H_ACTIVE - 1);
    wire frame_last = line_last && (y_cnt == V_ACTIVE - 1);

    always @(posedge ap_clk) begin
        if (!ap_rst_n) begin
            x_cnt <= {X_BITS{1'b0}};
            y_cnt <= {Y_BITS{1'b0}};
        end else if (axis_fire) begin
            if (line_last) begin
                x_cnt <= {X_BITS{1'b0}};
                if (frame_last) begin
                    y_cnt <= {Y_BITS{1'b0}};
                end else begin
                    y_cnt <= y_cnt + 1'b1;
                end
            end else begin
                x_cnt <= x_cnt + 1'b1;
            end
        end
    end

    function [23:0] color_bar;
        input [X_BITS-1:0] xpos;
        begin
            if (xpos < (H_ACTIVE * 1 / 8)) begin
                color_bar = 24'hffffff;
            end else if (xpos < (H_ACTIVE * 2 / 8)) begin
                color_bar = 24'hffff00;
            end else if (xpos < (H_ACTIVE * 3 / 8)) begin
                color_bar = 24'h00ffff;
            end else if (xpos < (H_ACTIVE * 4 / 8)) begin
                color_bar = 24'h00ff00;
            end else if (xpos < (H_ACTIVE * 5 / 8)) begin
                color_bar = 24'hff00ff;
            end else if (xpos < (H_ACTIVE * 6 / 8)) begin
                color_bar = 24'hff0000;
            end else if (xpos < (H_ACTIVE * 7 / 8)) begin
                color_bar = 24'h0000ff;
            end else begin
                color_bar = 24'h000000;
            end
        end
    endfunction

    assign m_axis_video_tvalid = ap_rst_n;
    assign m_axis_video_tdata  = color_bar(x_cnt);
    assign m_axis_video_tuser  = (x_cnt == 0) && (y_cnt == 0);
    assign m_axis_video_tlast  = line_last;

endmodule
