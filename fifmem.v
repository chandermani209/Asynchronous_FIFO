`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2023 02:37:11 PM
// Design Name: 
// Module Name: fifmem
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


module fifmem #(parameter data_width = 8,
parameter address_width = 4)
(output [data_width-1:0] rdata,
input[data_width-1:0] wdata,
input[address_width-1:0] waddr,raddr,
input wclk,wclken,wfull);

localparam depth = 1<<address_width;
reg[data_width-1:0] mem[0:depth-1] ;

assign rdata= mem[raddr];

always @(posedge wclk)
if(wclken && !wfull)
  begin
  mem[waddr] <= wdata; 
  end
  
endmodule
