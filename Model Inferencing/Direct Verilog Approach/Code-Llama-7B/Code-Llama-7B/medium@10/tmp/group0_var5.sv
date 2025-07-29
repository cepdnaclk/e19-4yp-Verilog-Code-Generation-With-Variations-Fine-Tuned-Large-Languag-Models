module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
### Pass/Fail Criteria:
HDL compilers should reject any HDL file containing logic error.
### Sample Testbench:
module tb;
  logic [3:0] a,b,s,ca;
  ha_8 u0(.*);
  initial begin
    repeat(5) begin
      #10;
      a = $random;
      b = $random;
      $display("a=%b, b=%b, s=%b, ca=%b",a,b,s,ca);
    end
    $finish;
  end
endmodule
### Passing Code:
module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a[1], b[1]) *> ca = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a[1],b[1]);
endmodule
### Sample Testbench:
module tb;
  logic [3:0] a,b,s,ca;
  ha_8 u0(.*);
  initial begin
    repeat(5) begin
      #10;
      a = $random;
      b = $random;
      $display("a=%b, b=%b, s=%b, ca=%b",a,b,s,ca);
    end
    $finish;
  end
endmodule
### Passing Code:
module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a[1], b[1:1]) *> ca = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a[1],b[1:1]);
endmodule
### Pass/Fail Criteria:
HDL compilers should reject any HDL file containing logic error.
### Sample Testbench:
module tb;
  logic [3:0] a,b,s,ca;
  ha_8 u0(.*);
  initial begin
    repeat(5) begin
      #10;
      a = $random;
      b = $random;
      $display("a=%b, b=%b, s=%b, ca=%b",a,b,s,ca);
    end
    $finish;
  end
endmodule
### Passing Code:
module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a[1], b[1:2]) *> ca = dl2;
  endspec