module tst_dff_p_b_add();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  int data[10]; // Declare an array of 10 bits
  initial begin
    for (int i=0; i<10; i=i+1) data[i]=i; // Populate the array
    $display("Array data in initial block = %p", data); // Display array
  end
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=