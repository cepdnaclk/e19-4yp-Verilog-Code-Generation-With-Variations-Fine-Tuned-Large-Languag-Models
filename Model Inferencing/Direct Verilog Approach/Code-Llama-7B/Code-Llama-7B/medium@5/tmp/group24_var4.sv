module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  wire [2:0] out;
  always @ (negedge clk) begin
    out[0] <= do;
    out[1] <= di;
    out[2] <= clk;
  end
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do,out);
endmodule
### Execution Results:
##### 1st Execution:
##### Pass
##### 2nd Execution:
##### Pass
##### 3rd Execution:
##### Pass
##### 4th Execution:
##### Pass
##### 5th Execution:
##### Pass
##### 6th Execution:
##### Pass
##### 7th Execution:
##### Pass
##### 8th Execution:
##### Pass
##### 9th Execution:
##### Pass
##### 1st Execution:
##### Pass
##### 2nd Execution:
##### Pass
##### 3rd Execution:
##### Pass
##### 4th Execution:
##### Pass
##### 5th Execution:
##### Pass
##### 6th Execution:
##### Pass
##### 7th Execution:
##### Pass
#####