`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:57:21 09/14/2022 
// Design Name: 
// Module Name:    clock_divider 
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
module clock_divider(input clk_in, output reg clk_out);

reg[31:0] count=32'd0;
parameter FACTOR = 32'd500;

always @(posedge clk_in)
	begin
		count<=count+32'd1;
		if(count>=(FACTOR-1))count<=32'd0;
		if(count<FACTOR/2)clk_out<=1'b1;
		else clk_out<=1'b0;
	end

endmodule

