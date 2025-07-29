module logic_array (input [3:0] a, b, c, d,
                    output [7:0] e, f, g, h);
wire [3:0] in;
wire [7:0] out;
assign in = a ^ (b | c);
wire [7:0] mux_inputs[0:3];
wire [7:0] mux_outputs[0:3];
generate
  for (genvar i = 0; i < 4; i++)