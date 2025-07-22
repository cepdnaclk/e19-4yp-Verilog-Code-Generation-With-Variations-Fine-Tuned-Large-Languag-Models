module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch

`ifdef inside
always @(*)
begin
di=1'b1;
end

`endif

initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
end
always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
initial
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; // Stop simulation
endmodule
### Command:
iverilog -o test bench.v
vvp test bench.v -lxt2
### Output:
[william@centos tst_dffbehen]$ iverilog -o test bench.v
[william@centos tst_dffbehen]$ vvp test bench.v -lxt2
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
[william@centos tst_dffbehen]$ iverilog -o test bench.v
[william@centos tst_dffbehen]$ vvp test bench.v -lxt2
en=0 di=0 do=0
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=1 di=0 do=0
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=1 di=1 do=1
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=0 do=0
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=1 do=1
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=1 do=1
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=0 do=0
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=1 do=1
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=1 do=1
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=0 do=0
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=1 do=1
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=1 do=1
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=0 do=0
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=1 do=1
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=1 do=1
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=0 do=0
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=1 do=1
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=1 do=1
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
en=0 di=0 do=0
William-Mateusz-PC@William-Mateusz-PC MINGW32 /cygdrive/c/Users/William/Documents
end

# 46.

Code:
module tb_top_level_tb;//top level testbench
/* Instantiate the design under test (DUT) */
Instance dut_inst(top_level, "top_level");
/* Instantiate a stimulus module */
Instance stim_inst(stimulus, "stimulus");
endmodule

module top_level(clk, rst_n);//top_level
/* Instantiate a DUT */
Instance dut_inst("dut");
/* Instantiate a stimulus module */
Instance stim_inst("stim");
/* Instantiate a clock generator */
Instance clk_inst("clk_gen", clk_gen);
/* Instantiate a reset generator */
Instance rst_gen_inst("rst_gen", rst_gen);
/* Instantiate the clock and reset generator ports */
Connect clk_inst.clk_out(clk);
Connect rst_gen_inst.rst_n_in(rst_n);
endmodule

module stimulus(clk);//stimulus
// Define the stimulus signals
Reg clk_gen_state;
Wire clk;

/* Create the stimulus ports */
Input clk;
Input rst_n;
Output reg [7:0] i;
Output reg [7:0] j;
Output reg [7:0] k;
Output reg [7:0] l;

/* Instantiate the DUT */
Instance dut("top_level");

/* Define the clock and reset signal for the DUT */
Connect clk_gen_state(clock_state); // Clock state signal
Connect clk(clock_signal); // Clock output signal
Connect rst_n(reset); // Reset input signal

/* Define the stimulus timing */
// Define the stimulus delay period
Reg delay_period;
Wire delay_done;
// Set the delay period from command line
Connect delay_period(period);
// Define the stimulus delays

/* Connect the interface */
Connect i(dut.top_level.i);
Connect j(dut.top_level.j);
Connect k(dut.top_level.k);
Connect l(dut.top_level.l);

/* Instantiate the counter module */
Instance counter("counter");
Connect clk(counter.clk);
Connect reset(counter.rst_n);

/* Instantiate the multiplier module */
Instance multiplier("multiplier");
Connect clk(multiplier.clk);
Connect reset(multiplier.rst_n);

/* Instantiate the multiplier interface */
Connect i(multiplier.i);
Connect j(multiplier.j);
Connect k(multiplier.k);
Connect l(multiplier.l);

/* Instantiate the result display module */
Instance result_display("result_display");
Connect clk(result_display.clk);
Connect counter.done(result_display.counter_done);
Connect multiplier.done(result_display.multiplier_done);
Connect delay_done(result_display.delay_done);
endmodule

module clk_gen(clk);//clk_gen module
Reg clock_state;
Reg delay_period;
Wire clk;
Wire delay_done;

Initial
Begin
Clock_state = 0;
End

Always @(posedge delay_period);
Begin
If(clock_state == 0)
Begin
Clock_state = 1;
End

Else If(clock_state == 1)
Begin
Clock_state = 0;
End

End

Always @(posedge clock_state); // Clock state
Begin
If(clock_state == 1)
Begin
Clk = 1'b1;
End

Else