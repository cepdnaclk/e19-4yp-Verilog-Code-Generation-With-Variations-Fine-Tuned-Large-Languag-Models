module ALUTest (
input wire clk,
input wire rst,
input wire [1:0] sel,
input wire [31:0] A,
input wire [31:0] B,
input wire [31:0] S,
input wire [31:0] LHS,
input wire [31:0] RHS,
input wire [31:0] M,
input wire [8:0] Q_exp,
input wire [8: