`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:32:04 01/11/2019 
// Design Name: 
// Module Name:    Signextend 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Signextend(in_16bit, out_32bit);

input [15:0] in_16bit;
output [31:0] out_32bit;

assign out_32bit[15:0] = in_16bit;
assign out_32bit[31:16] = (in_16bit[15])? 16'hffff:16'd0;

endmodule
