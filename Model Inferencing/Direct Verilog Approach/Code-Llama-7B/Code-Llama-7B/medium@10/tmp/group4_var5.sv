module jkFlipFlop(clock, reset, in, out);
  output out;
  input clock, reset, in;

  // Add variables
  wire clock_invert, reset_invert;
  wire [1:0] nor_out;
  wire[1:0] nor_out_invert;
  wire [1:0] nor_out_out;

  // invert inputs for JK flip-flop
  not (clock_invert, clock);
  not (reset_invert, reset);

  // 2-input NAND
  nand2 (clock_nand, clock_invert, clock_invert);
  nand2 (reset_nand, reset, reset_invert);

  nor3NMOS(nor_out[0], nor_out[1], clock_nand, nor_out_out[0]);
  nor3NMOS( nor_out[1], reset_nand, clock_nand, nor_out_out[1]);

  nor3NMOS( nor_out_invert[0], nor_out_out[0], nor_out_out[1], nor_out_invert[1]);
  nor3NMOS( nor_out_invert[1], reset_nand, nor_out_out[1], nor_out_invert[0]);

  // use nor_out to determine output
  // case/endcase block using inside with function
  case(inside_with(nor_out_invert))
    2'b00: