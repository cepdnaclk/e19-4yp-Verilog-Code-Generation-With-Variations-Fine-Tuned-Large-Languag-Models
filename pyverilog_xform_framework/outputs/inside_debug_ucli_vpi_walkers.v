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
  // Debug test case: Run tests with UCLI/VPI walkers
  logic [7:0] walker_test_value;
  logic [7:0] walker_array [0:15];
  logic walker_result;
  
  // VPI accessible signals
  logic [7:0] vpi_signal_1, vpi_signal_2, vpi_signal_3;
  logic [3:0] vpi_counter;
  
  initial begin
    // Initialize for VPI walker testing
    for (int i = 0; i < 16; i++) begin
      walker_array[i] = $random % 100;  // Random values for walker testing
    end
    walker_test_value = 8'd42;
    vpi_counter = 4'h0;
  end
  
  // VPI accessible logic
  assign vpi_signal_1 = walker_test_value;
  assign vpi_signal_2 = walker_test_value << 1;
  assign vpi_signal_3 = walker_test_value >> 1;
  
  // Inside operator that VPI walkers can analyze
  always @(*) begin
    walker_result = (vpi_signal_1 inside {walker_array});
  end
  
  // Test logic that VPI walkers can traverse
  always @(posedge clk) begin
    if (rst) begin
      vpi_counter <= 4'h0;
    end else begin
      vpi_counter <= vpi_counter + 1;
      
      // Dynamic inside operation that walkers can observe
      if (vpi_counter inside {4'h5, 4'h7, 4'h9, 4'hB}) begin
        walker_test_value <= walker_test_value + 8'd1;
      end
    end
  end
  
  // Hierarchical structure for VPI walker navigation
  walker_sub_module walker_sub();
  
  // VPI walker accessible properties
  property vpi_inside_property;
    @(posedge clk) (walker_result == 1'b1) |-> (vpi_signal_1 inside {walker_array});
  endproperty
  
  vpi_inside_assert: assert property(vpi_inside_property);
endmodule

// Sub-module for VPI walker hierarchy testing
module walker_sub_module;
  logic [7:0] sub_walker_signal;
  logic [7:0] sub_walker_array [0:7];
  logic sub_walker_result;
  
  initial begin
    for (int i = 0; i < 8; i++) begin
      sub_walker_array[i] = i * 9;
    end
    sub_walker_signal = 8'd27;  // Should match sub_walker_array[3]
  end
  
  always @(*) begin
    sub_walker_result = (sub_walker_signal inside {sub_walker_array});
  end
