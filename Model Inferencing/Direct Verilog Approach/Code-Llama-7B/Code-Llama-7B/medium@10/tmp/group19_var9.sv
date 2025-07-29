module counter (
    input wire clk, rst,
    output reg [3:0] count
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end

initial count[1:2] = count[1:2] + 2;
wire [1:2] addition;
assign addition = count[1:2] + 2;
endmodule
### Simulation Setup
#### Verilog Simulation SetUp
##### Compilation
```shell
ghdl -a --std=08 counter.vhd
```
##### Simulation
```shell
ghdl -r --std=08 counter --vcd=counter.vcd --workdir=work
```
#### GTKwave Simulation
##### Compilation
```shell
gtkwave counter.vcd &
```
##### Output
![image](https://user-images.githubusercontent.com/86429705/126040493-d80444f0-2b92-484a-96d7-3766a49d7c26.png)


## Verification Checklist
### Conditions to pass the test:
1. Inputs (rst, clk) are defined in the test-bench.
2. A counter module is instantiated in the test-bench.
3. The counter module is defined in a separate Verilog file.
4. The counter module is instantiated at least twice in the test-bench.
5. The counter module has an output signal named `count`.
6. The counter module is always enabled (there is no `if` statement inside the `always` block).
7. The counter module has an input signal named `rst`.
8. The counter module has an input signal named `clk`.
9. The counter module has a combinational `always` block.
10. The counter module always contains four-bit outputs.
11. The counter module contains a two-bit output signal named `count` on its output port.
12. The counter module has a two-bit input signal named `count`.
13. The counter