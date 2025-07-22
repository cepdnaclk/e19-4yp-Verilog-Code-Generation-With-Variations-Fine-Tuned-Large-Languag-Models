```
module tst_mup; // Testbench for Microprocessor
reg clk,en,int; // Clock, Enable, Interrupt inputs
// Assuming mup_opr is the microprocessor module instance
// mup_opr rr(clk,int,en); // Instantiation needed
initial
begin
int=1'b0;clk=1'b0;en=1'b0; // Initialize
end
always #2 clk=~clk; // Generate clock
// Monitor clock, time, inputs, and internal MUP registers (pc, ir, dcop)
initial $monitor("clk=%b, t=%0d, en=%b, int=%b, rr.pc=%0d, rr.ir=%0h, rr.dcop=%0d", clk,$time,en,int,rr.pc,rr.ir,rr.dcop); // Corrected format specifiers
// mup_opr rr(clk,int,en); // Instantiate DUT
initial #40 $stop; // Stop simulation
endmodule
```

## 8. Testing with Verilator
1. Create a testbench for the multiplier as follows.
1.1. Create the file `mup_tb.cpp`.
```
main() {
    Verilated::randReset(2); // Force reset

    // Instantiate module
    tst_mup *top = new tst_mup;

    // Reset and setup the clock
    top->clk = 0;
    top->rst = 1;
    top->eval();

    // Clocking
    for (int i=0; i<100; i++) {
        top->clk = 1;
        top->eval();
        top->clk = 0;
        top->eval();
        wait();
    }

    // Run simulation
    while (1) {
        top->int = 1;
        top->eval();
        top->clk = 1;
        top->eval();
        if (top->rst) {
            top->rst = 0;
            top->eval();
        }
        top->clk = 0;
        printf("\n");
        top->eval();
        wait();
    }
}
```
1.2. Compile the testbench as follows (from the `mup` directory)
```
verilator -Wno-lint --cc --trace --exe mup_tb.cpp
```
1.3. Run the simulation (from the `obj_dir` directory)
```
./Vtop
```

## 9. Testing with the Modelsim Simulator
1. Create a testbench for the multiplier as follows.
1.1. Create the file `mup_tb.v`.
```
module mup_tb;
reg clk,rst,int,en; // Clock, Reset, Enable, Interrupt inputs
reg [31:0]dcop; // Data Output Port
reg [31:0]dcop_check; // Data Output Port Check
reg [31:0]pc; // Program Counter
reg [3:0]ir; // Instruction Register

initial
begin
int=0;clk=0;en=0;rst=0; // Initialize
end

always #2 clk=~clk; // Generate clock

// Check for DCOp value (Data Output Port value)
initial begin
#40 rst=1; // Reset to be asserted
end
always @(posedge clk) begin
dcop_check <= dcop;
end
// DCOp is now checked. Reset to be de-asserted
always @(posedge clk) begin
if (~rst) dcop=32'h0;
end
// Reset is now de-asserted
```
1.2. Instantiate the multiplier module as follows.
```
mup mup_opr(.clk(clk),.int(int),.en(en),.pc(pc),.ir(ir),.dcop(dcop));
```
1.3. Compile the testbench as follows (from the `mup` directory)
```
vcs -full64 +v2k -sverilog mup_tb.v
```
1.4. Run the simulation (from the `sim` directory)
```
./simv
```
1.5. Observe the output.
```
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--