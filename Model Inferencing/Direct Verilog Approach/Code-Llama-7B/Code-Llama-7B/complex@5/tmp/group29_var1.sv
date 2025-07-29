```
module hex_to_7seg (a, SEG);
output [6: 0] SEG;
input [3: 0] a;
initial  begin
a = 4'b0000;
end
parameter [3: 0] DIGITS = { 
"0001", "1001", "0010", "1010",
		"0011", "1011", "0100", "1100",
		"0101", "1101", "0110", "1110",
		"0111", "1111"};

integer i;
initial begin
SEG = 7'b1000000;
end
wire x = a;
reg [3: 0] array;
wire y;
generate
for (i = 0; i < 16; i=i+1) begin
x = (i >> 1);
y = (x == a)? 1 : 0;
array[i] = y;
end
endgenerate

endmodule
```
### Original Code
```
module hex_to_7seg (a, SEG);
output [6: 0] SEG;
input [3: 0] a;
initial  begin
a = 4'b0000;
end
parameter [3: 0] DIGITS = {
"0001100", "0011001", "0010011", "1111101",
		"0110001", "1101101", "1101001", "0110000",
		"0001101", "0011011", "0010011", "1111111",
		"1001111", "1000111", "1000011", "0000000"};

integer i;
initial begin
SEG = 7'b1000000;
end
wire x = a;
reg [3: 0] array;
wire y;
generate
for (i = 0; i < 16; i=i+1) begin
x = (i >> 1);
y = (x == a)? 1 : 0;
array[i] = y;
end
endgenerate

endmodule
```
### Output
![](https://raw.githubusercontent.com/Yukaii/Yukaii.github.io/master/img/3.png)

### Differences
![](https://raw.githubusercontent.com/Yukaii/Yukaii.github.io/master/img/4.png)