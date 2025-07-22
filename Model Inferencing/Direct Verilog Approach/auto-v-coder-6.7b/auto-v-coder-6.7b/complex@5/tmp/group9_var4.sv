```verilog
module mltp_a(a1,a0,b1,b0,c1,c2,c3,c4); // Function-based multiplier
  input a1,a0,b1,b0; output reg c1,c2,c3,c4; // Outputs must be reg for procedural assignment
  // Declare storage for AND plane and OR plane
  reg[1:4] mand[1:9]; // AND plane inputs (4 bits wide, 9 product terms)
  reg[8:0] mor[1:4]; // OR plane inputs (9 bits wide, 4 outputs)
  reg p1,p2,p3,p4,p5,p6,p7,p8,p9; // Product terms
  // Define functions for product terms
  reg product1;
  reg product2;
  reg product3;
  reg product4;
  // Define AND plane connections
  initial begin
    mand[1] = 4'b0001;
    mand[2] = 4'b0010;
    mand[3] = 4'b0100;
    mand[4] = 4'b0011;
    mand[5] = 4'b0101;
    mand[6] = 4'b0110;
    mand[7] = 4'b1000;
    mand[8] = 4'b1001;
    mand[9] = 4'b1111;
  end
  // Instantiate function to calculate product terms
  function product1;
    input a1,a0,b1,b0;
    product1 = a1&b1;
  endfunction
  function product2;
    input a1,a0,b1,b0;
    product2 = a1&b0;
  endfunction
  function product3;
    input a1,a0,b1,b0;
    product3 = a0&b1;
  endfunction
  function product4;
    input a1,a0,b1,b0;
    product4 = a0&b0