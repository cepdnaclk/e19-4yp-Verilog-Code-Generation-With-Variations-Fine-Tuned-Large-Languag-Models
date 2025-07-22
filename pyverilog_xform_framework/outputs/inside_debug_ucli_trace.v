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
  // Debug test case: UCLI command - trace driver/load
  logic [7:0] ucli_test_value;
  logic [7:0] trace_array [0:7];
  logic ucli_result;
  
  // Signals for UCLI tracing
  logic [7:0] trace_driver_sig;
  logic [7:0] trace_load_sig_1, trace_load_sig_2;
  
  initial begin
    // Initialize for UCLI tracing
    for (int i = 0; i < 8; i++) begin
      trace_array[i] = i * 6;
    end
    ucli_test_value = 8'd18;  // Should match trace_array[3]
  end
  
  // Driver that can be traced with UCLI
  assign trace_driver_sig = ucli_test_value;
  
  // Loads that can be traced with UCLI
  assign trace_load_sig_1 = trace_driver_sig;
  assign trace_load_sig_2 = trace_driver_sig + 8'd5;
  
  // Inside operator for UCLI tracing
  always @(*) begin
    ucli_result = (trace_driver_sig inside {trace_array});
  end
  
  // Additional logic for comprehensive tracing
  logic ucli_intermediate_result;
  always @(*) begin
    ucli_intermediate_result = (trace_load_sig_1 inside {trace_array}) || 
                              (trace_load_sig_2 inside {8'd20, 8'd23, 8'd25});
  end
  
  // UCLI trace commands that could be used:
  // trace -driver trace_driver_sig
  // trace -load trace_load_sig_1
  // trace -driver ucli_result


endmodule