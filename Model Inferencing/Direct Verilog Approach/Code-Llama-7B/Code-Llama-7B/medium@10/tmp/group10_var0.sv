module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
reg [6:0] buf_array [7:0];
reg [3:0] d_buf_0, d_buf_1;
always @(posedge Clock)
    if (Resetn == 0) begin
        Q <= 4'b0000;
        d_buf_0 <= 4'b0000;
    end else begin
        Q <= D;
        d_buf_0 <= D;
    end
assign buf_array[0] = d_buf_0;
assign buf_array[1] = d_buf_1;
always @(posedge Clock)
    d_buf_1 <= buf_array[0];
endmodule
### Note:
This is a very simple example, but the buffering array is declared as an input signal to the
module to facilitate verification. However, this is also a warning that your code has gone
quite far from being a synthesizable Verilog module.
(If your code is indeed synthesizable, you should be able to ignore this warning)
### Verification:
The verification code is the same as the original one. The testbench is also the same as the original one, except that we added the following code to the beginning:
```verilog
reg [3:0] d_buf_0, d_buf_1;
```
and
```verilog
assign buf_array[0] = d_buf_0;
assign buf_array[1] = d_buf_1;
always @(posedge CLK)
    d_buf_1 <= buf_array[0];
```
And we modified the stimuli part to this:
```verilog
initial begin
    CLK = 0;
    RST = 0;
    D = 4'b0001;
    #10 RST = 1;
    #10 D = 4'b0010;
    #10 D = 4'b0011;
    #10 D = 4'b0100;
    #10 D = 4'b0101;
    #10 D = 4'b0110;
    #10 D = 4'b0111;
    #10 D = 4'b1000;
    #10 D = 4'b1001;
    #10 D = 4'b1010;
    #10 D = 4'b1011;
    #10 D = 4'b1100;
    #10 D = 4'b1101;
    #10 D = 4'b1110;
    #10 D = 4'b1111;
    #10 D = 4'b0000;
    #10 RST = 0;
    #90 $finish;
end
```
The waveform is the same as before, except that now the output starts from `0000` to `0001` to `1111` to `0000`, and then back to `0000`.

### Code:

* [Source](../src/tutorial16.v)
* [Testbench](../src/tutorial16_tb.v)

## Tutorial 17
### Description:
This tutorial will show you how to use if-else and case in Verilog.

### Base Verilog Code:
```verilog
module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= D;
endmodule
```
### Variation Instructions:
Add logic to make the outputs of the Qs to change to 4'd7 when Q[0] is 1'