`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:42 10/21/2022 
// Design Name: 
// Module Name:    Adder 
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
module Adder(input[31:0] a, input[31:0] b, input c_in, output[31:0] sum, output c_out);

	wire c_out1;        
	CLA_16bit CLA1 (.a(a[15:0]), .b(b[15:0]), .c_in(c_in), .sum(sum[15:0]), .c_out(c_out1));
	CLA_16bit CLA2 (.a(a[31:16]), .b(b[31:16]), .c_in(c_out1), .sum(sum[31:16]), .c_out(c_out));

endmodule
