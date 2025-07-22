module test(input clk, a_in, output a_out);
wire a;
reg x, y, z;
always @ (posedge clk or posedge a_in) begin
    x = #10 a;
end
endmodule