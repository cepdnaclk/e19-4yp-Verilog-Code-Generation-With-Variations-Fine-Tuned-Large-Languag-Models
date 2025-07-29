module dff (q,d,clk,rst);
  output q;
  input d,clk,rst;
  reg q;
  always @(posedge clk) begin
    if (rst)
      q <= 0;
    else
      q <=d;
  end
endmodule
module tst_dff();
  reg d,clk,rst;
  wire q;
  dff df(q,d,clk,rst);
  initial d=0,clk=0,rst=1;
  initial begin
    #5 rst=0;
  end
  always #5 d=~d;
  always #2 clk=~clk;
  initial $monitor($time, "d = %b, q = %b ",d,q);
  initial #10 $finish;
endmodule
module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
  initial $display("\nTest if the function call's result is set into an array.");
  initial begin
    repeat (3) begin
      $display("in = %b, con = %b\n",in,con);
      $display("out = %b\n",out);
      $display("\n");
      in=~in;
      #5
      con=~con;
    end
    $finish;
  end
endmodule