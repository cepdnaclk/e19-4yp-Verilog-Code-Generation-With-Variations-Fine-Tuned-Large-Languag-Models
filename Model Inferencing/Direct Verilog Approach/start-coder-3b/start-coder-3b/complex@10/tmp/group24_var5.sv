```Verilog
// Testbench for multiplexer
module tst_mup;
// Clock, Enable, Interrupt inputs
reg clk,en,int;
// Assuming mup_opr is the microprocessor module instance
initial
begin
int=1'b0;clk=1'b0;en=1'b0; // Initialize
end
always #2 clk=~clk; // Generate clock
// Monitor clock, time, inputs, and internal MUP registers (pc, ir, dcop)
initial $monitor("clk=%b, t=%0d, en=%b, int=%b, rr.pc=%0d, rr.ir=%0h, rr.dcop=%0d", clk,$time,en,int,rr.pc,rr.ir,rr.dcop);
// Corrected format specifiers
initial #40 $stop; // Stop simulation
endmodule

module mup_opr(clk,int,en);
// Define inputs, registers, and constants
input clk;
input int; // Interrupt signal
input en; // Enable signal
input wire [6:0] dcop; // Data memory output port (DCOP)
// Declare output ports, wires, and variables
output wire [6:0] ir; // Instruction register (IR)
output wire [6:0] pc; // Program counter (PC)
// Constants
wire [6:0] consts[63:0]; // Array of constants
wire [6:0] ops[63:0]; // Array of operation codes
wire [6:0] consts_in [4:0]; // Constant input to DUT
wire [6:0] ops_in [4:0]; // Operation code input to DUT
wire [6:0] regs [7:0]; // Array of registers
wire [6:0] regs_in [4:0]; // Register input to DUT
wire [6:0] MUX [1:0]; // MUX selection variable
wire [6:0] A,B,C; // Selectable constants and registers
// Declare wires
wire [6:0] ir_out; // Instruction register output
wire [6:0] pc_out;
wire [6:0] A_out,B_out,C_out; // Selectable constants and registers
// Assign constants and operation codes
assign consts = {
    "000000",
    "000001",
    "000011",
    "000100",
    "000101",
    "000110",
    "000111",
    "001000",
    "001001",
    "001010",
    "001011",
    "100000",
    "100001",
    "100010",
    "100011",
    "100100",
    "100101",
    "100110",
    "100111",
    "101000",
    "101001",
    "101010",
    "101011",
    "101100",
    "101101",
    "101110",
    "101111",
    "110000",
    "110001",
    "110010",
    "110011",
    "110100",
    "110101",
    "110110",
    "110111",
    "111000",
    "111001",
    "111010",
    "111011",
    "111100",
    "111101",
    "111110",
    "111111"
};
assign ops = {
    "000000",
    "000001",
    "000002",
    "000003",
    "000004",
    "000005",
    "000006",
    "000007",
    "000010",
    "000011",
    "000012",
    "000013",
    "000014",
    "000015",
    "000016",
    "000017",
    "000100",
    "000101",
    "000110",
    "000111",
    "001000",
    "001001",
    "001010",
    "001011",
    "001100",
    "001101",
    "001110",
    "001111",
    "010000",
    "010001",
    "010010",
    "010011",
    "010100",
    "010101",
    "010110",
    "010111",
    "011000",
    "011001",
    "011010",
    "011011",
    "011100",
    "011101",
    "011110",
    "011111",
    "100000",
    "100001",
    "100010",
    "100011",
    "100100",
    "100101",
    "100110",
    "100111",
    "101100",
    "101101",
    "101110",
    "101111",
    "110000",
    "110001",
    "110010",
    "110011",
    "110100",
    "110101",
    "110110",
    "110111",
    "111000",
    "111001",
    "111010",
    "111011",
    "111100",
    "111101",
    "111110",
    "111111"
};
// Assign registers
assign regs = {
    "000000",
    "000001",
    "000010",
    "000011",
    "000100",
    "000101",
    "000110",
    "000111",
    "001000",
    "001001",
    "001010",
    "001011",
    "001100",
    "001101",
    "001110",
    "001111",
    "010000",
    "010001",
    "010010",
    "010011",
    "010100",
    "010101",
    "010110",
    "010111",
    "011000",
    "011001",
    "011010",
    "011011",
    "011100",
    "011101",
    "011110",
    "011111",
    "100000",
    "100001",
    "100010",
    "100011",
    "100100",
    "100101",
    "100110",
    "100111",
    "101000",
    "101001",
    "101010",
    "101011",
    "101100",
    "101101",
    "101110",
    "101111",
    "110000",
    "110001",
    "110010",