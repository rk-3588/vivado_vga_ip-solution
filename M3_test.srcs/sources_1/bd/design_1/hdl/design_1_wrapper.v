//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Fri Jul  3 15:35:23 2026
//Host        : LAPTOP-A50L20VJ running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (GPIO_0_tri_o,
    SWCLKTCK_0,
    clk_in1_0,
    ext_reset_in_0,
    rx_0,
    swd_io_0,
    tx_0,
    vga_b_0,
    vga_g_0,
    vga_hsync_0,
    vga_r_0,
    vga_vsync_0);
  output [1:0]GPIO_0_tri_o;
  input SWCLKTCK_0;
  input clk_in1_0;
  input ext_reset_in_0;
  input rx_0;
  inout swd_io_0;
  output tx_0;
  output [3:0]vga_b_0;
  output [3:0]vga_g_0;
  output vga_hsync_0;
  output [3:0]vga_r_0;
  output vga_vsync_0;

  wire [1:0]GPIO_0_tri_o;
  wire SWCLKTCK_0;
  wire clk_in1_0;
  wire ext_reset_in_0;
  wire rx_0;
  wire swd_io_0;
  wire tx_0;
  wire [3:0]vga_b_0;
  wire [3:0]vga_g_0;
  wire vga_hsync_0;
  wire [3:0]vga_r_0;
  wire vga_vsync_0;

  design_1 design_1_i
       (.GPIO_0_tri_o(GPIO_0_tri_o),
        .SWCLKTCK_0(SWCLKTCK_0),
        .clk_in1_0(clk_in1_0),
        .ext_reset_in_0(ext_reset_in_0),
        .rx_0(rx_0),
        .swd_io_0(swd_io_0),
        .tx_0(tx_0),
        .vga_b_0(vga_b_0),
        .vga_g_0(vga_g_0),
        .vga_hsync_0(vga_hsync_0),
        .vga_r_0(vga_r_0),
        .vga_vsync_0(vga_vsync_0));
endmodule
