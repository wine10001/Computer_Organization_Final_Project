`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:27 01/11/2019 
// Design Name: 
// Module Name:    Control 
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
module Control(op, jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop);
input [5:0] op;
output reg jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch;
output reg [1:0] aluop;

initial
begin
	{jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop[1], aluop[0]} = 10'd0;
end

always@(*)
begin
	case(op)
		6'b000000: {jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop[1], aluop[0]} = 10'b0100100010;
		6'b100011: {jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop[1], aluop[0]} = 10'b0011110000;
		6'b101011: {jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop[1], aluop[0]} = 10'b0010001000;
		6'b001000: {jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop[1], aluop[0]} = 10'b0010100000;
		6'b000100: {jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop[1], aluop[0]} = 10'b0000000101;
		6'b000010: {jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop[1], aluop[0]} = 10'b1000000000;
		default: {jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop[1], aluop[0]} = 10'd0;
	endcase
end

endmodule
