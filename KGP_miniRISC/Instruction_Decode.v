`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:50:19 11/04/2022 
// Design Name: 
// Module Name:    Instruction_Decode 
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

module Instruction_Decode (
    input [31:0] instr,
    output [5:0] opcode,
    output [5:0] func,
    output [25:0] label0,
    output [20:0] label1,
    output [4:0] rs,
    output [4:0] rt,
    output [15:0] imm
);

    assign opcode = instr[31:26];     // Opcode
    assign func = instr[5:0];         // Function code
    assign label0 = instr[25:0];      // Jump address for 26-bit addresses
    assign label1 = instr[20:0];      // Jump address for 16-bit addresses
    assign rs = instr[25:21];         // Register rs
    assign rt = instr[20:16];         // Register rt
    assign imm = instr[15:0];         // Immediate value
    
endmodule
