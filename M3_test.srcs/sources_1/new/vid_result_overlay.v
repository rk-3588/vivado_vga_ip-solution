module vid_result_overlay #(
    parameter integer DIGIT_X = 16,
    parameter integer DIGIT_Y = 16,
    parameter integer SCALE   = 4
) (
    input  wire        vid_clk,
    input  wire        rstn,

    input  wire [3:0]  result,
    input  wire        result_valid,
    input  wire [1:0]  app_mode,
    input  wire [31:0] roi_min,
    input  wire [31:0] roi_max,

    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in ACTIVE_VIDEO" *)
    input  wire        s_active_video,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in DATA" *)
    input  wire [23:0] s_data,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in FIELD" *)
    input  wire        s_field,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in HBLANK" *)
    input  wire        s_hblank,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in HSYNC" *)
    input  wire        s_hsync,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in VBLANK" *)
    input  wire        s_vblank,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in VSYNC" *)
    input  wire        s_vsync,

    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out ACTIVE_VIDEO" *)
    output reg         m_active_video,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out DATA" *)
    output reg  [23:0] m_data,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out FIELD" *)
    output reg         m_field,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out HBLANK" *)
    output reg         m_hblank,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out HSYNC" *)
    output reg         m_hsync,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out VBLANK" *)
    output reg         m_vblank,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out VSYNC" *)
    output reg         m_vsync
);

    localparam integer DIGIT_W = 5 * SCALE;
    localparam integer DIGIT_H = 7 * SCALE;
    localparam integer BOX_W   = DIGIT_W + 16;
    localparam integer BOX_H   = DIGIT_H + 16;
    localparam integer ROI_ARM_LENGTH = 40;
    localparam integer ROI_LINE_WIDTH = 3;
    localparam integer GUIDE_X0 = 80;
    localparam integer GUIDE_Y0 = 0;
    localparam integer GUIDE_X1 = 559;
    localparam integer GUIDE_Y1 = 479;

    reg [11:0] x;
    reg [11:0] y;
    reg        active_d;
    reg        vsync_d;
    (* ASYNC_REG = "TRUE", SHREG_EXTRACT = "NO" *) reg [70:0] ctrl_meta;
    (* ASYNC_REG = "TRUE", SHREG_EXTRACT = "NO" *) reg [70:0] ctrl_sync;

    wire [3:0]  result_s;
    wire        result_valid_s;
    wire [1:0]  app_mode_s;
    wire [31:0] roi_min_s;
    wire [31:0] roi_max_s;

    assign {roi_max_s, roi_min_s, result_valid_s, app_mode_s, result_s} = ctrl_sync;

    wire active_rise = s_active_video && !active_d;
    wire active_fall = !s_active_video && active_d;
    wire vsync_rise  = s_vsync && !vsync_d;

    wire [11:0] rel_x = x - DIGIT_X - 8;
    wire [11:0] rel_y = y - DIGIT_Y - 8;
    wire in_box = s_active_video &&
                  (x >= DIGIT_X) && (x < DIGIT_X + BOX_W) &&
                  (y >= DIGIT_Y) && (y < DIGIT_Y + BOX_H);
    wire in_digit = in_box &&
                    (x >= DIGIT_X + 8) && (x < DIGIT_X + 8 + DIGIT_W) &&
                    (y >= DIGIT_Y + 8) && (y < DIGIT_Y + 8 + DIGIT_H);

    wire [2:0] glyph_x = rel_x[4:2];
    wire [2:0] glyph_y = rel_y[4:2];
    wire [3:0] display_digit = (app_mode_s == 2'd0) ? 4'hF : result_s;
    wire show_digit = (app_mode_s == 2'd0) || (app_mode_s == 2'd1) || (app_mode_s == 2'd2);
    wire digit_pixel = show_digit && in_digit && glyph_bit(display_digit, glyph_x, glyph_y);
    wire border_pixel = in_box &&
                        ((x == DIGIT_X) || (x == DIGIT_X + BOX_W - 1) ||
                         (y == DIGIT_Y) || (y == DIGIT_Y + BOX_H - 1));
    wire        roi_valid = roi_max_s[31];
    wire [11:0] roi_x0 = roi_min_s[11:0];
    wire [11:0] roi_y0 = roi_min_s[27:16];
    wire [11:0] roi_x1 = roi_max_s[11:0];
    wire [11:0] roi_y1 = roi_max_s[27:16];

    wire [11:0] roi_x0_arm_end = ((roi_x0 + ROI_ARM_LENGTH - 1) > 12'd639) ?
                                  12'd639 : (roi_x0 + ROI_ARM_LENGTH - 1);
    wire [11:0] roi_y0_arm_end = ((roi_y0 + ROI_ARM_LENGTH - 1) > 12'd479) ?
                                  12'd479 : (roi_y0 + ROI_ARM_LENGTH - 1);
    wire [11:0] roi_x1_arm_start = (roi_x1 >= (ROI_ARM_LENGTH - 1)) ?
                                    (roi_x1 - ROI_ARM_LENGTH + 1) : 12'd0;
    wire [11:0] roi_y1_arm_start = (roi_y1 >= (ROI_ARM_LENGTH - 1)) ?
                                    (roi_y1 - ROI_ARM_LENGTH + 1) : 12'd0;
    wire [11:0] roi_x0_thick_end = ((roi_x0 + ROI_LINE_WIDTH - 1) > 12'd639) ?
                                    12'd639 : (roi_x0 + ROI_LINE_WIDTH - 1);
    wire [11:0] roi_y0_thick_end = ((roi_y0 + ROI_LINE_WIDTH - 1) > 12'd479) ?
                                    12'd479 : (roi_y0 + ROI_LINE_WIDTH - 1);
    wire [11:0] roi_x1_thick_start = (roi_x1 >= (ROI_LINE_WIDTH - 1)) ?
                                      (roi_x1 - ROI_LINE_WIDTH + 1) : 12'd0;
    wire [11:0] roi_y1_thick_start = (roi_y1 >= (ROI_LINE_WIDTH - 1)) ?
                                      (roi_y1 - ROI_LINE_WIDTH + 1) : 12'd0;

    wire roi_top_band    = (y >= roi_y0) && (y <= roi_y0_thick_end);
    wire roi_bottom_band = (y >= roi_y1_thick_start) && (y <= roi_y1);
    wire roi_left_band   = (x >= roi_x0) && (x <= roi_x0_thick_end);
    wire roi_right_band  = (x >= roi_x1_thick_start) && (x <= roi_x1);
    wire roi_left_arm    = (x >= roi_x0) && (x <= roi_x0_arm_end);
    wire roi_right_arm   = (x >= roi_x1_arm_start) && (x <= roi_x1);
    wire roi_top_arm     = (y >= roi_y0) && (y <= roi_y0_arm_end);
    wire roi_bottom_arm  = (y >= roi_y1_arm_start) && (y <= roi_y1);

    wire roi_edge_pixel = s_active_video && roi_valid &&
                          (x >= roi_x0) && (x <= roi_x1) &&
                          (y >= roi_y0) && (y <= roi_y1) &&
                          (roi_top_band || roi_bottom_band || roi_left_band || roi_right_band);

    wire guide_top_band    = (y >= GUIDE_Y0) && (y < GUIDE_Y0 + ROI_LINE_WIDTH);
    wire guide_bottom_band = (y > GUIDE_Y1 - ROI_LINE_WIDTH) && (y <= GUIDE_Y1);
    wire guide_left_band   = (x >= GUIDE_X0) && (x < GUIDE_X0 + ROI_LINE_WIDTH);
    wire guide_right_band  = (x > GUIDE_X1 - ROI_LINE_WIDTH) && (x <= GUIDE_X1);
    wire guide_left_arm    = (x >= GUIDE_X0) && (x < GUIDE_X0 + ROI_ARM_LENGTH);
    wire guide_right_arm   = (x > GUIDE_X1 - ROI_ARM_LENGTH) && (x <= GUIDE_X1);
    wire guide_top_arm     = (y >= GUIDE_Y0) && (y < GUIDE_Y0 + ROI_ARM_LENGTH);
    wire guide_bottom_arm  = (y > GUIDE_Y1 - ROI_ARM_LENGTH) && (y <= GUIDE_Y1);

    wire guide_corner_pixel = s_active_video &&
                              ((guide_top_band && guide_left_arm) ||
                               (guide_left_band && guide_top_arm) ||
                               (guide_top_band && guide_right_arm) ||
                               (guide_right_band && guide_top_arm) ||
                               (guide_bottom_band && guide_left_arm) ||
                               (guide_left_band && guide_bottom_arm) ||
                               (guide_bottom_band && guide_right_arm) ||
                               (guide_right_band && guide_bottom_arm));
    wire [23:0] state_color = (app_mode_s == 2'd2) ? 24'h00FF00 :
                              (app_mode_s == 2'd1) ? 24'hFFFF00 :
                                                    24'h40A0FF;

    function glyph_bit;
        input [3:0] digit;
        input [2:0] gx;
        input [2:0] gy;
        reg [4:0] row;
        begin
            case (digit)
                4'd0: case (gy)
                    3'd0: row = 5'b11111; 3'd1: row = 5'b10001;
                    3'd2: row = 5'b10011; 3'd3: row = 5'b10101;
                    3'd4: row = 5'b11001; 3'd5: row = 5'b10001;
                    default: row = 5'b11111;
                endcase
                4'd1: case (gy)
                    3'd0: row = 5'b00100; 3'd1: row = 5'b01100;
                    3'd2: row = 5'b00100; 3'd3: row = 5'b00100;
                    3'd4: row = 5'b00100; 3'd5: row = 5'b00100;
                    default: row = 5'b01110;
                endcase
                4'd2: case (gy)
                    3'd0: row = 5'b11110; 3'd1: row = 5'b00001;
                    3'd2: row = 5'b00001; 3'd3: row = 5'b11110;
                    3'd4: row = 5'b10000; 3'd5: row = 5'b10000;
                    default: row = 5'b11111;
                endcase
                4'd3: case (gy)
                    3'd0: row = 5'b11110; 3'd1: row = 5'b00001;
                    3'd2: row = 5'b00001; 3'd3: row = 5'b01110;
                    3'd4: row = 5'b00001; 3'd5: row = 5'b00001;
                    default: row = 5'b11110;
                endcase
                4'd4: case (gy)
                    3'd0: row = 5'b10010; 3'd1: row = 5'b10010;
                    3'd2: row = 5'b10010; 3'd3: row = 5'b11111;
                    3'd4: row = 5'b00010; 3'd5: row = 5'b00010;
                    default: row = 5'b00010;
                endcase
                4'd5: case (gy)
                    3'd0: row = 5'b11111; 3'd1: row = 5'b10000;
                    3'd2: row = 5'b10000; 3'd3: row = 5'b11110;
                    3'd4: row = 5'b00001; 3'd5: row = 5'b00001;
                    default: row = 5'b11110;
                endcase
                4'd6: case (gy)
                    3'd0: row = 5'b01110; 3'd1: row = 5'b10000;
                    3'd2: row = 5'b10000; 3'd3: row = 5'b11110;
                    3'd4: row = 5'b10001; 3'd5: row = 5'b10001;
                    default: row = 5'b01110;
                endcase
                4'd7: case (gy)
                    3'd0: row = 5'b11111; 3'd1: row = 5'b00001;
                    3'd2: row = 5'b00010; 3'd3: row = 5'b00100;
                    3'd4: row = 5'b01000; 3'd5: row = 5'b01000;
                    default: row = 5'b01000;
                endcase
                4'd8: case (gy)
                    3'd0: row = 5'b01110; 3'd1: row = 5'b10001;
                    3'd2: row = 5'b10001; 3'd3: row = 5'b01110;
                    3'd4: row = 5'b10001; 3'd5: row = 5'b10001;
                    default: row = 5'b01110;
                endcase
                4'd9: case (gy)
                    3'd0: row = 5'b01110; 3'd1: row = 5'b10001;
                    3'd2: row = 5'b10001; 3'd3: row = 5'b01111;
                    3'd4: row = 5'b00001; 3'd5: row = 5'b00001;
                    default: row = 5'b01110;
                endcase
                default: case (gy)
                    3'd3: row = 5'b11111;
                    default: row = 5'b00000;
                endcase
            endcase
            glyph_bit = row[4 - gx];
        end
    endfunction

    always @(posedge vid_clk) begin
        if (!rstn) begin
            x <= 12'd0;
            y <= 12'd0;
            active_d <= 1'b0;
            vsync_d <= 1'b0;
            ctrl_meta <= 71'd0;
            ctrl_sync <= 71'd0;
        end else begin
            ctrl_meta <= {roi_max, roi_min, result_valid, app_mode, result};
            ctrl_sync <= ctrl_meta;

            active_d <= s_active_video;
            vsync_d <= s_vsync;

            if (vsync_rise) begin
                x <= 12'd0;
                y <= 12'd0;
            end else if (active_rise) begin
                x <= 12'd0;
            end else if (s_active_video) begin
                x <= x + 12'd1;
            end

            if (active_fall) begin
                y <= y + 12'd1;
            end
        end
    end

    always @(posedge vid_clk) begin
        if (!rstn) begin
            m_active_video <= 1'b0;
            m_data <= 24'h000000;
            m_field <= 1'b0;
            m_hblank <= 1'b1;
            m_hsync <= 1'b0;
            m_vblank <= 1'b1;
            m_vsync <= 1'b0;
        end else begin
            m_active_video <= s_active_video;
            m_field <= s_field;
            m_hblank <= s_hblank;
            m_hsync <= s_hsync;
            m_vblank <= s_vblank;
            m_vsync <= s_vsync;

            if (digit_pixel) begin
                m_data <= 24'hFFFFFF;
            end else if (border_pixel) begin
                m_data <= state_color;
            end else if (in_box) begin
                m_data <= 24'h000000;
            end else if (guide_corner_pixel) begin
                m_data <= 24'hFFFFFF;
            end else if (roi_edge_pixel) begin
                m_data <= state_color;
            end else begin
                m_data <= s_data;
            end
        end
    end

endmodule
