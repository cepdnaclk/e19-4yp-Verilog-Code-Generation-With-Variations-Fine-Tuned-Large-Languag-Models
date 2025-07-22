module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;
endmodule

module testbench();
reg [15:0] din;
wire [15:0] dout;
reg [15:0] din_arr[] = {16'b1010101010101010, 16'b0101010101010101, 16'b1111000011110000, 16'b0000111100001111};
reg clk, resetn;
reg [15:0] din_arr[];
reg [15:0] dout_arr[];

dff_inst dflop(.D(din),.Clock(clk),.Resetn(resetn),.Q(dout));

always #5 clk = ~clk;

initial begin
clk = 0;
resetn = 0;
#10;
din = din_arr[0];
#10;
resetn = 1;
#10;
din = din_arr[1];
#10;
din = din_arr[2];
#10;
din = din_arr[3];
#10;
end

initial begin
#100;
if (dout == dout_arr[3]) begin
$display("Test case 4 passed!");
end else begin
$display("Test case 4 failed!");
end
#100;
$stop;
end

endmodule

### Explanation:
This testbench generates a dynamic array of input values and a dynamic array for output values to be used as inputs to the D flip flops. It then initializes the D flip flops with these arrays and checks the output value against the expected result. If the output matches