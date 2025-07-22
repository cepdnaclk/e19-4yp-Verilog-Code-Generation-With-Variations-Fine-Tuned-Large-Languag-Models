module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
    // Add your if condition here
    if (a[1:0] == 2'b10) begin // If a is 10, 0 delay on s path
      (a[1:0], b[1:0] *> s) = dl1;
    end
    if (a[1:0] == 2'b01) begin // If a is 01, 1 delay on s path
      (a[1:0], b[1:0] *> s) = dl2;
    end
  endspecify

  xor (s,a,b);
  and (ca,a,b);
endmodule

### Base Verilog Code:
module ha_4(s,ca,