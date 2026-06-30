// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Jun 29 19:00:46 2026
// Host        : LAPTOP-A50L20VJ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/vivado_project/M3_test/M3_test.srcs/sources_1/bd/design_1/ip/design_1_swdio_tri_buffer_0_0/design_1_swdio_tri_buffer_0_0_stub.v
// Design      : design_1_swdio_tri_buffer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "swdio_tri_buffer,Vivado 2019.2" *)
module design_1_swdio_tri_buffer_0_0(swd_o, swd_i, swd_oe, swd_io)
/* synthesis syn_black_box black_box_pad_pin="swd_o,swd_i,swd_oe,swd_io" */;
  input swd_o;
  output swd_i;
  input swd_oe;
  inout swd_io;
endmodule
