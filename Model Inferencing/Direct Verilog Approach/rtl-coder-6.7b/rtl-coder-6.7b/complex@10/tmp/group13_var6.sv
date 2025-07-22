### Verification Code:
//`define DUT M1
//`timescale 1ns/100ps
//`include "Universal_Shift_Reg_defines.sv"
//module test_Universal_Shift_Reg ();
//reg [3: 0] Data_In;
//wire [3: 0] Data_Out;
//reg clk, rst;
//reg [1: 0] s1, s0;
//reg MSB_In, LSB_In;
//reg [3: 0] expected_output;
//reg [3: 0] actual_output;
//wire MSB_Out, LSB_Out;
//integer i;
//`DUT DUT(.Data_In,.Data_Out,.clk,.rst,.s1,.s0,.MSB_In,.LSB_In,.MSB_Out,.LSB_Out);
//always #1 clk = ~clk;
//initial #1000 $finish;
//initial
//begin
//clk = 0;
//rst = 1;
//MSB_In = 0;
//LSB_In = 0;
//s0 = 0;
//s1 = 0;
//Data_In = 4'b0;
////#00
////$display("Resetting...");
//#1 rst = 0;
////#01
////$display("Initialize the design...");
//#1 DUT(.Data_In,.Data_Out,.clk,.rst,.s1,.s0,.MSB_In,.LSB_In,.MSB_Out,.LSB_Out);
////#02
//$display("Verify Shift Right...");
//s1 = 1'b1; // shift right signal
//s0 = 1'b0; // Idle signal
//MSB_In = 1'b1;
//#1
//for(i = 0; i < 4; i++) // Shift Right for 4 times
//begin
//#1
//assert(MSB_Out === DUT.MS