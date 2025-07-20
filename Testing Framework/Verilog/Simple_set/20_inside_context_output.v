module simple_array_example(
  input clk,
  input rst,
  input [7:0] data_in,
  output [7:0] data_out
);

  // Simple 8-bit register array with 16 elements
  reg [7:0] mem_array [0:15];
  reg [3:0] addr_ptr;

  // Sample counter
  reg [7:0] counter;

  // Read operation
  assign data_out = mem_array[addr_ptr];

  // Simple process
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      addr_ptr <= 4'h0;
      counter <= 8'h0;
    end else begin
      mem_array[addr_ptr] <= data_in;
      addr_ptr <= addr_ptr + 1;
      counter <= counter + 1;
    end
  end
  // Test case for inside operator in if statement
  reg [7:0] test_value;
  reg if_result;
  
  // Example if statement using inside operator
  always @(*) begin
    if (test_value inside {8'd0, 8'd10, 8'd20, 8'd30, 8'd40}) begin
      if_result = 1'b1;
    end else begin
      if_result = 1'b0;
    end
  end
  
  // Nested if with inside operator
  always @(*) begin
    if (mem_array[0] inside {8'd0, 8'd1}) begin
      if (mem_array[1] inside {8'd2, 8'd3}) begin
        // Nested inside operations
      end
    end
  end


endmodule