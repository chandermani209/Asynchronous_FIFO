`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2023 02:37:11 PM
// Design Name: 
// Module Name: sync_r2w
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


module sync_r2w #(parameter addr_width=4)
  (output reg [addr_width:0] wq2_rptr,
  input wclk, wrst,
input [addr_width:0] rptr);

reg[addr_width:0] wq1_rptr;
always @(posedge wclk or posedge wrst )
   if(wrst)
	{wq2_rptr,wq1_rptr} <=0;
	else
	{wq2_rptr,wq1_rptr}  <= {wq1_rptr,rptr};


endmodule
