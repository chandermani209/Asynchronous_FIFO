`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2023 02:37:11 PM
// Design Name: 
// Module Name: Async_fifo
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


module Async_fifo #(parameter data_width = 8,
                    parameter address_width = 4)
						  (output [data_width-1:0] rdata,
						  output  wfull,
						  output rempty,
						  input[data_width-1:0] wdata,
						  input  winc,wclk,wrst,
						  input  rinc,rclk,rrst);
						  
						  
wire[address_width-1:0] waddr,raddr;
wire[address_width:0]  wptr,rptr,wq2_rptr,rq2_wptr;



sync_r2w sr2w( wq2_rptr, wclk, wrst, rptr);
sync_w2r sw2r( rq2_wptr, rclk, rrst, wptr);


fifmem fifo(rdata, wdata, waddr,raddr, wclk,winc,wfull);


rptr_empty r_empty(rempty,raddr, rptr, rq2_wptr, rinc,rclk,rrst) ;


 wptr_full wfull_r(wfull, waddr, wptr, wq2_rptr,winc, wclk , wrst); 



endmodule
