module complex_queue_controller (
  input        clk,
  input        rst,
  input        enq,
  input        deq,
  input  [7:0] data_in,
  output [7:0] data_out,
  output       full,
  output       empty
);
  reg [7:0] queue [0:7];
  reg [2:0] head, tail;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      head <= 3'b000;
      tail <= 3'b000;
    end else begin
      if (enq && !full) begin
        queue[tail] <= data_in;
        tail <= tail + 1;
      end
      if (deq && !empty) begin
        head <= head + 1;
      end
    end
  end
  assign data_out = queue[head];
  assign full = (tail == head + 8);
  assign empty = (tail == head);
  // Test case for inside operator in module scope
  reg [7:0] test_value;
  reg module_scope_result;
  
  // Example use of inside operator within module scope
  always @(*) begin
    module_scope_result = (test_value inside {8'd0, 8'd5, 8'd10});
  end

endmodule