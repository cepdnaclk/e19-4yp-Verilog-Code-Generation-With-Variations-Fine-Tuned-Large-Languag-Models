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
    if (queue[0] inside {8'd0, 8'd1}) begin
      if (queue[1] inside {8'd2, 8'd3}) begin
        // Nested inside operations
      end
    end
  end

endmodule