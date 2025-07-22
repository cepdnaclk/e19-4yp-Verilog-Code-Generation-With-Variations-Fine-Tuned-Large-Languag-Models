```verilog
module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);

wire [2:0][3:0] switches = {
    sw[3:0],
    sw[3:0],
    sw[3:0]
};

wire [2:0][2:0] priority_switches;
wire [2:0] [2:0] priority_out;

// Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
gates4 U1 (
.x(switches[0]),
.and4_(priority_out[0]),
.or4_(priority_out[1]),
.xor4_(priority_out[2])
);


always_ff @(posedge clk) begin
    priority_switches[0] <= priority_out;
    priority_switches[1] <= priority_out;
    priority_switches[2] <= priority_out;
end

// Select the output based on the priority
always_comb begin
    ld[0] = priority_switches[0][0];
    ld[1] = priority_switches[0][1];
    ld[2] = priority_switches[0][2];

    if (priority_switches[0][0]!= 1'bX) begin
        // Nothing needed
    end else if (priority_switches[1][0]!= 1'bX) begin
        ld[0] = priority_switches[1][0];
        ld[1] = priority_switches[1][1];
        ld[2] = priority_switches[1][2];
    end else if (priority_switches[2][0]!= 1'bX) begin
        ld[0] = priority_switches[2][0];
        ld[1] = priority_switches[2][1];
        ld[2] = priority_switches[2][2];
    end
end
endmodule
```
This code creates a 3x