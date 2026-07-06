//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Mon Jul  6 22:58:52 2026
//Host        : LAPTOP-A50L20VJ running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (DDR2_0_addr,
    DDR2_0_ba,
    DDR2_0_cas_n,
    DDR2_0_ck_n,
    DDR2_0_ck_p,
    DDR2_0_cke,
    DDR2_0_cs_n,
    DDR2_0_dm,
    DDR2_0_dq,
    DDR2_0_dqs_n,
    DDR2_0_dqs_p,
    DDR2_0_odt,
    DDR2_0_ras_n,
    DDR2_0_we_n,
    GPIO_0_tri_o,
    GPIO_1_tri_o,
    IIC_0_scl_io,
    IIC_0_sda_io,
    SWCLKTCK_0,
    cam_data_0,
    cam_href_0,
    cam_vsync_0,
    clk_in1_0,
    ext_reset_in_0,
    init_calib_complete_0,
    pclk_0,
    rx_0,
    swd_io_0,
    tx_0,
    vga_b_0,
    vga_g_0,
    vga_hsync_0,
    vga_r_0,
    vga_vsync_0);
  output [12:0]DDR2_0_addr;
  output [2:0]DDR2_0_ba;
  output DDR2_0_cas_n;
  output [0:0]DDR2_0_ck_n;
  output [0:0]DDR2_0_ck_p;
  output [0:0]DDR2_0_cke;
  output [0:0]DDR2_0_cs_n;
  output [1:0]DDR2_0_dm;
  inout [15:0]DDR2_0_dq;
  inout [1:0]DDR2_0_dqs_n;
  inout [1:0]DDR2_0_dqs_p;
  output [0:0]DDR2_0_odt;
  output DDR2_0_ras_n;
  output DDR2_0_we_n;
  output [1:0]GPIO_0_tri_o;
  output [1:0]GPIO_1_tri_o;
  inout IIC_0_scl_io;
  inout IIC_0_sda_io;
  input SWCLKTCK_0;
  input [7:0]cam_data_0;
  input cam_href_0;
  input cam_vsync_0;
  input clk_in1_0;
  input ext_reset_in_0;
  output init_calib_complete_0;
  input pclk_0;
  input rx_0;
  inout swd_io_0;
  output tx_0;
  output [3:0]vga_b_0;
  output [3:0]vga_g_0;
  output vga_hsync_0;
  output [3:0]vga_r_0;
  output vga_vsync_0;

  wire [12:0]DDR2_0_addr;
  wire [2:0]DDR2_0_ba;
  wire DDR2_0_cas_n;
  wire [0:0]DDR2_0_ck_n;
  wire [0:0]DDR2_0_ck_p;
  wire [0:0]DDR2_0_cke;
  wire [0:0]DDR2_0_cs_n;
  wire [1:0]DDR2_0_dm;
  wire [15:0]DDR2_0_dq;
  wire [1:0]DDR2_0_dqs_n;
  wire [1:0]DDR2_0_dqs_p;
  wire [0:0]DDR2_0_odt;
  wire DDR2_0_ras_n;
  wire DDR2_0_we_n;
  wire [1:0]GPIO_0_tri_o;
  wire [1:0]GPIO_1_tri_o;
  wire IIC_0_scl_i;
  wire IIC_0_scl_io;
  wire IIC_0_scl_o;
  wire IIC_0_scl_t;
  wire IIC_0_sda_i;
  wire IIC_0_sda_io;
  wire IIC_0_sda_o;
  wire IIC_0_sda_t;
  wire SWCLKTCK_0;
  wire [7:0]cam_data_0;
  wire cam_href_0;
  wire cam_vsync_0;
  wire clk_in1_0;
  wire ext_reset_in_0;
  wire init_calib_complete_0;
  wire pclk_0;
  wire rx_0;
  wire swd_io_0;
  wire tx_0;
  wire [3:0]vga_b_0;
  wire [3:0]vga_g_0;
  wire vga_hsync_0;
  wire [3:0]vga_r_0;
  wire vga_vsync_0;

  IOBUF IIC_0_scl_iobuf
       (.I(IIC_0_scl_o),
        .IO(IIC_0_scl_io),
        .O(IIC_0_scl_i),
        .T(IIC_0_scl_t));
  IOBUF IIC_0_sda_iobuf
       (.I(IIC_0_sda_o),
        .IO(IIC_0_sda_io),
        .O(IIC_0_sda_i),
        .T(IIC_0_sda_t));
  design_1 design_1_i
       (.DDR2_0_addr(DDR2_0_addr),
        .DDR2_0_ba(DDR2_0_ba),
        .DDR2_0_cas_n(DDR2_0_cas_n),
        .DDR2_0_ck_n(DDR2_0_ck_n),
        .DDR2_0_ck_p(DDR2_0_ck_p),
        .DDR2_0_cke(DDR2_0_cke),
        .DDR2_0_cs_n(DDR2_0_cs_n),
        .DDR2_0_dm(DDR2_0_dm),
        .DDR2_0_dq(DDR2_0_dq),
        .DDR2_0_dqs_n(DDR2_0_dqs_n),
        .DDR2_0_dqs_p(DDR2_0_dqs_p),
        .DDR2_0_odt(DDR2_0_odt),
        .DDR2_0_ras_n(DDR2_0_ras_n),
        .DDR2_0_we_n(DDR2_0_we_n),
        .GPIO_0_tri_o(GPIO_0_tri_o),
        .GPIO_1_tri_o(GPIO_1_tri_o),
        .IIC_0_scl_i(IIC_0_scl_i),
        .IIC_0_scl_o(IIC_0_scl_o),
        .IIC_0_scl_t(IIC_0_scl_t),
        .IIC_0_sda_i(IIC_0_sda_i),
        .IIC_0_sda_o(IIC_0_sda_o),
        .IIC_0_sda_t(IIC_0_sda_t),
        .SWCLKTCK_0(SWCLKTCK_0),
        .cam_data_0(cam_data_0),
        .cam_href_0(cam_href_0),
        .cam_vsync_0(cam_vsync_0),
        .clk_in1_0(clk_in1_0),
        .ext_reset_in_0(ext_reset_in_0),
        .init_calib_complete_0(init_calib_complete_0),
        .pclk_0(pclk_0),
        .rx_0(rx_0),
        .swd_io_0(swd_io_0),
        .tx_0(tx_0),
        .vga_b_0(vga_b_0),
        .vga_g_0(vga_g_0),
        .vga_hsync_0(vga_hsync_0),
        .vga_r_0(vga_r_0),
        .vga_vsync_0(vga_vsync_0));
endmodule
