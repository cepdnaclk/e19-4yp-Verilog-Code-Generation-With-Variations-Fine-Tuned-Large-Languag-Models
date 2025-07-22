```
module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule

```

### Output:

```
19:32:52 $timescale 1ns / 1ps
19:32:52 $end
19:32:52 50,000,000
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.
19:32:52.

19:32:52 dff_p (do=0,di=0,clk=0): Initial state 
19:32:52 dff_p (do=0,di=0,clk=0)
19:32:52 dff_p (do=0,di=0,clk=1): Rising edge
19:32:52 dff_p (do=1,di=0,clk=1)
19:32:52 dff_p (do=1,di=1,clk=1): Rising edge
19:32:52 dff_p (do=1,di=1,clk=0): Falling edge
19:32:52 dff_p (do=1,di=0,clk=0)
19:32:52 dff_p (do=1,di=0,clk=1): Rising edge
19:32:52 dff_p (do=0,di=0,clk=1): Falling edge
19:32:52 dff_p (do=0,di=0,clk=0)
19:32:52 dff_p (do=0,di=0,clk=1): Rising edge
19:32:52 dff_p (do=1,di=0,clk=1)
19:32:52 dff_p (do=1,di=1,clk=1): Rising edge
19:32:52 dff_p (do=1,di=1,clk=0): Falling edge
19:32:52 dff_p (do=1,di=0,clk=0)
19:32:52 dff_p (do=1,di=0,clk=1): Rising edge
19:32:52 dff_p (do=0,di=0,clk=1): Falling edge
19:32:52 dff_p (do=0,di=0,clk=0)
19:32:52 dff_p (do=0,di=0,clk=1): Rising edge
19:32:52 dff_p (do=1,di=0,clk=1)
19:32:52 dff_p (do=1,di=1,clk=1): Rising edge
19:32:52 dff_p (do=1,di=1,clk=0): Falling edge
19:32:52 dff_p (do=1,di=0,clk=0)
19:32:52 dff_p (do=1,di=0,clk=1): Rising edge
19:32:52 dff_p (do=0,di=0,clk=1): Falling edge
19:32:52 dff_p (do=0,di=0,clk=0)
19:32:52 dff_p (do=0,di=0,clk=1): Rising edge
19:32:52 dff_p (do=1,di=0,clk=1)
19:32:52 dff_p (do=1,di=1,clk=1): Rising edge
19:32:52 dff_p (do=1,di=1,clk=0): Falling edge
19:32:52 dff_p (do=1,di=0,clk=0)
19:32:52 dff_p (do=1,di=0,clk=1): Rising edge
19:32:52 dff_p (do=0,di=0,clk=1): Falling edge
19:32:52 dff_p (do=0,di=0,clk=0)
19:32:52 dff_p (do=0,di=0,clk=1): Rising edge
19:32:52 dff_p (do=1,di=0,clk=1)
19:32:52 dff_p (do=1,di=1,clk=1): Rising edge
19:32:52 dff_p (do=1,di=1,clk=0): Falling edge
19:32:52 dff_p (do=1,di=0,clk=0)
19:32:52 dff_p (do=1,di=0,clk=1): Rising edge
19:32:52 dff_p (do=0,di=0,clk=1): Falling edge
19:32:52 dff_p (do=0,di=0,clk=0)
19:32:52 dff_p (do=0,di=0,clk=1): Rising edge
19:32:52 dff_p (do=1,di=0,clk=1)
19:32:52 dff_p (do=1,di=1,clk=1): Rising edge
19:32:52 dff_p (do=1,di=1,clk=0): Falling edge
19:32:52 dff_p (do=1,di=0,clk=0)
19:32:52 dff_p (do=1,di=0,clk=1): Rising edge
19:32:52 dff_p (do=0,di=0,clk=1): Falling edge
19:32:52 dff_p (do=0,di=0,clk=0)
19:32:52 dff_p (do=0,di=0,clk=1): Rising edge
19:32:52 dff_p (do=1,di=0,clk=1)
19:32:52 dff_p (do=1,di=1,clk=1): Rising edge
19:32:52 dff_p (do=1,di=1,clk=0): Falling edge
19:32:52 dff_p (do=1,di=0,clk=0)
19:32:52 dff_p (do=1,di=0,clk=1): Rising edge
19: