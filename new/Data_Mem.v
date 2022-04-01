`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2022 01:41:49 PM
// Design Name: 
// Module Name: Data_Mem
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


module Data_Mem(
    input [7:0] Write_Data,
    input [7:0] Read_Address,
    input [7:0] Write_Address,
    input clk,
    input Write,
    input Read,
    input rst,
    output reg [7:0] Read_Data
    );
    reg [7:0] Memory_Array[0:255]; // declare memory of 256*8 bits
    integer i;
    always @(posedge rst) // resets the data memory
    begin
	 if(rst) 
	 begin
	   
		for(i=0; i<255; i=i+1)
			Memory_Array[i]<= 0;
		end
	end
	always @(Read,Write,Write_Data,Read_Data)
	begin
	  if(Write != 0 && Read == 0)
	  begin
	   Read_Data <= Memory_Array[Read_Address];
	  end
	  if(Write == 0 && Read !=0)
	  begin
	   Memory_Array[Write_Address] <= Write_Data;
	  end
	end
endmodule
