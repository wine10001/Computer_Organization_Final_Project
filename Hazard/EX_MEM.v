`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:44:24 01/12/2019 
// Design Name: 
// Module Name:    EX_MEM 
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
module EX_MEM(clk, MEM_memtoreg, MEM_regwrite, MEM_memread, MEM_memwrite, MEM_branch, MEM_branch_PC, MEM_zero, MEM_aluresult, MEM_readda2, MEM_writereg,
				EX_memtoreg, EX_regwrite, EX_memread, EX_memwrite, EX_branch, EX_branch_PC, EX_zero, EX_aluresult, EX_readda2, EX_writereg);

input clk;
input EX_memtoreg, EX_regwrite, EX_memread, EX_memwrite, EX_branch;
input [31:0] EX_branch_PC;
input EX_zero;
input [31:0] EX_aluresult, EX_readda2;
input [4:0] EX_writereg;

output reg MEM_memtoreg, MEM_regwrite, MEM_memread, MEM_memwrite, MEM_branch;
output reg [31:0] MEM_branch_PC;
output reg MEM_zero;
output reg [31:0] MEM_aluresult, MEM_readda2;
output reg [4:0] MEM_writereg;

always@(posedge clk)
begin
	{MEM_memtoreg, MEM_regwrite, MEM_memread, MEM_memwrite, MEM_branch} <= {EX_memtoreg, EX_regwrite, EX_memread, EX_memwrite, EX_branch};
	MEM_branch_PC <= EX_branch_PC;
	MEM_zero <= EX_zero;
	{MEM_aluresult, MEM_readda2} <= {EX_aluresult, EX_readda2};
	MEM_writereg <= EX_writereg;
end

endmodule
