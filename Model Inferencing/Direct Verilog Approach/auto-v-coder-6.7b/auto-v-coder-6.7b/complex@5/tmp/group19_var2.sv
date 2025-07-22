```verilog
`timescale 1ns/1ps
module datatypes(
input wire clk,
input wire [3:0] a,
input wire [3:0] b,
output wire [3:0] c
);

reg [3:0] reg_a;
wire [3:0] wire_b;
nettype localparam [