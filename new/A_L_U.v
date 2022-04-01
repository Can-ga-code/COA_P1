`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2022 06:20:20 PM
// Design Name: 
// Module Name: A_L_U
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


module A_L_U(
    input [7:0] A,
    input [7:0] B,
    input [2:0] OP, // determines operation to be performed
    output [7:0] RES // output from the ALU
    );
    
    wire [7:0] reg1;
    wire [7:0] reg2;
    reg [7:0] reg3;
    
    assign reg1 = A; // assigning inputs and outputs to internal variables for smooth operations
    assign reg2 = B;
    assign RES = reg3;
    
    always @(*)
    begin
      case (OP)
         1'b0: reg3 = reg1 + reg2;
         1'b1: reg3 = reg1 - reg2;
      endcase
    end
endmodule    