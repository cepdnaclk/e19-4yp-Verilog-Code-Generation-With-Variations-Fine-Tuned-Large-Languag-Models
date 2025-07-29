module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
always_comb
begin
case(s)
2'b00: z = 1'b0 & c[0]; // Select c[0] when s=00
2'b01: z = 1'b0 & c[1]; // Select c[1] when s=01
2'b10: z = 1'b0 & c[2]; // Select c[2] when s=10
2'b11: z = 1'b0 & c[3]; // Select c[3] when s=11
endcase
end
endmodule
### Notes:
Simulation results show that the array elements can be tested seperately without the need to check the entire array. In the first modifiled code, the z value was declared as a 1-bit instead of a 4-bit, so the z output was not 1-bit.
### Simulation Results:
![mux41b_3](mux41b_3.png)
### Simulation Source Code:
```verilog
module tb_mux41b ();

// Inputs
reg [1:0] s;
reg [3:0] c;

// Outputs
wire z;

// Instantiate the Unit Under Test (UUT)
mux41b uut (
.c(c),
.s(s),
.z(z)
);

initial begin
$dumpfile("mux41b_3.vcd");
$dumpvars(1);
end

initial begin
s = 2'b00;
c = 4'b0000;

#100;
s = 2'b01;
#100;
s = 2'b10;
#100;
s = 2'b11;
#100;

s = 2'b00;
c = 4'b0100;
#100;
s = 2'b01;
c = 4'b1001;
#100;
s = 2'b10;
c = 4'b0011;
#100;
s = 2'b11;
c = 4'b1110;
#100;

$finish;
end

endmodule
```
### Results:
Results showed that with the modified code (m