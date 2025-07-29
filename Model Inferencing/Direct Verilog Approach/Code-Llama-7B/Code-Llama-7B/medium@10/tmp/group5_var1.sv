```verilog
module mux_tb;
wire [31:0] in0, in1, in2, in3, sel, out;
reg [31:0] in0, in1, in2, in3;
reg sel;
mux_8_1 mux(out, sel, in0, in1, in2, in3);
initial begin
in0=32'b00000000000000000000000000000001;
in1=32'b00000000000000000000000000000010;
in2=32'b00000000000000000000000000000100;
in3=32'b00000000000000000000000000001000;
sel=0;
end
always #10 sel = ~sel;
endmodule
```
### Modified Design Testbench:
```verilog
module tb_mux;
reg [31:0] in0, in1, in2, in3;
wire [31:0] out;
reg sel;
mux_tb dut(in0,in1,in2,in3,out,sel);
initial begin
in0=32'b0000000000000000000000000