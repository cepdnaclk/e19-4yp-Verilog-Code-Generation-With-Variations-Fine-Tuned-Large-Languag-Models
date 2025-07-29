module dff_aa(q,qb,di,clk,clr,pr);
  parameter WIDTH = 8; // Define the size of the packed array as a parameter
  output [WIDTH - 1 : 0] q;
  output [WIDTH - 1 : 0] qb;
  input [WIDTH - 1 : 0] di;
  input clk, clr, pr;
  reg [WIDTH - 1 : 0] q;

  // Behavioral description with async reset/preset priority
  always @ (posedge clk or posedge clr or posedge pr) begin // Added async sensitivity
    if (clr) q <= 0;
    else if (pr) q <= {WIDTH{1'b1}};
    else q <= di;
  end

  assign qb = ~q;

  // Define packed arrays X and Y outside the module
  reg [WIDTH - 1 : 0] X, Y;

  // Initialize X and Y
  initial begin
    X = 10;
    Y = 20;
  end

  // Use the `inside` operator to check if the result of the addition of X and Y is in the packed slice
  specify
    if (X inside {[0 : 30]}) (posedge clk *> (q == Y + X)) = 1;
  endspecify
endmodule