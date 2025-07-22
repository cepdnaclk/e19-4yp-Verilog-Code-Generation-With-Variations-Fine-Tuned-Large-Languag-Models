module Problem2(output [3:0] data);
  wire [3:0] data_in;
  wire [3:0] data_out;
  wire [3:0] data_out_en;
  wire [3:0] data_out_sel;
  wire [3:0] data_out_mux0;
  wire [3:0] data_out_mux1;

  logic [31:0] data_counter;
  logic [3:0] data_out_sel_counter;

  // data_counter latch
  always @(posedge data_in)
    if (data_out_sel == 3'h0)
      data_counter <= data_in;
    else if (data_out_sel == 3'h1)
      data_counter <= data_counter >> 3'b1;
endmodule
### Run Instructions:
1. Compile and run the code using:

<code>
iverilog -o problem2 problem2.v
gtkwave -a problem2.vcd problem2.gtkw
</code>

2. Add a logic variable (named clk) to test the di variable by connecting it to the clk signal.

<code>
module Problem2(output [3:0] data);
  wire [3:0] data_in;
  wire [3:0] data_out;
  wire [3:0] data_out_en;
  wire [3:0] data_out_sel;
  wire [3:0] data_out_mux0;
  wire [3:0] data_out_mux1;

  logic [31:0] data_counter;
  logic [3:0] data_out_sel_counter;

  // data_counter latch
  always @(posedge data_in)
    if (data_out_sel == 3'h0)
      data_counter <= data_in;
    else if (data_out_sel == 3'h1)
      data_counter <= data_counter >> 3'b1;


endmodule
</code>

3. Create a testbench and test the correctness of the system.

<code>
`timescale 1ns / 1ps

module Problem2TB();
  Problem2 p2;

  initial begin
    p2.data_in = 4'b0000;
    p2.data_out_sel = 3'b000;
    p2.clk = 1'b0;
  end

  initial begin
    p2.clk = 1'b1;
    p2.data_in = 4'b1111;
    p2.clk = 1'b0;
  end

  initial begin
    p2.clk = 1'b1;
    p2.data_in = 4'b0000;
    p2.data_out_sel = 3'b001;
    p2.clk = 1'b0;
  end

  initial begin
    p2.clk = 1'b1;
    p2.data_in = 4'b0000;
    p2.data_out_sel = 3'b010;
    p2.clk = 1'b0;
  end

  initial begin
    p2.clk = 1'b1;
    p2.data_in = 4'b0000;
    p2.data_out_sel = 3'b011;
    p2.clk = 1'b0;
  end

  initial begin
    p2.clk = 1'b1;
    p2.data_in = 4'b0000;
    p2.data_out_sel = 3'b100;
    p2.clk = 1'b0;
  end

  initial begin
    p2.clk = 1'b1;
    p2.data_in = 4'b0000;
    p2.data_out_sel = 3'b101;
    p2.clk = 1'b0;
  end

  initial begin
    p2.clk = 1'b1;
    p2.data_in = 4'b0000;
    p2.data_out_sel = 3'b