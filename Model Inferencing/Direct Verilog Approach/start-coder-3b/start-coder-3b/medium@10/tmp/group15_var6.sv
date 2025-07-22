`module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
parameter OP_ADD = 0;
parameter OP_SUB = 1;
parameter OP_AND = 2;
parameter OP_OR = 3;
parameter OP_SHIFT = 4;
parameter OP_XOR = 5;

function [7:0] call_fun (input [7:0] left, input [7:0] right, input [1:0] mode);
    case (mode)
        0: ALUout = left + right