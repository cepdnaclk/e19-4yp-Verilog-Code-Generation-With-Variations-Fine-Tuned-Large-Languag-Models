```verilog
module tst_nm_in();
  reg [3:0] in; wire [3:0] out;
  // Instantiate NMOS inverters
  NMOSinv nmv0(out[0],in[0]);
  NMOSinv nmv1(out[1],in[1]);
  NMOSinv nmv2(out[2],in[2]);
  NMOSinv nmv3(out[3],in[3]);

  function integer get_index; // Function to return a 4D index value
    input a; b; c; d;
    get_index = a*16 + b*4 + c*2 + d; // 4D coordinates to 1D index
  endfunction

  initial
    in =4'b1111; // Start with input high -> output low
  always @(*) begin // System Verilog style
    case (get_index(in[3],in[2],in[1],in[0]))
      0: out = 4'b0000;
      1: out = 4'b0001;
      2: out = 4'b0010;
      3: out = 4'b0011;
      4: out = 4'b0100;
      5: out = 4'b0101;
      6: out = 4'b0110;
      7: out = 4'b0111;
      8: out = 4'b1000;
      9: out = 4'b1001;
      10: out = 4'b1010;
      11: out = 4'b1011;
      12: out = 4'b1100;
      13: out = 4'b1101;
      14: out = 4'b1110;
      15: out = 4'b1111;
    endcase
  end
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop