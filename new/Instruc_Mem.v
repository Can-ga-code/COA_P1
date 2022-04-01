`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 12:33:41 AM
// Design Name: 
// Module Name: Instruc_Mem
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



module Instruc_Mem(input[7:0] counter,output[7:0] instruct);
    reg [7:0] mem[255:0];
    initial
    begin
    $readmemh("test.mem", mem);
 end
 // assigning the value from test file to instruction
 assign instruct =  mem[counter];
endmodule

