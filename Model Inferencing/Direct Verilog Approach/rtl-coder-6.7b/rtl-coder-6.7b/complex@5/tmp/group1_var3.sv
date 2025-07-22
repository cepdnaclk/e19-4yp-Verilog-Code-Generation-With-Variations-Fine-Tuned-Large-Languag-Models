module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  generate
    for (genvar i = 0; i < 3; i = i + 1) begin : gen_block1
      nor nor_gate_inst_1 (
       .A(in1[i]),
       .B(in2[i]),
       .C(in3[i]),
       .F(b[i])
      );
    end
  endgenerate
  initial begin // Initialize inputs
    in1=1'b1; in2=1'b1; in3=1'b1;
  end
  // Toggle inputs at different rates
  always #2 in1=~in1;
  always #3 in2=~in2;
  always #5 in3=~in3;
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b); // Removed newline
  initial #24 $stop; // Stop simulation
endmodule