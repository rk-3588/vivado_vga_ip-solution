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


// IP VLNV: xilinx.com:module_ref:ov5640_dvp_to_axis:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_ov5640_dvp_to_axis_0_0 (
  pclk,
  rstn,
  cam_vsync,
  cam_href,
  cam_data,
  m_axis_video_tvalid,
  m_axis_video_tready,
  m_axis_video_tdata,
  m_axis_video_tuser,
  m_axis_video_tlast,
  probe_pixel_valid,
  probe_rgb565,
  probe_x,
  probe_y,
  probe_overflow
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pclk, ASSOCIATED_BUSIF m_axis_video, ASSOCIATED_RESET rstn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_pclk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 pclk CLK" *)
input wire pclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rstn RST" *)
input wire rstn;
input wire cam_vsync;
input wire cam_href;
input wire [7 : 0] cam_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TVALID" *)
output wire m_axis_video_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TREADY" *)
input wire m_axis_video_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TDATA" *)
output wire [23 : 0] m_axis_video_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TUSER" *)
output wire [0 : 0] m_axis_video_tuser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_video, TDATA_NUM_BYTES 3, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_pclk_0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_video TLAST" *)
output wire [0 : 0] m_axis_video_tlast;
output wire probe_pixel_valid;
output wire [15 : 0] probe_rgb565;
output wire [15 : 0] probe_x;
output wire [15 : 0] probe_y;
output wire probe_overflow;

  ov5640_dvp_to_axis #(
    .H_ACTIVE(640),
    .V_ACTIVE(480),
    .VSYNC_ACTIVE_HIGH(1'B1),
    .HREF_ACTIVE_HIGH(1'B1),
    .RGB565_BYTE_ORDER(1'B0)
  ) inst (
    .pclk(pclk),
    .rstn(rstn),
    .cam_vsync(cam_vsync),
    .cam_href(cam_href),
    .cam_data(cam_data),
    .m_axis_video_tvalid(m_axis_video_tvalid),
    .m_axis_video_tready(m_axis_video_tready),
    .m_axis_video_tdata(m_axis_video_tdata),
    .m_axis_video_tuser(m_axis_video_tuser),
    .m_axis_video_tlast(m_axis_video_tlast),
    .probe_pixel_valid(probe_pixel_valid),
    .probe_rgb565(probe_rgb565),
    .probe_x(probe_x),
    .probe_y(probe_y),
    .probe_overflow(probe_overflow)
  );
endmodule
