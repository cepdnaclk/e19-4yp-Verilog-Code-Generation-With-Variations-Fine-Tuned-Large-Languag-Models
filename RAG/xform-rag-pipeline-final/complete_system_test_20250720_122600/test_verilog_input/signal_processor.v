module processor(
    input wire clk,
    input wire [7:0] data_in,
    output wire [7:0] data_out
);
    wire [7:0] buffer_signal;
    wire [3:0] control_signal;
    reg [15:0] accumulator;
    
    always @(posedge clk) begin
        accumulator <= accumulator + data_in;
    end
    
    assign data_out = accumulator[7:0];
endmodule