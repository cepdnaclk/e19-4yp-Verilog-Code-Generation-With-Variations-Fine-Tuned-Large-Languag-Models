module mltp_a(a1,a0,b1,b0,c1,c2,c3,c4); // PLA based 2x2 multiplier
  input a1,a0,b1,b0; output c1,c2,c3,c4;
  // Declare storage for AND plane and OR plane
  reg[1:4] mand[1:9]; // AND plane inputs (4 bits wide, 9 product terms)
  reg[1:9] mor[1:4]; // OR plane inputs (9 bits wide, 4 outputs)
  reg p1,p2,p3,p4,p5,p6,p7,p8,p9; // Product terms
  reg c1,c2,c3,c4; // Outputs must be reg for procedural assignment
  function [1:0] and_pl(input[1:0] a, input[1:0] b);
    and_pl[1]=a[0]&b[0]; and_pl[0]=a[1]&b[1];
  endfunction : and_pl
  function [1:0] or_pl(input[3:0] a);
    or_pl[0]=a[0]|a[1]|a[2]|a[3];
    or_pl[1]=a[4]|a[5]|a[6]|a[7]|a[8];
  endfunction : or_pl
  initial begin
    // Define AND plane connections (input -> product term)
    mand[1]=4'b1010; mand[2]=4'b0110; mand[3]=4'b1110; mand[4]=4'b1001;
    mand[5]=4'b0101; mand[6]=4'b1101; mand[7]=4'b1011; mand[8]=4'b0111;
    mand[9]=4'b1111;
    // Define OR plane connections (product term -> output)
    // Format