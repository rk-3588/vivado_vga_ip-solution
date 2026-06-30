//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Mon Jun 29 19:00:04 2026
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
    swd_io_0);
  output [1:0]GPIO_0_tri_o;
  input SWCLKTCK_0;
  input clk_in1_0;
  input ext_reset_in_0;
  inout swd_io_0;

  wire [1:0]GPIO_0_tri_o;
  wire SWCLKTCK_0;
  wire clk_in1_0;
  wire ext_reset_in_0;
  wire swd_io_0;

  design_1 design_1_i
       (.GPIO_0_tri_o(GPIO_0_tri_o),
        .SWCLKTCK_0(SWCLKTCK_0),
        .clk_in1_0(clk_in1_0),
        .ext_reset_in_0(ext_reset_in_0),
        .swd_io_0(swd_io_0));
endmodule
