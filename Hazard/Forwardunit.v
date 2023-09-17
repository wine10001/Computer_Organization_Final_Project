`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:19:11 01/12/2019 
// Design Name: 
// Module Name:    Forwardunit 
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
module Forwardunit(ForwardA, ForwardB, EX_Rs, EX_Rt, MEM_regwrite, MEM_writereg, WB_regwrite, WB_writereg);

input [4:0] EX_Rs, EX_Rt, MEM_writereg, WB_writereg;
input MEM_regwrite, WB_regwrite;

output reg [1:0] ForwardA, ForwardB;

always@(*)
begin
	if(MEM_regwrite && (MEM_writereg != 0) && (EX_Rs == MEM_writereg)) ForwardA = 2'd1;
	else if (WB_regwrite && (WB_writereg != 0) && (EX_Rs == WB_writereg)) ForwardA = 2'd2;
	else ForwardA = 2'd0;
end

always@(*)
begin
	if(MEM_regwrite && (MEM_writereg != 0) && (EX_Rt == MEM_writereg)) ForwardB = 2'd1;
	else if (WB_regwrite && (WB_writereg != 0) && (EX_Rt == WB_writereg)) ForwardB = 2'd2;
	else ForwardB = 2'd0;
end

endmodule
