`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2022 01:49:26 PM
// Design Name: 
// Module Name: Multiplexer_1
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


module Multiplexer_1(

    input [7:0] input0,
    input [7:0] input1,
    input condition,
    output reg [7:0] outputMux
    ); 
    always @(input0,input1,condition)
    begin
        if(condition == 0) 
            outputMux = input0; 
        else
            outputMux = input1;
        $display("outputMux",outputMux);
        $display("condition",condition);
    end
endmodule
