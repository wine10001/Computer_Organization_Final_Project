`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:43:56 01/12/2019 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(clk, IF_PC, IF_ins, ID_PC, ID_ins);

input clk;
input [31:0] IF_PC, IF_ins;
output reg [31:0] ID_PC, ID_ins;

always@(posedge clk)
begin
	ID_PC <= IF_PC;
	ID_ins <= IF_ins;
end

endmodule
