`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:34:10 01/11/2019
// Design Name:   Instruction_mem
// Module Name:   D:/Xilinx/CPU/Instr_mem_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Instruction_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Instr_mem_tb;

	// Inputs
	reg [31:0] PC;

	// Outputs
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	Instruction_mem uut (
		.instruction(instruction), 
		.PC(PC)
	);

	initial begin
		// Initialize Inputs
		PC = 0;

		// Wait 100 ns for global reset to finish
		#100 PC = 4;
		#100 PC = 8;
		#100 PC = 12;
		#100 PC = 16;
        
		// Add stimulus here

	end
      
endmodule

