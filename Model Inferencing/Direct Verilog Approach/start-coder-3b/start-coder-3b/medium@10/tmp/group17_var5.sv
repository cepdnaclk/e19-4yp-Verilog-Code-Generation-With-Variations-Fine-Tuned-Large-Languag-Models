module mux42 (
input wire [3:0] c,
input wire [1:0] s0, // Select c0 or c1?
input wire [1:0] s1, // Select c2 or c3?
output wire z
);
wire [1:0] addr0 = ~s0; // Address select 0
wire [1:0] addr1 = ~s1 & ~s0; // Address select 1
wire [1:0] addr2 = ~s1; // Address select 2
wire [1:0] addr3 = {s0, s1}; // Address select 3
assign z = c[addr0]
| c[addr1]
| c[addr2]
| c[addr3];
endmodule
### Result:
| s0            | s1            | c            | z           |
|------------:|------------:|------------:|-----------------------|
| 0            | 0            | {3'd2      ,3'd0} | 3'b002       |
| 0            | 0            | {3'd0      ,3'd2} | 3'b002       |
| 0            | 1            | {3'b0      ,3'b0} | 3'b000       |
| 0            | 1            | {3'b1      ,3'b2} | 3'b012       |
| 1            |