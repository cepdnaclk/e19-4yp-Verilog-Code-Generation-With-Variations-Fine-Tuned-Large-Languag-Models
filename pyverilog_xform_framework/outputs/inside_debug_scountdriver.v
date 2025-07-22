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
  // Debug test case: scountdriver - count signal drivers
  logic [7:0] count_test_value;
  logic [7:0] multi_driver_signal;
  logic [7:0] single_driver_signal;
  logic [7:0] driver_array [0:7];
  logic count_result_multi, count_result_single;
  
  // Multiple drivers for multi_driver_signal (potential conflict)
  logic driver_enable_1, driver_enable_2, driver_enable_3;
  
  initial begin
    // Initialize
    for (int i = 0; i < 8; i++) begin
      driver_array[i] = i * 3;
    end
    count_test_value = 8'd12;  // Should match driver_array[4]
    
    // Enable different drivers at different times
    driver_enable_1 = 1'b1;
    driver_enable_2 = 1'b0;
    driver_enable_3 = 1'b0;
    
    #10 driver_enable_1 = 1'b0; driver_enable_2 = 1'b1;
    #10 driver_enable_2 = 1'b0; driver_enable_3 = 1'b1;
  end
  
  // Multiple drivers (for scountdriver analysis)
  assign multi_driver_signal = driver_enable_1 ? count_test_value : 8'hZZ;
  assign multi_driver_signal = driver_enable_2 ? (count_test_value + 8'd5) : 8'hZZ;
  assign multi_driver_signal = driver_enable_3 ? (count_test_value - 8'd2) : 8'hZZ;
  
  // Single driver
  assign single_driver_signal = count_test_value;
  
  // Inside operators with different driver counts
  always @(*) begin
    // Test with multi-driver signal
    count_result_multi = (multi_driver_signal inside {driver_array});
    
    // Test with single-driver signal
    count_result_single = (single_driver_signal inside {driver_array});
  end


endmodule