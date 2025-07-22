module tst_dff_p_a();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  assign [2:0] = [~di,~di,~di]; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule

```

**Notes:**

The original code works correctly, but it uses a procedural assign to store the result of the function in the array.
The problem with this code is that I need to modify the code to change the logic gate and/or the signal driving logic.

Is there any way of having the array element as the function result?

I'm using Icarus Verilog.

Thanks in advance.username_1: Here is an example of how to do what you request, using a procedural block and array indexing:

```
module tst_dff_p_a();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data

  initial begin
    $display ("%m: Top-level testbench module"); // Display testbench name
    $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  end

  int i;
  int mem [4];
  initial begin
    for(i=0; i<4; i=i+1)
      mem[i]=~di;
  end

  initial begin
    $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  end

endmodule

```
Upvotes: 1 username_2: You can achieve this by using a for loop inside the initial block. For example, say you want an array to store the results of a function call:

```
module tst_dff_p_a();

reg clk;
reg [3:0] do_arr;
reg [1:0] di;

dff_p d1(do, di, clk);

initial begin
for (int i = 0; i < 4; i++)
do_arr[i] = ~di; // Toggle data

clk = 0;
di = 1'b0;
#35 $stop;
end // Initialize & stop

always #3 clk = ~clk; // Generate clock
always #5 di = ~di; // Toggle data

initial $display ("%m: Top-level testbench module"); // Display testbench name

initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule

```
Upvotes: 0