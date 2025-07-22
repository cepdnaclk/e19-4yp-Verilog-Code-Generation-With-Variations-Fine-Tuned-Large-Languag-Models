module ha_8(s,ca,a,b);
  input [3:0] a,b; output [3:0] s,ca;
  specify
    specparam dl1 = 1;
    specparam dl2 = dl1 + 1;
    for (i=0; i < 4; i=i+1)
    begin : ha
      (a[i], b[i] *> s[i]) = dl1;
      (a[i], b[i] *> ca[i]) = dl2;
    end
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
### Testbench:
module ha_8_tb;
  reg [3:0] a,b;
  wire [3:0] s,ca;
  ha_8 u1 (s,ca,a,b);
  initial
  begin
    a = 4'b1100; b = 4'b0011; #1;
    a = 4'b1100; b = 4'b0011; #1;
    a = 4'b1100; b = 4'b0011; #1;
    $finish;
  end
endmodule
### Verilog Test Output:
### Note:
The example code uses an initial begin block and a #1 delay to simulate a clock. The initial block calls the $finish function to terminate the simulation after three clock cycles.