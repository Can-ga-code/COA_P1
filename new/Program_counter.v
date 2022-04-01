`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2022 04:08:45 PM
// Design Name: 
// Module Name: Program_counter
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


module Program_counter(
   input rst, // input port for reset to allow counter to roll back to starting address
   input clk, // input port for clock to allow counter to increment
   input [7:0] cur_add, // input port  for current instruction address
   output reg [7:0] next_add // output port for next instruction address
   );
   always @(posedge clk) begin
      if (rst != 0) // if reset is 1, cur_add is incremented
         next_add <= 0;
      else
         next_add <= cur_add + 1;
    end    
endmodule
