module testmodule (
    input wire clk,
    input wire rst_n,
    input wire [31:0] data_in,
    output reg [31:0] data_out,
    output wire valid_out
);
    // Parameter declarations
    parameter real SCALE_FACTOR = 1.5;
    parameter real THRESHOLD = 2.0;
    
    // Internal signals
    reg [31:0] counter;
    reg valid;
    real accumulator;
    real temp_value;
    
    // Assign outputs
    assign valid_out = valid;
    
    // Main process
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset state
            counter <= 32'h0;
            data_out <= 32'h0;
            valid <= 1'b0;
            accumulator <= 0.0;
            temp_value <= 0.0;
        end else begin
            // Increment counter
            counter <= counter + 1;
            
            // State machine
            if (counter == 0) begin
                // Initialize
                valid <= 1'b0;
                accumulator <= SCALE_FACTOR;
                temp_value <= real'(data_in) * SCALE_FACTOR;
            end else if (counter == 1) begin
                // Process data
                if (temp_value > THRESHOLD) begin
                    accumulator <= accumulator + temp_value;
                end
                valid <= 1'b1;
            end else if (counter == 2) begin
                // Output results
                data_out <= 32'(accumulator);
                counter <= 0;
            end
        end
    end
    
    // Internal computation function
    function real compute_scale(input real value);
        begin
            compute_scale = value * SCALE_FACTOR;
        end
    endfunction
    
endmodule