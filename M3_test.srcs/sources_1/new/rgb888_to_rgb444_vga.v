`timescale 1ns / 1ps

module rgb888_to_rgb444_vga #(
    parameter integer HSYNC_ACTIVE_LOW = 1,
    parameter integer VSYNC_ACTIVE_LOW = 1
) (
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in ACTIVE_VIDEO" *)
    input  wire        vid_active_video,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in DATA" *)
    input  wire [23:0] vid_data,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in FIELD" *)
    input  wire        vid_field,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in HBLANK" *)
    input  wire        vid_hblank,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in HSYNC" *)
    input  wire        vid_hsync,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in VBLANK" *)
    input  wire        vid_vblank,
    (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in VSYNC" *)
    input  wire        vid_vsync,

    output wire [3:0]  vga_r,
    output wire [3:0]  vga_g,
    output wire [3:0]  vga_b,
    output wire        vga_hsync,
    output wire        vga_vsync
);

    wire video_de = vid_active_video && !vid_hblank && !vid_vblank;

    assign vga_r     = video_de ? vid_data[23:20] : 4'h0;
    assign vga_g     = video_de ? vid_data[15:12] : 4'h0;
    assign vga_b     = video_de ? vid_data[7:4]   : 4'h0;
    assign vga_hsync = HSYNC_ACTIVE_LOW ? ~vid_hsync : vid_hsync;
    assign vga_vsync = VSYNC_ACTIVE_LOW ? ~vid_vsync : vid_vsync;

    wire unused_vid_field = vid_field;

endmodule
