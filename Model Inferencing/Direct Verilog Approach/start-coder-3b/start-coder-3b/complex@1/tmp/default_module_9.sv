module mltp_b(a1,a0,b1,b0,c1,c2,c3,c4); // PLA based 2x2 multiplier
  input a1,a0,b1,b0; output c1,c2,c3,c4;
  // Declare storage for AND plane and OR plane
  wire[1:4] and[1:9]; wire[1:9] or[1:4];
  wire p1,p2,p3,p4,p5,p6,p7,p8,p9; // Product terms
  assign c1 = p1; // Outputs are wires, must assign to c1
  assign c2 = p2; // Outputs are wires, must assign to c2
  assign c3 = p3; // Outputs are wires, must assign to c3
  assign c4 = p4; // Outputs are wires, must assign to c4
  assign {p1,p2,p3,p4,p5,p6,p7,p8,p9} = and; // Corrected AND product list order