`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2023 02:37:11 PM
// Design Name: 
// Module Name: sync_w2r
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


module sync_w2r #(parameter addr_width=4)
  (output reg [addr_width:0] rq2_wptr,
  input rclk, rrst,
input [addr_width:0] wptr);

reg[addr_width:0] rq1_wptr;
always @(posedge rclk or posedge rrst )
   if(rrst)
	{rq2_wptr,rq1_wptr} <=0;
	else
	{rq2_wptr,rq1_wptr}  <= {rq1_wptr,wptr};


endmodule

