`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2022 02:03:05 PM
// Design Nlame: 
// Module Name: Processor
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


module Processor(
    input clk, 
    input reset,
    output wire ALUOp,ALUSrc,RegDst,
    output wire MemRead,MemtoReg,MemWrite,RegWrite,
    output wire [7:0] alu_output,
    output reg [7:0] pc_initial,
    output wire [7:0] instruction,
    output wire [2:0] opcode,
    output wire rt_rd,rs,
    output wire [2:0]signIn,
    output wire[7:0]signOut,
    output wire [7:0]readData1,
    output wire [7:0]readData2,
    output wire [7:0]ReadData,
    output wire [7:0]writeData
    );
wire [7:0]A;
wire [7:0]B;
wire readRegister1, readRegister2, writeRegister,writeEnable;
wire [7:0]pc_next;

// initializing pc to zero
initial begin
  pc_initial <= 8'b00000000;
end

// calling the various modules with respective inputs 
  Instruc_Mem IM(
        .counter(pc_initial),
        .instruct(instruction)
        ); 
  Ins_decoder ID (
        .instruct(instruction),
        .opcode(opcode),
        .rt_rd(rt_rd),
        .rs(rs),
        .signIn(signIn)
        ); 
  Ctrl_Unit CU (
        .opcode(opcode),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite)
         );
  register rf (
        .clk(clock),
		.readRegister1(rt_rd),
		.Out1(readData1),
		.readRegister2(rs),
		.Out2(readData2),
		.writeRegister(rt_rd),
		.writeData(writeData),
		.writeEnable(RegWrite)
   );
   /*signExtend sign (
       .signIn(signIn),
       .signOut(signOut)
   );
   mux_2 M2(
       .signOut(signOut),
       .readData1(readData1),
       .ALUSrc(ALUSrc),
       .B(B)
   );*/
   A_L_U alu (
        .A(readData2),
        .B(B),
        .Op(ALUOp),
        .RES(alu_output)
        );
   Data_Mem datamem(
        .clk(clock),
        .Write(MemWrite),
        .Read(MemRead),
        .Write_Data(readData1),
        .Read_Address(alu_output),
        .Write_Address(alu_output),
        .Read_Data(ReadData)
		);
   Program_counter PC(
        .clk(clock),
        .rst(reset),
        .cur_add(pc_initial),
        .next_add(pc_next)
   );
   
   always@(*)
   begin
   pc_initial = pc_next;
   end
   /*mux1 mux1 (
       .input0(alu_output),
       .input1(ReadData),
       .condition(MemtoReg),
       .outputMux(writeData)
        ); */
        
        integer i; 
initial begin
     
for (i =0; i<4; i=i+1)
begin
    $display("------------------------------");
    $display("PC --%b", pc_initial);
    $display("instruction --%b", instruction);
    $display("opcode --%b", opcode);
    $display("rt_rd --%b", rt_rd);
    $display("rs --%b", rs);
    $display("signin --%b", signIn);
    $display("RedDst --%b",RegDst);
    $display("MemRead --%b",MemRead);
    $display("MemtoReg --%b",MemtoReg);
    $display("ALUOp --%b",ALUOp);
    $display("MemWrite --%b",MemWrite);
    $display("ALUSrc --%b",ALUSrc);
    $display("readData1 --%b",readData1);
    $display("readData2 --%b",readData2);
    $display("signOut --%b",signOut);
    $display("A --%b",A);
    $display("alu_out --%b",alu_output);
    $display("writedata --%b",writeData); 
    $display("PC-Next --%b",pc_next); 
    $display("ReadData --%b",ReadData); 
#40;
end
end
endmodule
