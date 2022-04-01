`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2022 01:50:59 PM
// Design Name: 
// Module Name: Multiplexer_2
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


module Multiplexer_2(

    input wire [7:0]signOut, 
    input wire [7:0]readData1,
    input wire ALUSrc,
    output reg [7:0] B
    );
    always @(*) begin
        case(ALUSrc)
            1'b0:  B <= readData1;
            1'b1:  B <= signOut;
        endcase
    end
endmodule
