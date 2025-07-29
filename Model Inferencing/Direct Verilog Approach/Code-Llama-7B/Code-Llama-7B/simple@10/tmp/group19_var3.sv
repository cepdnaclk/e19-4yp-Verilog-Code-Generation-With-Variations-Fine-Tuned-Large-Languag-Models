```
module testbench;
reg Clk, Resetn;
integer i;
reg [31:0] data_in_array[3:0];
wire [31:0] Q;

dff_inst dff_inst0 (data_in_array[0], Clk, Resetn, Q);
dff_inst dff_inst1 (data_in_array[1], Clk, Resetn, Q);
dff_inst dff_inst2 (data_in_array[2], Clk, Resetn, Q);
dff_inst dff_inst3 (data_in_array[3], Clk, Resetn, Q);

initial
begin
    Clk = 0;
    Resetn = 1;
end

always #0.5 Clk = ~Clk;

initial begin
    #5 Resetn = 0;
    data_in_array[0] = 32'd1;
    data_in_array[1] = 32'd2;
    data_in_array[2] = 32'd3;
    data_in_array[3] = 32'd4;
    #10 Resetn = 1;
    data_in_array[0] = 32'd5;
    data_in_array[1] = 32'd6;