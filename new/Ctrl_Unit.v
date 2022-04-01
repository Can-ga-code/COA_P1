`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 12:10:09 AM
// Design Name: 
// Module Name: Ctrl_Unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Ctrl_Unit(opcode, MemRead,MemtoReg, ALUOp,MemWrite,ALUSrc,RegWrite);
input [2:0] opcode;
output reg MemRead,MemtoReg, ALUOp,MemWrite,ALUSrc,RegWrite;
    //3'b001 --> load
    //3'b100 --> add
    //3'b110 --> sub
    //3'b010 --> save
 always @(*)
 begin
    case(opcode)
    //R type add
    3'b100: 
    begin
    MemRead<=0;
    MemtoReg<=0;
    ALUOp<=1'b0; 
    MemWrite<=0;
    ALUSrc<=0;
    RegWrite<=1;
    end
    //R type sub
    3'b110: 
    begin
    MemRead<=0;
    MemtoReg<=0;
    ALUOp<=1'b1; 
    MemWrite<=0;
    ALUSrc<=0;
    RegWrite<=1;
    end
    //load I type
    3'b001: 
    begin
    MemRead<=1;
    MemtoReg<=1;
    ALUOp<=1'b0;
    MemWrite<=0;
    ALUSrc<=1;
    RegWrite<=1;
    end
    //Save I type
    3'b010: 
    begin
    MemRead<=0;
    MemtoReg<=0;
    ALUOp<=1'b0;
    MemWrite<=1;
    ALUSrc<=1;
    RegWrite<=0;
    end
  endcase       
  end
  endmodule
