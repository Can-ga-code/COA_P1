`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 02:22:27 AM
// Design Name: 
// Module Name: Ins_decoder
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


module Ins_decoder(
 input wire [7:0]instruct,
 output [2:0]opcode,
 output rt_rd,rs,
 output [2:0]signIn
 );
 assign opcode=instruct[7:5];
 assign rt_rd=instruct[4];
 assign rs=instruct[3];
 assign signIn=instruct[2:0];
endmodule
