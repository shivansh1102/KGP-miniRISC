`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:56:59 11/04/2022 
// Design Name: 
// Module Name:    top_module 
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
module top_module(input clk_in, input rst, input hold, input [9:0] addr, output reg[15:0] writeOut);

wire[5:0] opcode, func;
wire[1:0] regDst;
wire regWrite, memRead, memWrite, jumpAddr, lblSel;
wire[3:0] brhSel, aluSel;
wire[2:0] aluOp;
wire[1:0] memToReg;
wire aluSrc;
wire[31:0] writeregData;
wire clk;

clock_divider cd(.clk_in(clk_in), .clk_out(clk));

Control_unit cntrl( .opcode(opcode), .regDst(regDst),.regWrite(regWrite),.memRead(memRead),.memWrite(memWrite),.memToReg(memToReg),.jumpAddr(jumpAddr), .lblSel(lblSel), .brhSel(brhSel),.aluOp(aluOp));

ALU_control_unit aluCntrl(.funct(func), .aluOp(aluOp), .aluSrc(aluSrc), .aluSel(aluSel));

datapath dp(.clk(clk), .rst(rst), .regDst(regDst), .regWrite(regWrite), .memRead(memRead), .memWrite(memWrite), .ALUSrc(aluSrc), .ALUSel(aluSel), .BrhSel(brhSel), .LblSel(lblSel), .JumpAddr(jumpAddr), .MemtoReg(memToReg), .hold(hold), .inpAddr(addr), .opcodeOut(opcode), .funcOut(func), .writeOut(writeregData));

always@(posedge clk)
begin
	if(rst==1'b1)begin
		writeOut<=16'b0;
	end
	else
	begin 
		writeOut <= writeregData;
	end	
end


endmodule
