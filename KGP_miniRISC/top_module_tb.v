`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:00:40 11/08/2022
// Design Name:   top_module
// Module Name:   /home/likhith26090/Documents/projects/COA/KGP_miniRISC/top_module_tb.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_module_tb;

	// Inputs
	reg clk;
	reg rst;
	reg hold;
	reg [9:0] addr;
	
	wire[15:0] writeOut;

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.clk_in(clk), 
		.rst(rst),
		.hold(hold),
		.addr(addr),
		.writeOut(writeOut)
	);
	
	always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		hold = 0;
		addr = 0;
		
		// Wait 100 ns for global reset to finish
		#20;
		rst = 0;
      #100000;
		hold = 1;
		addr = 16'd0;
		#100;
		addr = 16'd1;
		// Add stimulus here

	end
      
endmodule

