module mltp_b(a1,a0,b1,b0,c1,c2,c3,c4); // Function call based 2x2 multiplier
  input a1,a0,b1,b0; output c1,c2,c3,c4;
  reg[1:4] and_out; // Outputs from AND plane
  reg[1:9] or_in; // Outputs to OR plane
  function[4:0] and_array(inp); // AND plane function
   input [4:0] inp; // Inputs to AND plane
   and_out = 0; // Output from AND plane
    for (i=0; i<4; i=i+1) and_out = and_out | (inp[i] & mand[i] & and_out);
   return and_out;
  endfunction
  function or_array(inp); // OR plane function
   input [9:0] or_in; // Inputs to OR plane
   or_out = 0; // Output from OR plane
    for (i=0; i<10; i=i+1) or_out = or_out | (or_in[i] & or_out);
   return or_out;
  endfunction
  initial begin
    // Define AND plane connections (input -> product term)
    mand[0]=4'b1010; mand[1]=4'b0110; mand[2]=4'b1110; mand[3]=4'b1001;
    mand[4]=4'b0101; mand[5]=4'b1101; mand[6]=4'b1011; mand[7]=4'b0111;
    mand[8]=4'b1111;
    // Define OR plane connections (product term -> output)
    mor[0]=9'b101000101; // Connections for c1
    mor[1]=9'b011101110; // Connections for c2
    mor