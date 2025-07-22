module medium_data_buffer (
  input        clk,
  input        rst,
  input        write_en,
  input  [7:0] data_in,
  output [7:0] data_out
);
  reg [7:0] buffer [0:3];
  reg [1:0] ptr;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      ptr <= 2'b00;
    end else if (write_en) begin
      buffer[ptr] <= data_in;
      ptr <= ptr + 1;
    end
  end
  assign data_out = buffer[ptr];
endmodule