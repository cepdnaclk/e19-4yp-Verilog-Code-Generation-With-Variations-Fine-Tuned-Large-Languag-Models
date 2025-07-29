module tst_nm_in();
  reg in; wire out;
  reg [4:0] a;
  NMOSinv nmv[5][4][3][2][1](out,in);
  reg [0:4]  led;
  initial
    in =1'b1, a = 5'b00000; // Start with first element in array
  always @(*)
    case(in)
      1'b0: a = 5'b00000;
      1'b1: a = 5'b11111;
    endcase
  always @(*)
    begin
      led0 = out[0];
      led1 = out[1];
      led2 = out[2];
      led3 = out[3];
      led4 = out[4];
    end
  initial $monitor