`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2023 02:37:11 PM
// Design Name: 
// Module Name: wptr_full
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



module wptr_full #(parameter address_width = 4)
(output reg wfull,
output[address_width-1:0] waddr,
output reg [address_width:0] wptr,
input[address_width :0] wq2_rptr,
input   winc, wclk , wrst); 

reg [address_width:0] wbin;
wire [address_width:0] wgray_next,wbin_next;
wire wfull_value ;

always @(posedge wclk, posedge wrst)
   if(wrst)
	  {wbin, wptr} <= 0 ;
	 else
	 {wbin,wptr} <= {wbin_next,wgray_next};
	 
assign waddr = wbin[address_width-1:0];

assign wbin_next = wbin +(winc & ~wfull);

assign wgray_next = (wbin_next>>1)^wbin_next ;


assign  wfull_value =(wgray_next[address_width] !=wq2_rptr[address_width])  &&
                      (wgray_next[address_width-1] !=wq2_rptr[address_width-1]) &&
							 (wgray_next[address_width-2:0] ==wq2_rptr[address_width-2:0]);
							 
always @(posedge wclk  or posedge wrst)
   if(wrst)
	   wfull <= 1'b0 ;
	else 
	 wfull <= wfull_value ;
 
endmodule