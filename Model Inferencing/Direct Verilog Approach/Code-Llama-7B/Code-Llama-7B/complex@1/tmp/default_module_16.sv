```verilog
module TOP1(
    input CLK,
    input RST_X
);

  parameter REF_ARR_SIZE = 16; // Parameter for array size

  localparam REF_ARR[REF_ARR_SIZE] = '{2**0, 2**1, 2**2, 2**3, 2**4, 2**5, 2**6, 2**7, 2**8, 2**9, 2**10, 2**11, 2**12, 2**13, 2**14, 2**15}; // Constant array for comparator
  
  // Generate the clock, reset and data
  reg[31:0] x;
  reg[31:0] P;
  reg[31:0] Q;
  reg[31:0] R;
  reg[31:0] S;
  reg[31:0] T;
  reg[31:0] U;
  reg[31:0] V;
  reg[31:0] W;

  always @(posedge CLK) begin
    if (RST_X)
      x = 32'd0;
    else
      x = x + 32'd1;
  end

  assign P = 32'd4;
  assign Q = 32'd7;
  assign R = 32'd11;
  assign S = 32'd15;
  assign T = 32'd19;
  assign U = 32'd24;
  assign V = 32'd29;
  assign W = 32'd33;

  // Define the comparator logic
  wire a1;
  wire a2;
  wire a3;
  wire a4;
  wire a5;
  wire a6;
  wire a7;
  wire a8;
  wire a9;
  wire a10;
  wire a11;
  wire a12;
  wire a13