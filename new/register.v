`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2022 01:53:31 PM
// Design Name: 
// Module Name: register
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


module register(clk, writeEnable, writeRegister, writeData,readRegister1,Out1,readRegister2,Out2);
 input  clk;
 input  writeEnable;
 input  writeRegister;
 input  [7:0] writeData;
 input  readRegister1;
 output  [7:0] Out1,Out2;
 input  readRegister2;
 reg [7:0] regArray[1:0];
 integer i,f;
initial begin
    // intialising the registers with default values to start with
	regArray[0]=8'b00000100; 
	regArray[1]=8'b00000101;
 end

 // write operation
always @ (posedge clk ) 
begin
   if(writeEnable) 
   begin
    regArray[writeRegister] <= writeData;
   end
 end
endmodule
