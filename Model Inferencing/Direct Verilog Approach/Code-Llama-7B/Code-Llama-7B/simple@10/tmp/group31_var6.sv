module func1(x1, x2, x3, f);
input x1, x2, x3;
output signed logic f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Constraints:
#### 1) This test is synthesizable

### Results:
#### 1) This test is synthesizable
#### 2) Changing the output type from logic to logic signed makes the test synthesizable.
#### 3) When the output type is changed from logic to logic signed, the output value of this test changes from a 32 bit vector (4 bits for each f) to a 64 bit vector (8 bits for each f).

### Original verilog file:
```
module func1(x1, x2, x3, f);
input x1, x2, x3;
output f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
```
### Variation file:
```
module func1(x1, x2, x3, f);
input x1, x2, x3;
output signed logic f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
```
### Synthesized Verilog code:
```
module func1 (input  wire [3:0] x1,
input  wire [3:0] x2,
input  wire [3:0] x3,
output wire [7:0] f);

wire [7:0] x1_muxed;
wire [7:0] x2_muxed;
wire [7:0] x3_muxed;
wire [7:0] not_x