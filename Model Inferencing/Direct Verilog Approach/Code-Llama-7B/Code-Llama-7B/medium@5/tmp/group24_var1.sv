module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial begin
    $display ("%m: Top-level testbench module"); // Display testbench name
    $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
    do = dff_p_b(di,clk);
  end
endmodule
### Result:
##### Without Instantiation:
![image](https://user-images.githubusercontent.com/44061960/135688446-9538cfd2-a370-4678-b269-945f1c96f2d6.png)
##### After Instantiation:
![image](https://user-images.githubusercontent.com/44061960/135688506-4e2422bd-240c-4c24-9d