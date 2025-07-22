module show_aa(ao,ai); // NOT gate with delay 2
  //output ao; input ai; wire ao, ai;
  
  enum {A,B} ao; // enum for A and B
  enum {A,B} [1:0] ai; // enum for A and B
  parameter A = 0;
  parameter B = 1;
  
  // not #2 (ao,ai);
  always @(*) begin
    ao = ai[1:0] == A? B : A; // non-default value
    ao = ai[1:0] == B? A : B; // non-default value
  end
endmodule
### Testbench Code:
module show_aa_tb();  // NOT gate testbench
  wire ao; reg [1:0] ai;
  show_aa UUT (ao, ai);
  
  initial begin
    $display("NOT gate with ai=0, ao=%d", ao);
    ai = 0; #100;
    $display("NOT gate with ai=1, ao=%d", ao);
    ai = 1; #100;
    $display("NOT gate with ai=5, ao=%d", ao);
    ai = 5; #100;
    $finish;
  end
endmodule
### Run simulation:
iverilog -o a.out show_aa_tb.v show_aa.v
vvp a.out
### Result
![image](https://user-images.githubusercontent.com/51316184/110207586-56bcf880-7ead-11eb-8081-f8500085ea93.png)