```
module mup_opr(clk,int,en,pc,ir,dcop,BCD_in,BCD_out);
reg [15:0]pc,ir,dcop; // Program Counter, Instruction Register, Data Register
wire [7:0]BCD_in,BCD_out;

// Add BCD input to ir
assign {dcop,BCD_out} = ir + BCD_in; // BCD addition
assign ir = ir + BCD_in;

initial
begin
pc = 16'h000;
ir = 8'h00; // Initialize
end
always @(posedge clk or posedge int)
begin
if (int) begin
// Load data from memory
// ir = $readmemh(x"12345678");
ir = 8'h01;
end
else begin
// Increment Program Counter
pc = pc + 2'h01;
// Fetch new instruction
ir = $readmemh(x"12345678" + (pc-2'h