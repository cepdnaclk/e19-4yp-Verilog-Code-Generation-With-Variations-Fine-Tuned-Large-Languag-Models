module tst_CMOSsw1();
  reg in,con;
  wire [1:0] out;
  reg [1:0] out_exp;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  initial begin
    #20
    in = 1'b0;
    con = 1'b1;
    #10
    out_exp = 2'b01;
    if (out[0]!= out_exp[0]) begin
      $display("ERROR!!!!!: out[0] = %b, out_exp[0] = %b", out[0], out_exp[0]);
    end
    if (out[1]!= out_exp[1]) begin
      $display("ERROR!!!!!: out[1] = %b, out_exp[1] = %b", out[1], out_exp[1]);
    end
    #10
    in = 1'b1;
    con = 1'b1;
    #10
    out_exp = 2'b10;
    if (out[0]!= out_exp[0]) begin
      $display("ERROR!!!!!: out[0] = %b, out_exp[0] = %b", out[0], out_exp[0]);
    end
    if (out[1]!= out_exp[1]) begin
      $display("ERROR!!!!!: out[1] = %b, out_exp[1] = %b", out[1], out_exp[1]);
    end
    #10
    in = 1'b0;
    con = 1'b1;
    #10
    out_exp = 2'b00;
    if (out[0]!= out_exp[0]) begin
      $display("ERROR!!!!!: out[0] = %b, out_