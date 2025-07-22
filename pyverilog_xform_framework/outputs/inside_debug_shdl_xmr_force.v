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
  // Debug test case: SHDL XMR force
  logic [7:0] force_test_value;
  logic [7:0] force_array [0:7];
  logic force_result;
  logic forced_signal;
  
  // Sub-module for XMR force testing
  force_sub_module force_sub_inst();
  
  initial begin
    // Initialize array
    for (int i = 0; i < 8; i++) begin
      force_array[i] = i * 7;
    end
    force_test_value = 8'd21;  // Should match force_array[3]
  end
  
  // Signal that can be forced via XMR
  assign forced_signal = force_test_value;
  
  // Inside operator with signal that might be forced
  always @(*) begin
    force_result = (forced_signal inside {force_array});
  end
  
  // XMR access to sub-module signal
  logic xmr_force_result;
  always @(*) begin
    xmr_force_result = (force_sub_inst.sub_signal inside {force_array});
  end
  
  // Force scenario simulation
  initial begin
    #20;
    // Simulate force command: force forced_signal = 8'd14;
    // This would be done externally via SHDL XMR force
    $display("Time %t: forced_signal = %h, force_result = %b", 
             $time, forced_signal, force_result);
    
    #20;
    // Simulate release: release forced_signal;
    $display("Time %t: After release - forced_signal = %h, force_result = %b", 
             $time, forced_signal, force_result);
  end
endmodule

// Sub-module for force testing
module force_sub_module;
  logic [7:0] sub_signal;
  logic [7:0] sub_array [0:3];
  
  initial begin
    sub_signal = 8'h2A;
    sub_array = '{8'h10, 8'h20, 8'h2A, 8'h30};
  end
