```vhdl
module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch
reg [3:0] inside_val[0:5] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};  // Initalize inside operator
initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
end
always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
initial
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; // Stop simulation
endmodule
module dffen(do,di,en);
    parameter s_cnt_val = 16'h1111;
    reg [3:0]s_cnt;
    reg di,en,do;
    initial s_cnt=s_cnt_val;
    always @(s_cnt)
    begin
        if (s_cnt < 16'h0010)
            do <= 0;
        else if (s_cnt < 16'h0020)
            do <= 1;
        else if (s_cnt < 16'h0030)
            do <= 0;
        else if (s_cnt < 16'h0040) 
            do <= 1;
        else if (s_cnt < 16'h0050)
            do <= 0;
        else if (s_cnt < 16'h0060)
            do <= 1;
        else if (s_cnt < 16'h0070)
            do <= 0;
        else if (s_cnt < 16'h0080)
            do <= 1;
        else if (s_cnt < 16'h0090)
            do <= 0;
        else if (s_cnt < 16'h00a0)
            do <= 1;
        else if (s_cnt < 16'h00b0)
            do <= 0;
        else if (s_cnt < 16'h00c0)
            do <= 1;
        else if (s_cnt < 16'h00d0)
            do <= 0;
        else if (s_cnt < 16'h00e0)
            do <= 1;
        else if (s_cnt < 16'h00f0)
            do <= 0;
        else if (s_cnt < 16'h00ff)
            do <= 1;
        else if (s_cnt < 16'h00ff)
            do <= 0;
        else if (s_cnt < 16'h0101)
            do <= 1;
        else if (s_cnt < 16'h0100)
            do <= 0;
        else
            do <= 1;
        s_cnt <= s_cnt + 1;
    end
endmodule
module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch
reg [3:0] inside_val[0:5] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}; // Initalize inside operator	
initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
end
always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
initial
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; //