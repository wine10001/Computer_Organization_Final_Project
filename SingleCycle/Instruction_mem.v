`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:55 01/11/2019 
// Design Name: 
// Module Name:    Instruction_mem 
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
module Instruction_mem(instruction, PC);

input [31:0] PC;
output reg [31:0] instruction;
reg [7:0] instr_mem [31:0];

initial
begin
	//jump 12
	instr_mem[0]=8'b000010_00;
	instr_mem[1]=8'b000_00000;
	instr_mem[2]=8'b00000_000;
	instr_mem[3]=8'b00_000011;
	//addi $t1, $s0, 400
	instr_mem[12]=8'b001000_10;
	instr_mem[13]=8'b000_01001;
	instr_mem[14]=8'b00000_001;
	instr_mem[15]=8'b10_010000;
	//lw $t3, 0($t2)
	instr_mem[16]=8'b100011_01;
	instr_mem[17]=8'b010_01011;
	instr_mem[18]=8'b00000_000;
	instr_mem[19]=8'b00_000000;
	//add $s2, $s2, $s1
	instr_mem[20]=8'b000000_10;
	instr_mem[21]=8'b010_10001;
	instr_mem[22]=8'b10010_000;
	instr_mem[23]=8'b00_100000;
	//addi $t1, $t1, -4
	instr_mem[24]=8'b001000_01;
	instr_mem[25]=8'b001_01001;
	instr_mem[26]=8'b111_11111;
	instr_mem[27]=8'b11_111100;
	//beq $t2, $t4, returntoJUMP
	instr_mem[28]=8'b000100_01;
	instr_mem[29]=8'b100_01010;
	instr_mem[30]=8'b11111111;
	instr_mem[31]=8'b11111000;
end

always@(*)
begin
	instruction = {instr_mem[PC], 
						instr_mem[PC + 1],
						instr_mem[PC + 2],
						instr_mem[PC + 3]};
end

endmodule
