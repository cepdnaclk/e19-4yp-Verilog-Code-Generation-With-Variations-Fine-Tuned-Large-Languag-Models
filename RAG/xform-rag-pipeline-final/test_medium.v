// test_medium.v - Medium complexity module
module medium_test(
    input wire clk,
    input wire reset,
    input wire [15:0] addr,
    input wire [31:0] data_in,
    output reg [31:0] data_out,
    output reg ready
);
    reg [31:0] memory [0:65535];
    reg [7:0] counter;
    reg [3:0] state;
    wire [31:0] processed_data;
    
    parameter IDLE = 4'h0;
    parameter READ = 4'h1;
    parameter PROCESS = 4'h2;
    parameter WRITE = 4'h3;
    
    assign processed_data = data_in ^ 32'hDEADBEEF;
    
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            data_out <= 32'h0;
            ready <= 1'b0;
            counter <= 8'h0;
            state <= IDLE;
        end else begin
            case (state)
                IDLE: ready <= 1'b1; state <= READ;
                READ: data_out <= memory[addr]; state <= PROCESS;
                PROCESS: memory[addr] <= processed_data; state <= WRITE;
                WRITE: ready <= 1'b0; state <= IDLE;
            endcase
            counter <= counter + 1;
        end
    end
endmodule