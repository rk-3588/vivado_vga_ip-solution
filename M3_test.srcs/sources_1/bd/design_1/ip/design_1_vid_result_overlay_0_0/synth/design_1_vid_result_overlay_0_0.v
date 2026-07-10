// (c) Copyright 1995-2026 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:vid_result_overlay:1.0
// IP Revision: 1

(* X_CORE_INFO = "vid_result_overlay,Vivado 2019.2" *)
(* CHECK_LICENSE_TYPE = "design_1_vid_result_overlay_0_0,vid_result_overlay,{}" *)
(* CORE_GENERATION_INFO = "design_1_vid_result_overlay_0_0,vid_result_overlay,{x_ipProduct=Vivado 2019.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=vid_result_overlay,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,DIGIT_X=16,DIGIT_Y=16,SCALE=4}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_vid_result_overlay_0_0 (
  vid_clk,
  rstn,
  result,
  result_valid,
  app_mode,
  roi_min,
  roi_max,
  s_active_video,
  s_data,
  s_field,
  s_hblank,
  s_hsync,
  s_vblank,
  s_vsync,
  m_active_video,
  m_data,
  m_field,
  m_hblank,
  m_hsync,
  m_vblank,
  m_vsync
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME vid_clk, ASSOCIATED_RESET rstn, FREQ_HZ 25000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 vid_clk CLK" *)
input wire vid_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rstn RST" *)
input wire rstn;
input wire [3 : 0] result;
input wire result_valid;
input wire [1 : 0] app_mode;
input wire [31 : 0] roi_min;
input wire [31 : 0] roi_max;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in ACTIVE_VIDEO" *)
input wire s_active_video;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in DATA" *)
input wire [23 : 0] s_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in FIELD" *)
input wire s_field;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in HBLANK" *)
input wire s_hblank;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in HSYNC" *)
input wire s_hsync;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in VBLANK" *)
input wire s_vblank;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in VSYNC" *)
input wire s_vsync;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out ACTIVE_VIDEO" *)
output wire m_active_video;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out DATA" *)
output wire [23 : 0] m_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out FIELD" *)
output wire m_field;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out HBLANK" *)
output wire m_hblank;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out HSYNC" *)
output wire m_hsync;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out VBLANK" *)
output wire m_vblank;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_out VSYNC" *)
output wire m_vsync;

  vid_result_overlay #(
    .DIGIT_X(16),
    .DIGIT_Y(16),
    .SCALE(4)
  ) inst (
    .vid_clk(vid_clk),
    .rstn(rstn),
    .result(result),
    .result_valid(result_valid),
    .app_mode(app_mode),
    .roi_min(roi_min),
    .roi_max(roi_max),
    .s_active_video(s_active_video),
    .s_data(s_data),
    .s_field(s_field),
    .s_hblank(s_hblank),
    .s_hsync(s_hsync),
    .s_vblank(s_vblank),
    .s_vsync(s_vsync),
    .m_active_video(m_active_video),
    .m_data(m_data),
    .m_field(m_field),
    .m_hblank(m_hblank),
    .m_hsync(m_hsync),
    .m_vblank(m_vblank),
    .m_vsync(m_vsync)
  );
endmodule
