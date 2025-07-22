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
  // Debug test case: trace driver and load
  logic [7:0] driver_test_value;
  logic [7:0] load_array [0:7];
  logic driver_result;
  logic load_result;
  
  // Driver signals that can be traced
  logic [7:0] driver_signal_1, driver_signal_2;
  logic [7:0] load_signal_1, load_signal_2;
  
  initial begin
    // Initialize arrays
    for (int i = 0; i < 8; i++) begin
      load_array[i] = i * 5;
    end
    driver_test_value = 8'd15;  // Should match load_array[3]
  end
  
  // Driver logic - these signals drive other signals
  assign driver_signal_1 = driver_test_value;
  assign driver_signal_2 = driver_test_value + 8'd10;
  
  // Load logic - these signals are loaded by drivers
  assign load_signal_1 = driver_signal_1;
  assign load_signal_2 = driver_signal_2;
  
  // Inside operators that involve driver/load relationships
  always @(*) begin
    // Driver result - trace how this drives other logic
    driver_result = (driver_signal_1 inside {load_array});
    
    // Load result - trace what loads this
    load_result = (load_signal_2 inside {8'd20, 8'd25, 8'd30, 8'd35});
  end
  
  // Additional hierarchical signals for driver/load tracing
  wire [7:0] hierarchical_driver = driver_signal_1;
  wire hierarchical_load_result = (hierarchical_driver inside {load_array});


endmodule