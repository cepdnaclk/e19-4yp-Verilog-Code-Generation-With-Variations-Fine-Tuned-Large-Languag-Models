```verilog
localparam N = 1;
interface adder_if ();
   logic [N-1:0] carry_in;
   logic [N-1:0] X;
   logic [N-1:0] Y;
   logic [N-1:0] S;
   logic carry_out;
endinterface

module adder_top;
   localparam N = 1;
   logic [N-1:0] carry_in;
   logic [N-1:0] X;
   logic [N-1:0] Y;
   logic [N-1:0] S;
   logic carry_out;

   adder16 adder (carry_in, X, Y, S, carry_out);

   initial begin
      // adder.carry_in = 1'b0;
      adder.X[0] = 1'b0;
      adder.Y[0] = 1'b0;
      #1;
      // adder.carry_in = 1'b0;
      adder.X[0] = 1'b1;
      adder.Y[0] = 1'b1;
      #1;
      adder.X[0] = 1'b1;
      adder.Y[0] = 1'b0;
      #1;
      $finish;
   end
endmodule

// base code, verilog
module adder16 (carryin, X, Y, S, carryout);
parameter n = 16;
input carryin;
input [n-1:0] X, Y;
output [n-1:0] S;
output carryout;
reg [n-1:0] S;
reg [n:0] C;
reg carryout;
integer k;
always @(X or Y or carryin)
begin
    C[0] = carryin;
    for (k = 0; k <= n-1; k = k + 1)
    begin
        S[k] = X[k] ^ Y[k] ^ C[k];
        C[k+1] = (X[k] & Y