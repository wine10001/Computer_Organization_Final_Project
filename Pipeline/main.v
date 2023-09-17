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
module main(clk, IF_ins, IF_PC, ID_Rs, ID_Rt, EX_readda1, EX_readda2, MEM_aluresult, MEM_readda2, MEM_writereg, WB_writereg, WB_writeda);

input clk;

//IF
output [31:0] IF_ins;
wire [31:0] IF_normal_PC, MEM_branch_PC, IF_jump_PC;
output reg [31:0] IF_PC;

initial
begin
	IF_PC = 32'd0;
end

Instruction_mem Instr_mem(.PC(IF_PC), .instruction(IF_ins));

assign IF_normal_PC = IF_PC + 32'd4;

always@(posedge clk)
begin
	if (ID_jump) IF_PC <= ID_jump_PC;
	else
	begin
		case(MEM_PCsrc)
			1'b0: IF_PC <= IF_normal_PC;
			1'b1: IF_PC <= MEM_branch_PC;
		endcase
	end
end

//IF-ID
wire [31:0] ID_PC, ID_ins;
IF_ID IF_ID(clk, IF_normal_PC, IF_ins, ID_PC, ID_ins);

// ID
wire [31:0] ID_jump_PC;
output [4:0] WB_writereg;
output [31:0] WB_writeda;
wire [31:0] ID_readda1, ID_readda2;
wire ID_jump, ID_regdst, ID_alusrc, ID_memtoreg, WB_regwrite, ID_memread, ID_memwrite, ID_branch;
wire [1:0] ID_aluop;
wire [31:0] ID_byte_offset_or_imm;
output [4:0] ID_Rs, ID_Rt;

assign {ID_Rs, ID_Rt} = ID_ins[25:16];

assign ID_jump_PC = {ID_PC[31:28], ID_ins[25:0], 2'd0};

Control Control(.op(ID_ins[31:26]), .jump(ID_jump), .regdst(ID_regdst), .alusrc(ID_alusrc), .memtoreg(ID_memtoreg), .regwrite(ID_regwrite),.memread(ID_memread),.memwrite(ID_memwrite),.branch(ID_branch),.aluop(ID_aluop));
Registers Registers(.regwrite(WB_regwrite), .readreg1(ID_ins[25:21]), .readreg2(ID_ins[20:16]), .writereg(WB_writereg), .writeda(WB_writeda), .clk(clk), .readda1(ID_readda1), .readda2(ID_readda2));
Signextend Signextend(.in_16bit(ID_ins[15:0]), .out_32bit(ID_byte_offset_or_imm));

//ID-EX
wire EX_regdst, EX_alusrc, EX_memtoreg, EX_regwrite, EX_memread, EX_memwrite, EX_branch;
wire [1:0] EX_aluop;
wire [31:0] EX_PC, EX_branch_PC;
wire [4:0] EX_Rt, EX_Rd, EX_writereg;
output [31:0] EX_readda1, EX_readda2;
wire [31:0] EX_byte_offset_or_imm;
ID_EX ID_EX(clk, EX_regdst, EX_alusrc, EX_memtoreg, EX_regwrite, EX_memread, EX_memwrite, EX_branch, EX_aluop, EX_PC, EX_Rt, EX_Rd, EX_readda1, EX_readda2, EX_byte_offset_or_imm,
				ID_regdst, ID_alusrc, ID_memtoreg, ID_regwrite, ID_memread, ID_memwrite, ID_branch, ID_aluop, ID_PC, ID_ins[20:16], ID_ins[15:11], ID_readda1, ID_readda2, ID_byte_offset_or_imm);

//EX
wire [3:0] EX_aluctrl;
wire EX_zero;
wire [31:0] EX_aludata2, EX_aluresult, EX_offset, EX_imm;

assign EX_offset = {EX_byte_offset_or_imm[29:0], 2'd0};
assign EX_branch_PC = EX_PC + EX_offset;

assign EX_imm = EX_byte_offset_or_imm;
assign EX_aludata2 = (EX_alusrc)?EX_imm:EX_readda2;

assign EX_writereg = (EX_regdst)?EX_Rd:EX_Rt;

ALUControl ALUControl(.ALUop(EX_aluop), .funct(EX_byte_offset_or_imm[5:0]), .ALUctrl(EX_aluctrl));
ALU ALU(.readdata1(EX_readda1), .readdata2(EX_aludata2), .ALUctrl(EX_aluctrl), .zeroflag(EX_zero), .ALUresult(EX_aluresult));

//EX-MEM
wire MEM_memtoreg, MEM_regwrite, MEM_memread, MEM_memwrite, MEM_branch;
wire MEM_zero;
output [31:0] MEM_aluresult, MEM_readda2;
output [4:0] MEM_writereg;
EX_MEM EX_MEM(clk, MEM_memtoreg, MEM_regwrite, MEM_memread, MEM_memwrite, MEM_branch, MEM_branch_PC, MEM_zero, MEM_aluresult, MEM_readda2, MEM_writereg,
				EX_memtoreg, EX_regwrite, EX_memread, EX_memwrite, EX_branch, EX_branch_PC, EX_zero, EX_aluresult, EX_readda2, EX_writereg);

//MEM
wire [31:0] MEM_rd;
wire [1:0] MEM_PCsrc;

assign MEM_PCsrc = (MEM_branch & MEM_zero)? 1'b1:1'b0;

Data_mem Data_mem(.add(MEM_aluresult),.wd(MEM_readda2),.mw(MEM_memwrite),.mre(MEM_memread),.rd(MEM_rd),.clk(clk));

//MEM-WB
wire WB_memtoreg;
wire [31:0] WB_rd, WB_aluresult;
MEM_WB MEM_WB(clk, WB_memtoreg, WB_regwrite, WB_rd, WB_aluresult, WB_writereg,
				MEM_memtoreg, MEM_regwrite, MEM_rd, MEM_aluresult, MEM_writereg);

//WB
assign WB_writeda = (WB_memtoreg)? WB_rd:WB_aluresult;

endmodule
