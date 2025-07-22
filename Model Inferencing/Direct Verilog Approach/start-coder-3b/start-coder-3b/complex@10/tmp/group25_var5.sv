`module top (x, y, G, B, R);`
`input [3:0] x; // x is the value provided by MUX`
`input [3:0] y; // y is the value provided by MUX`
`output [3:0] G; // G is the value to be displayed on the LEDs`
`output [3:0] B; // B is the value to be displayed on the LEDs`
`output [3:0] R; // R is the value to be displayed on the LEDs`

`wire [3:0] G_w;
`wire [3:0] B_w;
`wire [3:0] R_w;`

`wire [1:0] MUX_out_w;
`assign MUX_out_w = {y[3], x[3]};`

`assign G_w = MUX(G, MUX_out_w, 3'b000);`
`assign B_w = MUX(B, MUX_out_w, 3'b001);`
`assign R_w = MUX(R, MUX_out_w, 3'b010);`

`always @(posedge clk) begin`
`G <= G_w;`
`B <= B_w;`
`R <= R_w;`
`end`
`endmodule`
`module t_top();`
`reg x; // x is the value provided by MUX`
`reg y; // y is the value provided by MUX`
`wire [3:0] G; // G is the value to be displayed on the LEDs`
`wire [3:0] B; // B is the value to be displayed on the LEDs`
`wire [3:0] R; // R is the value to be displayed on the LEDs`

`initial begin`
`x <= 1;`
`y <= 0;`
`end`
`endmodule`
### Output Log:
`[Test@t_top.sv:17] G = 0b0001, B = 0b0000, R = 0b0000`

`[Test@t_top.sv:17] G = 0b0001, B = 0b0001, R = 0b0000`

`[Test@t_top.sv:17] G = 0b0001, B = 0b0011, R = 0b0001`

`[Test@t_top.sv:17] G = 0b0011, B = 0b0011, R = 0b0011`

`[Test@t_top.sv:17] G = 0b0011, B = 0b0111, R = 0b0011`

`[Test@t_top.sv:17] G = 0b0111, B = 0b0111, R = 0b0111`

`[Test@t_top.sv:17] G = 0b0111, B = 0b1111, R = 0b1111`

`[Test@t_top.sv:17] G = 0b01