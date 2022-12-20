`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:06 10/21/2022 
// Design Name: 
// Module Name:    Program_counter 
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
module Program_counter(
	input [31:0] updatedAddress,
	input clk,
	input rst,
	output reg[31:0] currAddress
   );
	
	always @(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			currAddress <= -32'b1;
		end
		else if(updatedAddress > 32'd1000)
		begin
			currAddress <= 32'd1000;
		end
		else
		begin
			currAddress <= updatedAddress;
		end
	end

endmodule
