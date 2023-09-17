`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:07:43 01/11/2019 
// Design Name: 
// Module Name:    main 
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
module main(Rs, Rt, aluop, aluresult, zero, ins, aludata2, PC, clk, writereg, writeda, readda1, readda2, jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch);

input clk;

//IF
output [31:0] ins;
wire [31:0] branch_PC, normal_PC, next_PC, jump_PC, temp_PC;
output reg [31:0] PC;

initial
begin
	PC = 32'd0;
end

Instruction_mem Instr_mem(.PC(PC), .instruction(ins));

assign normal_PC = PC + 32'd4;
assign branch_PC = normal_PC + offset;
assign jump_PC = {normal_PC[31:28], ins[25:0], 2'd0};

assign temp_PC = (branch & zero)?branch_PC:normal_PC;
assign next_PC = (jump)?jump_PC:temp_PC;

always@(posedge clk)
begin
	PC <= next_PC;
end

// ID
output [4:0] writereg, Rs, Rt;
output [31:0] writeda, readda1, readda2;
output jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch;
output [1:0] aluop;
wire [31:0] byte_offset_or_imm;

assign writereg = (regdst)?ins[15:11]:ins[20:16];
assign {Rs, Rt} = ins[25:16];

Registers Registers(.regwrite(regwrite), .readreg1(ins[25:21]), .readreg2(ins[20:16]), .writereg(writereg), .writeda(writeda), .clk(clk), .readda1(readda1), .readda2(readda2));
Control Control(.op(ins[31:26]), .jump(jump), .regdst(regdst), .alusrc(alusrc), .memtoreg(memtoreg), .regwrite(regwrite),.memread(memread),.memwrite(memwrite),.branch(branch),.aluop(aluop));
Signextend Signextend(.in_16bit(ins[15:0]), .out_32bit(byte_offset_or_imm));

//EX
wire [31:0] offset, imm;
wire [3:0] aluctrl;
output zero;
output [31:0] aludata2;
output [31:0] aluresult;

assign offset = {byte_offset_or_imm[29:0], 2'd0};
assign imm = byte_offset_or_imm;
assign aludata2 = (alusrc)?imm:readda2;

ALUControl ALUControl(.ALUop(aluop), .funct(ins[5:0]), .ALUctrl(aluctrl));
ALU ALU(.readdata1(readda1), .readdata2(aludata2), .ALUctrl(aluctrl), .zeroflag(zero), .ALUresult(aluresult));

//MEM
wire [31:0] mem_rd;

Data_mem Data_mem(.add(aluresult),.wd(readda2),.mw(memwrite),.mre(memread),.rd(mem_rd),.clk(clk));

//WB
assign writeda = (memtoreg)?mem_rd:aluresult;

endmodule
