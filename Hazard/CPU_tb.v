`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:37:19 01/11/2019
// Design Name:   main
// Module Name:   D:/Xilinx/CPU/CPU_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_tb;

	// Inputs
	reg clk;
	
	wire [4:0] ID_Rs, ID_Rt, MEM_writereg, WB_writereg;
	wire [31:0] IF_ins, IF_PC, MEM_aluresult, MEM_readda2, EX_real_aludata1, EX_real_aludata2, WB_writeda;
	wire [1:0] ForwardA, ForwardB;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk),
		.IF_ins(IF_ins),
		.IF_PC(IF_PC),
		.ID_Rs(ID_Rs),
		.ID_Rt(ID_Rt),
		.EX_real_aludata1(EX_real_aludata1),
		.EX_real_aludata2(EX_real_aludata2),
		.ForwardA(ForwardA),
		.ForwardB(ForwardB),
		.MEM_aluresult(MEM_aluresult),
		.MEM_readda2(MEM_readda2),
		.MEM_writereg(MEM_writereg),
		.WB_writereg(WB_writereg),
		.WB_writeda(WB_writeda)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		
		#1100 $finish;
	end
	
	always #50 clk = ~clk;
      
endmodule

