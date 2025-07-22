module my_module();
reg a;

always @* begin
a = ~a;
end

initial begin
a = 1'b1;
end

endmodule

## 4.9.1.6
### Base Verilog Code:
module my_module();
reg a;

always @* begin
a = ~a;
end

always @ (posedge clk or negedge clk) begin
a