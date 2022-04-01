`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2022 01:58:30 PM
// Design Name: 
// Module Name: Sign_Extender
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


module Sign_Extender(signIn,signOut);
  input [2:0] signIn;  // input which contains the least 3 bits from instruction
  output reg[7:0] signOut; //output after the sign extension
  always @(*)
   begin
    if(signIn[2]==0) // checking the bit 
    signOut <= {5'b00000 , signIn}; // appending 5 more bits 
    else if(signIn[2]==1)
    signOut <= {5'b11111 , signIn};
   end
endmodule
