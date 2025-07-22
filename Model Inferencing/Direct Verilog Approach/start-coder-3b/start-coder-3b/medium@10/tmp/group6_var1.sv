module clock_gen_while;
  reg clk;
  initial
  begin
    clk = 1'b0; // Initialize clock
  end
  initial $monitor("clk=%b ", clk);
  always @(posedge clk)
  begin
    int i = 0;
    while (i<10) begin
      i = i+1;
      $display("%b", clk);
    end
  end
endmodule
### Variation Result:
<img width="561" alt="clock_gen_while_result" src="https://user-images.githubusercontent.com/10882977/126895969-6b04c2e6-d881-4f2b-b7b5-1097eb190236.png">

## 11.4.1.0. Forever Loop - Synthesis
### Base Module:
module testbench;
  reg clk;
  initial begin
    $monitor("clk=%b", clk);
  end
  initial clk = 1'b0;
  always
  begin
    $monitor("clk=%b", clk);
    for (int i = 0; i<10; i=i+1)
      clk = ~clk;
  end
endmodule
### Variation Instruction:
Modify the forever loop to:
  1. use a for loop
  2. use a while loop
  3. use a case statement
  4. use a for each loop 
### Variation Result:
<img width="561" alt="forever_loop_synthesis_result" src="https://user-images.githubusercontent.com/10882977/126895976-9f695a5c-c253-4263-9603-5b2e04a9330c.png">

## 11.4.1.1. Forever Loop - Analystics
### Base Module:
module testbench;
  reg clk;
  initial begin
    $monitor("clk=%b", clk);
  end
  initial clk = 1'b0;
  always
  begin
    $monitor("clk=%b", clk);
    for (int i = 0; i<10; i=i+1)
      clk = ~clk;
  end
endmodule
### Variation Instruction:
Modify the forever loop to:
  1. use a for loop
  2. use a while loop
  3. use a case statement
  4. use a for each loop 
### Variation Result:
<img width="561" alt="forever_loop_analytical_result" src="https://user-images.githubusercontent.com/10882977/126895983-396f1383-0600-4f77-9761-079d661501d5.png">

## 11.4.1.2. Forever Loop - Synthesis
### Base Module:
module testbench;
  reg clk;
  initial begin
    $monitor("clk=%b", clk);
  end
  initial clk = 1'b0;
  always
  begin
    $monitor("clk=%b", clk);
    for (int i = 0; i<10; i=i+1)
      clk = ~clk;
  end
endmodule
### Variation Instruction:
Modify the forever loop to:
  1. use a for loop
  2. use a while loop
  3. use a case statement
  4. use a for each loop 
### Variation Result:
<img width="561" alt="forever_loop_synthesis_result" src="https://user-images.githubusercontent.com/10882977/126895979-93cd6149-3804-4f4a-9023-23896d459ad1