module tstha_9();
  reg [2:0]in;
  wire [2:0]out;
  ha_9 hh(out[0],out[1],in[0],in[1]);
  initial in = 3'b000;
  initial begin #5 in =3'b111; #5 in = 3'b011;#5 in = 3'b110;#5 in = 3'b101;#5 in = 3'b010;#5 in = 3'b001;#5 in =3'b111; #5 in = 3'b011;#5 in = 3'b110;end
  initial $monitor($time, " in = %b,out0 = %b, out1 = %b ",in,out[0],out[1]);
  initial #30 $stop;
endmodule
### Error:
Error:
*** Error: File "tstha_9.v", line 3.
*** Error: Module instance: tstha_9
*** Error: Error: Illegal port type.