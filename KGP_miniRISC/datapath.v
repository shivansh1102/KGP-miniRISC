`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:51:13 10/26/2022 
// Design Name: 
// Module Name:    datapath 
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
module datapath(input clk, 
					input rst, 
					input[1:0] regDst, 
					input regWrite, 
					input memWrite, 
					input memRead, 
					input ALUSrc, 
					input[3:0] ALUSel, 
					input[3:0] BrhSel, 
					input LblSel, 
					input JumpAddr, 
					input[1:0] MemtoReg, 
					input hold,
					input [9:0] inpAddr,
					output[5:0] opcodeOut, 
					output[5:0] funcOut, 
					output[31:0] writeOut);

wire[31:0] currAddress; 
wire[31:0] updatedAddress, nextAddress;
wire[5:0] opcode, func;
wire[4:0] rs, rt;
wire[15:0] imm;
wire[20:0] label1;
wire[25:0] label0;
wire[4:0] writeReg;
wire[31:0] writeData, readData1, readData2, immSham, aluB, result, memReadData, instr, resAddr;
wire carry, zero, sign, branch, enable;

assign enable = memRead | memWrite;

Program_counter PC(.updatedAddress(updatedAddress), .clk(clk), .rst(rst), .currAddress(currAddress));

bram_instr_mem instructionMemory(.clka(clk), .addra(updatedAddress[9:0]),.douta(instr));

Instruction_Decode instrDcode(.instr(instr), .opcode(opcode), .func(func), .label0(label0), .label1(label1), .rs(rs), .rt(rt), .imm(imm));

mux_3_1_5bit mux3_1(.a(rs), .b(rt), .c(5'b11111), .selectPin(regDst), .res(writeReg));

RegisterFile regFile(.readReg1(rs), .readReg2(rt), .writeReg(writeReg), .clk(clk), .rst(rst), .writeData(writeData), .writeControl(regWrite), .readData1(readData1), .readData2(readData2));

sign_extend_16_to_31 extendImm(.opcode(opcode), .priorBits(imm), .resultBits(immSham));

mux_2_1 mux2a(.a(readData2), .b(immSham), .selectPin(ALUSrc), .res(aluB));

ALU alu(.a(readData1), .b(aluB), .ALUSel(ALUSel), .sign(sign), .zero(zero), .carry(carry), .result(result));

Jump_control jump1(.signBit(sign), .zeroBit(zero), .carryBit(carry), .brhSel(BrhSel), .resJump(branch));

PC_add addPC(.curr(currAddress), .next(nextAddress));

branch_unit branch1(.nextAddress(nextAddress), .readData1(readData1), .label0(label0), .label1(label1), .LblSel(LblSel), .JumpAddr(JumpAddr), .branch(branch), .nextAddr(updatedAddress));

mux_2_1 mux2b(.a(result[9:0]), .b(inpAddr), .selectPin(hold), .res(resAddr));

bram_data_mem dataMem (.clka(~clk), .ena(1'b1), .wea(memWrite), .addra(resAddr), .dina(readData2), .douta(memReadData));

mux_3_1_32bit mux32a(.a(nextAddress), .b(memReadData), .c(result), .selectPin(MemtoReg), .res(writeData));

assign opcodeOut = opcode;
assign funcOut = func;
assign writeOut = memReadData;


endmodule
