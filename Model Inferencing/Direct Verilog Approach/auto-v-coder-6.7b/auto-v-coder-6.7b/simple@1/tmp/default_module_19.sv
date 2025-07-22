```verilog
module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;
endmodule

module tb_dff_inst;
reg D, Clock, Resetn;
wire Q;

dff_inst dff_inst_inst(.D(D),.Clock(Clock),.Resetn(Resetn),.Q(Q));

initial begin
    // Initialization
    D = 0;
    Clock = 0;
    Resetn = 0;
    #0
    Resetn = 1;
    #40
    $display("Q after reset = %b", Q);
    D = 1;
    #100
    $display("Q after 100ns = %b", Q);
    // Adding dynamic array test cases
    integer i;
    integer arr[4] = {0, 1, 0, 1};
    for (i = 0; i < 4; i = i + 1) begin
        D = arr[i];
        #200
        $display("Q after %dns = %b", i*100, Q);
    end
    $finish;
end

always #50 Clock = ~Clock;

endmodule
```
In the testbench, the `dff_inst` module is instantiated with 4 different input test cases (0, 1, 0, 1) for `D` input. The output `Q` of the flip-flop is printed at the completion of each test case.

Note: This code assumes that we have a clock signal which is toggling every 50ns. Also, the `lpm_ff` component used in the dff_inst module is a part of Intel's Lattice Programmer's Manual (LPM) which is not available in commercial use. You can replace it with other flip-flops or use different simulation models according to your preference.