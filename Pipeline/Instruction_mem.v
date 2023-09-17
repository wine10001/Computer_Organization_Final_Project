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
	//sub $10, $1, $3
	//00000000/00100011/00010000/00100010
	instr_mem[4]=8'b000000_00;
	instr_mem[5]=8'b001_00011;
	instr_mem[6]=8'b01010_000;
	instr_mem[7]=8'b00_100010;
	//and $12, $2, $5
	//00000000/01000101/01100000/00100100
	instr_mem[8]=8'b000000_00;
	instr_mem[9]=8'b010_00101;
	instr_mem[10]=8'b01100_000;
	instr_mem[11]=8'b00_100100;
	//or $13, $6, $2
	//00000000/11000010/01101000/00100101
	instr_mem[12]=8'b000000_00;
	instr_mem[13]=8'b110_00010;
	instr_mem[14]=8'b01101_000;
	instr_mem[15]=8'b00_100101;
	//add $14, $2, $2
	//00000000/01000010/01110000/00100000
	instr_mem[16]=8'b000000_00;
	instr_mem[17]=8'b010_00010;
	instr_mem[18]=8'b01110_000;
	instr_mem[19]=8'b00_100000;
	//sw $15, 100($2)
	//10101100/01001111/00000000/01100100
	instr_mem[20]=8'b101011_00;
	instr_mem[21]=8'b010_01111;
	instr_mem[22]=8'b00000000;
	instr_mem[23]=8'b01100100;
end

always@(*)
begin
	instruction = {instr_mem[PC], 
						instr_mem[PC + 1],
						instr_mem[PC + 2],
						instr_mem[PC + 3]};
end

endmodule
