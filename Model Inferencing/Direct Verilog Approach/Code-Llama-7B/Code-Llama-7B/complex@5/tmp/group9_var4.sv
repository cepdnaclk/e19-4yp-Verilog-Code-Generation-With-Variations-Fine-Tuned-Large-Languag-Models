module mltp_a(a1,a0,b1,b0,c1,c2,c3,c4); // PLA based 2x2 multiplier
  input a1,a0,b1,b0; output c1,c2,c3,c4;
  // Declare storage for AND plane and OR plane
  reg[1:4] mand[1:9]; // AND plane inputs (4 bits wide, 9 product terms)
  reg[1:9] mor[1:4]; // OR plane inputs (9 bits wide, 4 outputs)
  reg p1,p2,p3,p4,p5,p6,p7,p8,p9; // Product terms
  reg c1,c2,c3,c4; // Outputs must be reg for procedural assignment
  initial begin
    // Define AND plane connections (input -> product term)
    mand[1]=4'b1010; mand[2]=4'b0110; mand[3]=4'b1110; mand[4]=4'b1001;
    mand[5]=4'b0101; mand[6]=4'b1101; mand[7]=4'b1011; mand[8]=4'b0111;
    mand[9]=4'b1111;
    // Define OR plane connections (product term -> output)
    // Format: 9 bits for p1-p9 connections for each output c1-c4
    mor[1]=9'b101000101; // Connections for c1
    mor[2]=9'b011101110; // Connections for c2
    mor[3]=9'b000011010; // Connections for c3
    mor[4]=9'b000000001; // Connections for c4
    // Instantiate PLA using system tasks
    $async$and$array(mand, {b1,b0,a1,a0}, {p1,p2,p3,p4,p5,p6,p7,p8,p9}); // Corrected input order?
    $async$or$array(mor, {p1,p2,p3,p4,p5,p6,p7,p8,p9}, {c4,c3,c2,c1}); // Corrected output order?
    //Instantiate multiplier using function call
    multiply_array(mand, {b1,b0,a1,a0}, {p1,p2,p3,p4,p5,p6,p7,p8,p9}); // Corrected input order?
    // Instantiate PLA using function call
    // $async$and$array(mand, {b1,b0,a1,a0}, {p1,p2,p3,p4,p5,p6,p7,p8,p9});
    // $async$or$array(mor, {p1,p2,p3,p4,p5,p6,p7,p8,p9}, {c4,c3,c2,c1});
  end
  // Function to compute 2x2 multiplier
  function [1:0] multiply_array(reg[1:4] in_array[1:9],
            reg[1:0] input_array[1:4], reg[1:0] output_array[1:4]);
    multiply_array = in_array[output_array]&input_array;
  endfunction
endmodule
### Simulation Logic for Base Verilog Code:
a1=1, a0=1, b1=1, b0=1, c1=1, c2=0, c3=1, c4=0  
a1=0, a0=0, b1=0, b0=0, c1=0, c2=0, c3=0, c4=0  
a1=0, a0=0, b1=1, b0=0, c1=0, c2=1, c3=0, c4=0  
a1=0, a0=0, b1