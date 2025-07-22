```
module addern(carryin, X, Y, S, carryout);
parameter n = 16;
input carryin;
input [n-1:0] X, Y;
output [n-1:0] S;
output carryout;
reg [n-1:0] S;
reg [n:0] C;
reg carryout;
integer k;
always @(X or Y or carryin)
begin
    C[0] = carryin;
    for (k = 0; k <= n-1; k = k + 1)
    begin
        S[k] = X[k] ^ Y[k] ^ C[k];
        C[k+1] = (X[k] & Y[k]) | (C[k] & X[k]) | (C[k] & Y[k]);
    end
    carryout = C[n];
    data_mod = {{16{1'b1}}, data_mod, data_mod, data_mod};
end
endmodule

module dut(input [15:0] data);
input [1:0] sel;
input [15:0] sel_data;
wire [15:0] data_mod;
initial
begin
    case (sel)
        0: data_mod <= data;
        1: data_mod <= data_mod + sel_data;
        2: data_mod <= data_mod - sel_data;
    endcase
end
endmodule

module top;
reg [1:0] sel;
reg [15:0] sel_data;
addern adder1 (
   .carryin(sel[0]),
   .X({data, data_mod}),
   .Y({data, data_mod}),
   .S({data, data})
);
assign carryout = adder1.carryout;
initial
begin
    for(;;)
    begin
        sel = {~sel[0], sel[0]};
        sel_data = {{16{1'b1}}, sel_data, sel_data, sel_data};
        #5;
    end
end
endmodule
```
</details>

## 4.6
<details>
	<summary>Show</summary>

### Base Verilog Code:
module addern(carryin,