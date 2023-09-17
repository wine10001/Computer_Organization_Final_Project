`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:35:40 01/11/2019
// Design Name:   Registers
// Module Name:   D:/Xilinx/CPU/Reg_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Registers
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Reg_tb;

	// Inputs
	reg [4:0] writereg;
	reg clk;
	reg [4:0] readreg1;
	reg [4:0] readreg2;
	reg [31:0] writeda;
	reg regwrite;

	// Outputs
	wire [31:0] readda1;
	wire [31:0] readda2;

	// Instantiate the Unit Under Test (UUT)
	Registers uut (
		.writereg(writereg), 
		.clk(clk), 
		.readreg1(readreg1), 
		.readreg2(readreg2), 
		.writeda(writeda), 
		.regwrite(regwrite), 
		.readda1(readda1), 
		.readda2(readda2)
	);
	
	always #50 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		writereg = 6;
		clk = 0;
		readreg1 = 1;
		readreg2 = 3;
		writeda = 5;
		regwrite = 1;

		// Wait 100 ns for global reset to finish
      #200 $finish;
		// Add stimulus here

	end
      
endmodule

