module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;

defparam flipflop.lpm_mode = "DYNAMIC";
defparam flipflop.lpm_data_width = 10;
defparam flipflop.lpm_test_cases = {
{234,0},
{234,1},
{234,2},
{234,3},
{234,4},
{234,5},
{234,6},
{234,7},
{234,8},
{234,9},
{234,10},
{234,11},
{234,12},
{234,13},
{234,14},
{234,15},
{234,16},
{234,17},
{234,18},
{234,19},
{234,20},
{234,21},
{234,22},
{234,23}
};

endmodule

This testbench will generate 24 test cases to verify the function of the DFF_inst module.

The results are shown in the screenshots below:

The testbench fails on the second test case. This is because the reset is set to go low in the second test case. This results in the LPM data being overwritten by the reset value in the DFF_inst module.

The output of the third test case is also incorrect. This is because the D input is set to 1 in the third test case. This causes a negative edge on the clock, causing the value to be shifted to left.

In conclusion, this example module shows the capabilities of the LPM module inside a testbench. The module is flexible enough to pass in a dynamic array for data as a parameter.