module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
wire [3:0] WireX;
reg [3:0] WireY [0:3];
initial begin
    WireX = 4'b0000;
    for(int i = 0; i < 4; i++)
        WireY[i] = 4'b0000;
end
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0) begin
        WireX = 4'b0000;
        for(int i = 0; i < 4; i++)
            WireY[i] = 4'b0000;
    end
    else begin
        WireX = D;
        for(int i = 0; i < 4; i++)
            WireY[i] = D;
    end
endmodule
### Scope Overview:
### Scope Name:
reg4
### Top-Level Entities:
|Entity Name|Entity Type|
|---|---|
|reg4|module|
### Hierarchical Tree:
### Ports:
|Port Name|Port Type|Port Direction|Port Width|Description|
|---|---|---|---|---|
|Clock|input|in|1|Clock|
|D|input|in|4|D|
|Q|output|out|4|Q|
|Resetn|input|in|1|Resetn|
### Properties Used:
|Property Name|Property Type|Property Direction|Property Reference|
|---|---|---|---|
|always_ff|always_ff|continuous|Always|
|always_latch|always_latch|continuous|Always|
|always_comb|always_comb|continuous|Always|
|initial_block|initial_block|initial|Initial|
|final_block|final_block|final|Final|
|assert_known|assert_known|assert|Always|
|assert_known|assert_known|assert|Initial|
|clock_gate|clock_gate|assert|Always|
|clock_enable|clock_enable|assert|Always|
|latch_in_always|latch_in_always|assert|Always|
|latch_in_always|latch_in_always|assert|Initial|
|latch_out_always|latch_out_always|assert|Always|
|latch_out_always|latch_out_always|assert|Final|
|latch_edge_always|latch_edge_always|assert|Always|
|latch_edge_always|latch_edge_always|assert|Final|
|latch_final_block|latch_final_block|assert|Always|
|latch_final_block|latch_final_block|assert|Final|
|latch_in_always_0|latch_in_always_0|assert|Always|
|latch_in_always_0|latch_in_always_0|assert|Initial|
|latch_out_always_0|latch_out_always_0|assert|Always|
|latch_out_always_0|latch_out_always_0|assert|Final|
|latch_edge_always_0|latch_edge_always_0|assert|Always|
|latch_edge_always_0|latch_edge_always_0|assert|Final|
|latch_final_block_0|latch_final_block_0|assert|Always|
|latch_final_block_0|latch_final_block_0|assert|Final|
|latch_in_always_1|latch_in_always_1|assert|Always|
|latch_in_always_1|latch_in_always_1|assert|Initial|
|latch_out_always_1|latch_out_always_1|assert|Always|
|latch_out_always_1|latch_out_always_1|assert