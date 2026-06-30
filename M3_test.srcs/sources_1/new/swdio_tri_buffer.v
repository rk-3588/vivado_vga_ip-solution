`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/06/29 18:33:47
// Design Name: 
// Module Name: swdio_tri_buffer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module swdio_tri_buffer
(
    input swd_o,
    output swd_i,
    input swd_oe,
    inout swd_io
);
IOBUF swd_iobuf_inst(
    .O(swd_i),
    .I(swd_o),
    .IO(swd_io),
    .T(~swd_oe)
);
endmodule
