module test_dff_inst();
parameter N=2;
reg D[N-1:0], Clock, Resetn;
wire Q[N-1:0];
dff_inst i0(D[1], Clock, Resetn, Q[1]);
dff_inst i1(D[0], Clock, Resetn, Q[0]);

initial begin
    $display("Running Tests");
    Resetn = 1'b0;
    Clock = 1'b0;
    #10
    Resetn = 1'b1;
    D[1] = 1'b1;
    D[0] = 1'b1;
    #10
    D[1] = 1'b0;
    D[0] = 1'b0;
    #10
    D[1] = 1'b1;
    D[0] = 1'b1;
    #10
    D[1] = 1'b0;
    D[0] = 1'b0;
    #10
    D[1] = 1'b1;
    D[0] = 1'b1;
    #10
    D[1] = 1'b0;
    D[0] = 1'b0;
    #10
    Clock = 1'b1;
    #10
    Clock = 1'b0;
    #10
    Clock = 1'b1;
    #10
    $stop;
end
endmodule
### Verification:
![Verification](../../../img/2019/07/verification.PNG)

### Conclusion:
This testbench verifies that the D flipflop instance is implemented correctly.

### Challenges:
### 1. Test for all inputs
### 2. Verify that all the test cases behave as expected.
### 3. Modify the testbench to include an input clock.
### 4. Modify the testbench to include an output clock.
##