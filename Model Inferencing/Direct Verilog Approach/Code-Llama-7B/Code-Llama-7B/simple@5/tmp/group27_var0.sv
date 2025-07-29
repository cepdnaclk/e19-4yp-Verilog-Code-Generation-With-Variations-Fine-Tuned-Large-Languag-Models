module packed_sig_test_9();
  reg [1:0] a1,b1; wire s1,ca1;
  ha_9 hh(s1,ca1,a1,b1); // Instantiate HA with rise/fall path delays
  initial begin 
    a1={1'b0,1'b0};b1={1'b0,1'b0}; 
  end
  always begin #5 a1=2'b01;b1=2'b10; #5 a1=2'b10;b1=2'b01; #5 a1=2'b01;b1=2'b10; #5 a1=2'b10;b1=2'b01; #5 a1=2'b01;b1=2'b10;
  initial $monitor($time, " a1 = %b,, b1 = %b,out carry = %b, outsum = %b ",a1,b1,ca1,s1);
  initial #30 $stop;
endmodule

### Base Verilog Code:
module tstha_0(in,in1,out_add,out_c);
  input [7:0] in; input [7:0] in1; output out_add; output out_c;
  wire out_add; wire out_c;
  ha_0 hh(out_add,out_c,in,in1); // Instantiate HA with rise/fall path delays
  initial begin in={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};in1={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}; end
  always begin #5 in=8'b11111111;in1=8'b11111111; #5 in=8'b11111111;in1