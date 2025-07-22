module testbench;
/* This is the code that is modified as per the variation */
reg [31:0] operand;
initial begin
 operand[0] = -127;
 operand[1] = -101;
 operand[2] = -100;
 operand[3] = 0;
 operand[4] = 95;
 operand[5] = 127;
 operand[6] = 113;
 operand[7] = 253;
 operand[8] = 31;
 operand[9] = 286;
 operand[10] = 160;
 operand[11] = -205;
 operand[12] = 10;
 operand[13] = -120;
 operand[14] = 223;
 operand[15] = -33;
 operand[16] = 36;
 operand[17] = 122;
 operand[18] = -15;
 operand[19] = 40;
 operand[20] = -22;
 operand[21] = -55;
 operand[22] = -1;
 operand[23] = 84;
 operand[24] = 12;
 operand[25] = 255;
 operand[26] = 159;
 operand[27] = 134;
 operand[28] = -100;
 operand[29] = 171;
 operand[30] = -132;
 operand[31] = -121;
end
/* This is the original testbench code */
reg [15:0] A, B; // Input Operands
wire [15:0] out; // Output Operand
reg Clock, Resetn;
reg [31:0] operand;
/* Testbench Clock, Resetn Generation */
always #5 Clock = ~Clock;
initial begin
 Resetn = 0; // Resetn asserted
 Clock = 0; // Clock is initially deasserted
 operand[0] = -127;
 operand[1] = -101;
 operand[2] = -100;
 operand[3] = 0;
 operand[4] = 95;
 operand[5] = 127;
 operand[6] = 113;
 operand[7] = 253;
 operand[8] = 31;
 operand[9] = 286;
 operand[10] = 160;
 operand[11] = -205;
 operand[12] = 10;
 operand[13] = -120;
 operand[14] = 223;
 operand[15] = -33;
 operand[16] = 36;
 operand[17] = 122;
 operand[18] = -15;
 operand[19] = 40;
 operand[20] = -22;
 operand[21] = -55;
 operand[22] = -1;
 operand[23] = 84;
 operand[24] = 12;
 operand[25] = 255;
 operand[26] = 159;
 operand[27] = 134;
 operand[28] = -100;
 operand[29] = 171;
 operand[30] = -132;
 operand[31] = -121;
 @(posedge Clock) Resetn = 1;
 @(posedge Clock) Resetn = 0;
 @(posedge Clock) Resetn = 1;
 @(posedge Clock) Resetn = 0;
 @(posedge Clock) Resetn = 1;
 @(posedge Clock) Resetn = 0;
 @(posedge Clock) Resetn = 1;
 @(posedge Clock) Resetn = 0;
 @(posedge Clock) Resetn = 1;
 @(posedge Clock) Resetn = 0;
 @(posedge Clock) Resetn = 1;
 @(posedge Clock) Resetn = 0;
 @(posedge Clock) Resetn = 1;
 @(posedge Clock) Resetn = 0;
 @(posedge Clock) Resetn = 1;
 @(posedge Clock) Resetn = 0;
 @(posedge Clock) Resetn = 1;
 @(posedge Clock) Resetn = 0;
 @(posedge Clock) $finish;
end
/* DUT Instantiation */
dff_inst dff(.D(operand[31]),.Clock(Clock),.Resetn(Resetn),.Q(out));
endmodule