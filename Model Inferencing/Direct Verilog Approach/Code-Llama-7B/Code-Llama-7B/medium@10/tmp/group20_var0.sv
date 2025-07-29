module ExtraCount (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count = Count + 1;
end
final begin
    Count[2:0] = {1'b0, Count[2:0]} << 2;
end
endmodule
##### Original Verilog Benchmark:
```verilog
module counter_top (
    input         clk,
    input         rst,
    output [47:0] total_count
);
  counter #(
   .INITIAL_VALUE(5'h00),
   .WIDTH(8)
  ) counter_0 (
   .clk(clk),
   .rst(rst),
   .count(total_count[7:0])
  );

  counter #(
   .INITIAL_VALUE(5'h00),
   .WIDTH(8)
  ) counter_1 (
   .clk(clk),
   .rst(rst),
   .count(total_count[15:8])
  );

  counter #(
   .INITIAL_VALUE(5'h00),
   .WIDTH(8)
  ) counter_2 (
   .clk(clk),
   .rst(rst),
   .count(total_count[23:16])
  );

  counter #(
   .INITIAL_VALUE(5'h00),
   .WIDTH(8)
  ) counter_3 (
   .clk(clk),
   .rst(rst),
   .count(total_count[31:24])
  );

  counter #(
   .INITIAL_VALUE(5'h00),
   .WIDTH(8)
  ) counter_4 (
   .clk(clk),
   .rst(rst),
   .count(total_count[39:32])
  );

  counter #(
   .INITIAL_VALUE(5'h00),
   .WIDTH(8)
  ) counter_5 (
   .clk(clk),
   .rst(rst),
   .count(total_count[47:40])
  );

endmodule

module counter (
    input         clk,
    input         rst,
    output [3:0]  count
);
  always @(posedge clk) begin
    if (rst) begin
      count <= 4'h0;
    end else begin
      count <= count + 1;
    end
  end
endmodule
```
##### Synthesis Results:
```shell
===============================================================================
|                      Synthesis Results                                      |
===============================================================================
|  Number of Slices (2-bit and larger)                                         |
|   __________________________________________________________________________|
|   |      32      |                                                          |
|   __________________________________________________________________________|
|   |      32      |  _______________________________________________________|
|   |               | |       26      |                                      |
|   |                ----                                                    |
|   |                26      |                ______________________________|
|   |                         | |       18      |                           |
|   |                          -----                                        |
|   |                          18      |          ________________________|
|   |                                   | |        10      |              |
|   |                                    ----                             |
|   |                                    10      |           ____________|
|   |                                                        |      8      |
|   |                                                         ----       |
|   |                                                         8      |    |
|   |                                                                     |
|   |_____________________________________________________________________|
|                                                                          |
|  Number of slices                                                          |
|   __________________________________________________________________________|
|   |      32      |                                                          |
|   __________________________________________________________________________|
|   |      32      |  _______________________________________________________|
|   |               | |       26      |                                      |