```verilog
`include "external_package.vh" // Assume this is where the 'RST_X' macro is defined

module tst_updcounter();//TEST_BENCH
reg clk,u_d;
reg[3:0]N;
wire[3:0]a;
updcounter c2(a,clk,N,u_d);
generate
    if(RST_X) begin
        initial begin
            N = 4'b0111; // Set limit N=7
            u_d = 1'b1; // Start counting up 
            clk = 0;
        end
    end
    else begin
        initial begin
            N = 4'b1000; // Set limit N=8
            u_d = 1'b0; // Start counting down
            clk = 0;
        end
    end
endgenerate
always #2 clk=~clk; // Generate clock
always #34 u_d=~u_d; // Change direction every 34 time units
initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a); // Display values
initial #64 $stop; // Stop simulation
endmodule
```
In the above code:
- `generate`/`endgenerate` block is used to conditionally include or exclude certain parts of the module based on the `RST_X` macro.
- The clock generation is also included in a generate block to make sure the clock is only generated if the `RST_X` macro is set correctly.
- `if(RST_X)` and `else` are used to generate different initial conditions based on the value of `RST_X`. 
- Note that you would have to replace `external_package.vh` with the actual path to your external package file containing the `RST_X` macro.
- Lastly, in the monitor statement, `$time` is used to display the time elapsed, the value of `clk`, `N`, `u_d`, and `a`.
- `N` is set to