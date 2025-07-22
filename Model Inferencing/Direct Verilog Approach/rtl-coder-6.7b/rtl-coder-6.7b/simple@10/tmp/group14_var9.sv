module tst_alu1();
  wire[3:0] d;
  wire co;
  reg[3:0] a,b;
  reg[1:0] f;
  reg cci;
  alu_1 aa(d,co,a,b,f,cci);
  initial begin cci=1'b0; f=2'b00;
              a=4'h0; b=4'h0; #30 $stop;
              a=4'h0; b=4'h1; #30 $stop;
              a=4'h1; b=4'h0; #30 $stop;
              a=4'h1; b=4'h1; #30 $stop;
              a=4'h5; b=4'h6; #30 $stop;
              a=4'h6; b=4'h5; #30 $stop;
              a=4'hF; b=4'hF; #30 $stop;
              a=4'hF; b=4'hF; #30 $stop;
              a=4'h1; b=4'h4; #30 $stop;
              a=4'h4; b=4'h1; #30 $stop;
              a=4'h5; b=4'hF; #30 $stop;
              a=4'h5; b=4'hF; #30 $stop;
              a=4'hF; b=4'h5; #30 $stop;
              a=4'hF; b=4'h5; #30 $stop;
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co);
endmodule
### Output:
### Code Analysis
The output shows that the arithmetic function is behaving as expected.
### Verilog Code:
module alu_1(output [3:0] d,output co,input [3: