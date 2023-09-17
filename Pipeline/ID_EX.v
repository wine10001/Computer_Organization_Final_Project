`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:44:11 01/12/2019 
// Design Name: 
// Module Name:    ID_EX 
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
module ID_EX(clk, EX_regdst, EX_alusrc, EX_memtoreg, EX_regwrite, EX_memread, EX_memwrite, EX_branch, EX_aluop, EX_PC, EX_Rt, EX_Rd, EX_readda1, EX_readda2, EX_byte_offset_or_imm,
				ID_regdst, ID_alusrc, ID_memtoreg, ID_regwrite, ID_memread, ID_memwrite, ID_branch, ID_aluop, ID_PC, ID_Rt, ID_Rd, ID_readda1, ID_readda2, ID_byte_offset_or_imm);

input clk;
input ID_regdst, ID_alusrc, ID_memtoreg, ID_regwrite, ID_memread, ID_memwrite, ID_branch;
input [1:0] ID_aluop;
input [31:0] ID_PC;
input [4:0] ID_Rt, ID_Rd;
input [31:0] ID_readda1, ID_readda2;
input [31:0] ID_byte_offset_or_imm;

output reg EX_regdst, EX_alusrc, EX_memtoreg, EX_regwrite, EX_memread, EX_memwrite, EX_branch;
output reg [1:0] EX_aluop;
output reg [31:0] EX_PC;
output reg [4:0] EX_Rt, EX_Rd;
output reg [31:0] EX_readda1, EX_readda2;
output reg [31:0] EX_byte_offset_or_imm;

always@(posedge clk)
begin
	{EX_regdst, EX_alusrc, EX_memtoreg, EX_regwrite, EX_memread, EX_memwrite, EX_branch} <= {ID_regdst, ID_alusrc, ID_memtoreg, ID_regwrite, ID_memread, ID_memwrite, ID_branch};
	EX_aluop <= ID_aluop;
	EX_PC <= ID_PC;
	{EX_Rt, EX_Rd} <= {ID_Rt, ID_Rd};
	{EX_readda1, EX_readda2} <= {ID_readda1, ID_readda2};
	EX_byte_offset_or_imm <= ID_byte_offset_or_imm;
end

endmodule
