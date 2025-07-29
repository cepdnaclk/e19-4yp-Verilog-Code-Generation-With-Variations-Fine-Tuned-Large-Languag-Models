module caseInst(clk, in1,in2,out1, out2);
  output out1, out2;
  input clk, in1,in2;
  wire b; // The output wire
  // Variation:
  // 1. Create a case statement
  // 2. Create a function to determine inside or outside using function
  // 3. Add a case statement to determine inside or outside using function
  function inside; 
    input input;
    inside = input;
  endfunction // inside
  always @(posedge clk) begin
    b <= inside(in1) | inside(in2);
  end
  nor2NMOS dut(b,b, out1);
  nor2NMOS dut(b,b, out2);
endmodule

########################################################################
### Base Verilog Code:
module nor2NMOS(in1,in2,b); // 2-input NMOS NOR
  output b;
  input in1,in2;
  supply0 a; // Ground
  wire b; // Output wire (should