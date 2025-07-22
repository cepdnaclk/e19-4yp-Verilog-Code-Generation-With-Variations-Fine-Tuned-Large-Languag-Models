```verilog
`include "external_package.vh"

module tst_updcounter();//TEST_BENCH
reg clk,u_d;
reg[3:0]N;
wire[3:0]a;
updcounter c2(a,clk,N,u_d);

generate
    genvar i;
    for(i=0; i<4; i++) begin
        if (RST_X[i]) begin
            always #10 clk=~clk; // Generate clock
        end
    end
endgenerate

initial
begin
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up
clk = 0;
end

always #2 u_d=~u_d; // Change direction every 2 time units

initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a); // Display values

initial #100 $stop; // Stop simulation
endmodule
```

`RST_X[i]` is assumed to be a signal defined by you, whose value you want to check.

In this code, we first include the `external_package.vh` where the signals are defined. Then we generate a clock using `generate` block and `for loop`. We check whether `RST_X[i]` is present in the array or not. If it's present, then the `always` block will be evaluated and the clock will be generated.

Please note that the code assumes that the `external_package.vh` has already been included and provides the correct definition of the signals in question. If the signal is not defined as `RST_X`, replace `RST_X` with the correct signal name.

Also, the `#100 $stop;` line will stop the simulation after 100 time units. Adjust this based on your requirements.

Please remember this is a sample code, and actual implementation may vary based on your requirement. Always double-check the syntax and logic of your code before using it.###