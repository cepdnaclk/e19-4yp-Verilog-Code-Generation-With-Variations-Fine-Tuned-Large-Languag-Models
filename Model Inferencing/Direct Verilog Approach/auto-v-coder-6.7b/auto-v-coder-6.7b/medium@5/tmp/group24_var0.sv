```verilog
module tst_dff_p_b();
  reg di,clk; wire do;
  reg [3:0] a; wire [3:0] b;
  
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin
    clk=0; di=1'b0; a=4'b1010; #35 $stop;
  end // Initialize & stop
  
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial begin
    $monitor($time," clk=%b, di=%b, do=%b, a=%b, b=%b",clk,di,do,a,b);
    b = {a[3], a[2], a[1], a[0]};
  end
endmodule
```
In the above code, the initial block is used to assign values to the variables before the simulation starts. The `$display` and `$monitor` statements are used to display the simulation status at runtime. The array `a` is being initialized with a value 1010 (1'b1010 in binary notation) and `b` is being procedurally assigned to be the reverse order of `a`. `b={a[3], a[2], a[1], a[0]}` is a valid syntax in verilog for reverse order.

Please modify the array index according to your understanding.### Note:
You would require a DFF model, "dff_p.v". 

If you want to simulate the model. You would need to compile all the.v files (.sv files). Use the command `iverilog -o output_file.vvp input_file.v` from the command prompt to compile all files and run the simulation.

Use `vvp output_file.vvp` command to execute the simulation from the command prompt. 

This simulation might not display the correct results as the DFF model doesn't have a specific functionality. It will just toggle