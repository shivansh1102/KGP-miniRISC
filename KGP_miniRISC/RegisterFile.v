`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:44 10/21/2022 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
	input [4:0] readReg1,
	input [4:0] readReg2,
	input [4:0] writeReg,
	input clk,
	input rst,
	input [31:0] writeData,
	input writeControl, // control signal
	output [31:0] readData1,
	output [31:0] readData2
	);
	 
	reg signed [31:0] regFile [31:0];

	assign readData1 = regFile[readReg1];
	assign readData2 = regFile[readReg2];
	
	always @(posedge clk or posedge rst)
		begin
			if(rst)
			begin
				regFile[0]<=32'b00000000000000000000000000000000;
				regFile[1]<=32'b00000000000000000000000000000000;
				regFile[2]<=32'b00000000000000000000000000000000;
				regFile[3]<=32'b00000000000000000000000000000000;
				regFile[4]<=32'b00000000000000000000000000000000;
				regFile[5]<=32'b00000000000000000000000000000000;
				regFile[6]<=32'b00000000000000000000000000000000;
				regFile[7]<=32'b00000000000000000000000000000000;
				regFile[8]<=32'b00000000000000000000000000000000;
				regFile[9]<=32'b00000000000000000000000000000000;
				regFile[10]<=32'b00000000000000000000000000000000;
				regFile[11]<=32'b00000000000000000000000000000000;
				regFile[12]<=32'b00000000000000000000000000000000;
				regFile[13]<=32'b00000000000000000000000000000000;
				regFile[14]<=32'b00000000000000000000000000000000;
				regFile[15]<=32'b00000000000000000000000000000000;
				regFile[16]<=32'b00000000000000000000000000000000;
				regFile[17]<=32'b00000000000000000000000000000000;
				regFile[18]<=32'b00000000000000000000000000000000;
				regFile[19]<=32'b00000000000000000000000000000000;
				regFile[20]<=32'b00000000000000000000000000000000;
				regFile[21]<=32'b00000000000000000000000000000000;
				regFile[22]<=32'b00000000000000000000000000000000;
				regFile[23]<=32'b00000000000000000000000000000000;
				regFile[24]<=32'b00000000000000000000000000000000;
				regFile[25]<=32'b00000000000000000000000000000000;
				regFile[26]<=32'b00000000000000000000000000000000;
				regFile[27]<=32'b00000000000000000000000000000000;
				regFile[28]<=32'b00000000000000000000000000000000;
				regFile[29]<=32'b00000000000000000000000000000000;
				regFile[30]<=32'b00000000000000000000000000000000;
				regFile[31]<=32'b00000000000000000000000000000000;
			end
			else if (writeControl)
			begin
				regFile[writeReg] <= writeData;
			end
		end
		
endmodule

