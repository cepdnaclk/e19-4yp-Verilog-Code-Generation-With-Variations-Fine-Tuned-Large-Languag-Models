```verilog
// MUP_OPR Module
module mup_opr(clk,int,en);
 parameter Wd = 32;
 parameter XMR_w = 1;
 parameter ZMR_w = 1;
 parameter IMR_w = 1;
 parameter PC_w = 16;
 parameter IR_w = 16;
 parameter RR_w = 16;
 localparam consts = 10;
 localparam opcode_w = 4;
 localparam opcode_w_v = 1;
 localparam opcode_w_c = 1;
 localparam dest_w = 11;
 localparam src_w = 11;
 localparam BCD_w = 4;
 localparam BCD_in = 4;
 localparam BCD_out = 5;
 reg [XMR_w-1:0] XMR; // XMR
 reg [ZMR_w-1:0] ZMR; // ZMR
 reg [IMR_w-1:0] IMR; // IMR
 reg [PC_w-1:0] PC; // Program Counter
 reg [IR_w-1:0] IR; // Instruction Register
 reg [RR_w-1:0] RR; // Register Bank
 reg [Wd-1:0] dcop; // Data Control Operation
 reg [Wd-1:0] muxop; // Mux Operand
 reg [Wd-1:0] op1; // Operand 1
 reg [Wd-1:0] op2; // Operand 2
 reg [Wd-1:0] res; // Result
 reg [dest_w-1:0] dest; // Destination Register
 reg [src_w-1:0] src; // Source Register
 reg clk,int,en;

reg [Wd-1:0] pkg::consts[9:0]; // Constant Array
// Assign values to constant array
initial begin
pkg::consts[BCD_in] = 4'h3; // BCD In
pkg::consts[BCD_out] = 5'h31; // BCD Out
end


initial begin
PC=0;IR=0;RR=0;XMR=0;ZMR=0;IMR=0;dcop=0;muxop=0;op1=0;op2=0;res=0;dest=0;src=0;
end
always @(*) begin
op1=muxop; // Select Operand 1 from result
op2=muxop; // Select Operand 2 from result
end
always @(posedge clk) begin
case (IR[opcode_w+:opcode_w_v]) // Instruction Mnemonics
'B0000: begin // Load Immediate
dest=IR[dest_w+:src_w]; // LD_I from IR[dest_w:src_w]
muxop=IR[src_w+:Wd]; // Use immediate operand specified in IR[src_w:Wd]
end
'B0001: begin // Arithmetic
dest=IR[dest_w+:src_w]; // AR_I from IR[dest_w:src_w]
op1=RR[IR[src_w+:src_w]]; // AR_I from IR[src_w:src_w]
op2=pkg::consts[BCD_in]; // BCD_I (XMR) from consts
end
'B0010: begin // Store
dest=IR[dest_w+:src_w]; // ST_I from IR[dest_w:src_w]
op1=RR[IR[src_w+:src_w]]; // ST_I from IR[src_w:src_w]
op2=pkg::consts[BCD_out]; // BCD_I (XMR) from consts
end
'B0011: begin // Load Register
dest=IR[dest_w+:src_w]; // LR_I from IR[dest_w:src_w]
src=IR[src_w+:src_w]; // LR_I from IR[src_w:src_w]
end
'B0100: begin // Arithmetic Register
dest