`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:56 10/21/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU(input signed[31:0] a, input signed[31:0] b, input[3:0] ALUSel, output reg sign, output zero, output reg carry,output reg[31:0] result);

	wire[31:0] adderRes;
	wire[31:0] complRes;
	wire[31:0] xorRes;
	wire[31:0] andRes;
	wire[31:0] shiftRes;
	wire carry_out;
	wire[31:0] diffRes;
	wire[31:0] onesComp;

	// for addition
	Adder add1(.a(a), .b(b), .c_in(1'b0), .sum(adderRes), .c_out(carry_out));

	// for complement 
	assign onesComp = ~b;
	Adder add2(.a(onesComp), .b(0), .c_in(1'b1),.sum(complRes), .c_out());

	// for XOR, AND
	assign xorRes = a^b;
	assign andRes = a&b;

	// for shifting 'a' by 'b'
	Shifter shift1(.a(a), .shiftamt(b), .op1(ALUSel[0]), .op2(ALUSel[1]), .res(shiftRes));

	// finding LSB where 'a' and 'b' differ
	Diff diff1(.a(a), .b(b), .ind(diffRes));


	always @(*) 
		begin
			case (ALUSel)
				4'b0000: begin
					result = adderRes;
					carry = carry_out;
				end
				4'b0001: result = complRes;
				4'b0010: result = andRes;
				4'b0011: result = xorRes;
				4'b0100: result = shiftRes;
				4'b0101: result = shiftRes;
				4'b0110: result = shiftRes;
				4'b1001: result = diffRes;
				default: result = a;
			endcase
		end

	assign zero = (result==0)?1'b1:1'b0;
	always@(result)
		begin
			if(result[31]==1'b0)sign=1'b0;
			else sign = 1'b1;
		end

endmodule