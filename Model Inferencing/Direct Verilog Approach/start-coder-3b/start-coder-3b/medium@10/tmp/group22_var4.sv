reg a;
localparam [7:0] arr_l = 2'h10;
always @(arr_l[3:1]) begin
a = arr_l[4];
$display ("t=%0t arr_l[3:1] = %b", $time, arr_l[3:1]);
end
### Base Verilog Code:
module nil;
reg a;
localparam [7:0] arr_l = 2'h10;
initial
begin
a = 1'b0;
$display ("t=%0t display: a = %b", $time, a); // Added time
end
always @(arr_l[3:1]) begin
a = arr_l[4];
$display ("t=%0t arr_l[3:1] = %b", $time, arr_l[3:1]);
end
// Monitor triggers at t=0, t=3, t=4, t=5, t=6
endmodule