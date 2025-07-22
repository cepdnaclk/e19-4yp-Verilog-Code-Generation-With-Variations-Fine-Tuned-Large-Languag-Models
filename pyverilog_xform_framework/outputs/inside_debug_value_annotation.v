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
  // Debug test case: check for value annotation in source window
  logic [7:0] debug_test_value;
  logic [7:0] annotation_array [0:15];
  logic annotation_result;
  logic [7:0] traced_signal;
  
  initial begin
    // Initialize array for debugging
    for (int i = 0; i < 16; i++) begin
      annotation_array[i] = i * 8;
    end
    debug_test_value = 8'h40;  // 64 in decimal, should match annotation_array[8]
  end
  
  // This signal will be traced and annotated in Verdi
  assign traced_signal = debug_test_value;
  
  // Inside operator that can be observed in value annotation
  always @(*) begin
    // This result should be visible in Verdi's source window with value annotation
    annotation_result = (debug_test_value inside {annotation_array});
  end
  
  // Additional debug signals for observation
  logic step_by_step_result;
  always @(*) begin
    // Break down the inside operation for easier debugging
    step_by_step_result = 1'b0;
    for (int i = 0; i < 16; i++) begin
      if (debug_test_value == annotation_array[i]) begin
        step_by_step_result = 1'b1;
      end
    end
  end


endmodule