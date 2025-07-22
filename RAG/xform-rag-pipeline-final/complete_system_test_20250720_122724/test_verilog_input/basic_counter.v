module counter(
    input wire clk,
    input wire reset,
    output wire [7:0] count
);
    wire internal_signal;
    wire enable_signal;
    wire [3:0] status_wire;
    reg [7:0] counter_reg;
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            counter_reg <= 8'b0;
        else if (enable_signal)
            counter_reg <= counter_reg + 1;
    end
    
    assign count = counter_reg;
    assign internal_signal = clk & reset;
endmodule