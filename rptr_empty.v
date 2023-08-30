`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2023 02:37:11 PM
// Design Name: 
// Module Name: rptr_empty
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
module rptr_empty #(parameter address_width = 4)
(output reg rempty,
output[address_width-1:0] raddr,
output reg [address_width:0] rptr,
input  [address_width :0] rq2_wptr,
input rinc,rclk,rrst) ;

reg [address_width:0] rbin;
wire [address_width:0] rgray_next,rbin_next ;


always @(posedge rclk or posedge rrst)
    if(rrst) {rbin,rptr} <= 0 ;
	 else {rbin,rptr} <= {rbin_next, rgray_next};

assign raddr = rbin[address_width-1:0];


assign rbin_next = rbin + (rinc& ~rempty);

assign rgray_next = (rbin_next>>1)^rbin_next;


always @(posedge rclk or posedge rrst) begin
  if(rrst) rempty <= 1'b1;
  else rempty <= {rgray_next==rq2_wptr};

end
endmodule