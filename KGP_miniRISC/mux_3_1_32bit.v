`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:00 10/26/2022 
// Design Name: 
// Module Name:    mux_3_1_32bit 
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
module mux_3_1_32bit(
    input [31:0] a,
	input [31:0] b,
	input [31:0] c,
	input [1:0] selectPin,
	output reg [31:0] res
    );

	always @(*)
	begin
		if(selectPin == 2'b00)
		begin
			res = a;
		end
		else if(selectPin == 2'b01)
		begin
			res = b;
		end
		else
		begin
			res = c;
		end
	end

endmodule
