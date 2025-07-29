module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    if (a[3:0] inside {2,3})
      // Assign path delays using specparams
      (a, b *> s) = dl1;
    else
      (a, b *> s) = dl1 + 2;
    if (a[3:0] inside {2,3})
      (a, b *> ca) = dl2;
    else
      (a, b *> ca) = dl2 + 2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
### Simulation Log:
```
module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    if (a[3:0] inside {2,3})
      // Assign path delays using specparams
      (a, b *> s) = dl1;
    else
      (a, b *> s) = dl1 + 2;
    if (a[3:0] inside {2,3})
      (a, b *> ca) = dl2;
    else
      (a, b *> ca) = dl2 + 2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule

module tb_ha_8();
  reg [7:0] a; reg b; wire s; wire ca;
  ha_8 h (.s(s),.ca(ca),.a(a),.b(b));
  initial begin
    a = 2'b00; b = 1'b1; 
    #1;
    a = 2'b00; b = 1'b0;
    #1;
    a = 2'b01; b = 1'b1; 
    #1;
    a = 2'b01; b = 1'b0;
    #1;
    a = 2'b10; b = 1'b1; 
    #1;
    a = 2'b10; b = 1'b0;
    #1;
    a = 2'b11; b = 1'b1; 
    #1;
    a = 2'b11; b = 1'b0;
    #1;
  end
endmodule
module rtl;
  ha_8 h (.s(s),.ca(ca),.a(a),.b(b));
endmodule

module tb_ha_8();
  reg [7:0] a; reg b; wire s; wire ca;
  ha_8 h (.s(s),.ca(ca),.a(a),.b(b));
  initial begin
    a = 2'b00; b = 1'b1; 
    #1;
    a = 2'b00; b = 1'b0;
    #1;
    a = 2'b01; b = 1'b1; 
    #1;
    a = 2'b01; b = 1'b0;
    #1;
    a = 2'b10; b = 1'b1; 
    #1;
    a = 2'b10; b = 1'b0;
    #1;
    a = 2'b11; b = 1'b1; 
    #1;
    a = 2'b11; b = 1'b0;
    #1;
  end
endmodule
tb_ha