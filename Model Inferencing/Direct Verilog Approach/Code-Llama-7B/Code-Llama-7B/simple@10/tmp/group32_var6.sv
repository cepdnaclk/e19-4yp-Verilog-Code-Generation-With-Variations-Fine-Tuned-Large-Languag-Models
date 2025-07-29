module t_Clock_Prog (reset_n);
wire clk;

initial #100 $finish;
Clock_Prog M1 (reset_n, clk);
endmodule
Clock_Prog M1 (reset_n, clk);
endmodule

module Clock_Prog(reset_n, clk);

parameter Reset_Type = 1'b1;

parameter Reset_Type_not_default = 3'b001;


  reg [7:0] test_score = 0;

  reg reset_n;
  wire clock;

  initial begin
    $display("test score: %d", test_score);
    $finish;
  end

  always @* begin
    clock = (reset_n == Reset_Type)? 0 : 1;
  end

  always @(posedge clock) begin
    test_score = test_score + 1;
  end

endmodule

module t_Clock_Prog (reset_n);
wire clk;

initial #100 $finish;
Clock_Prog M1 (reset_n, clk);
endmodule
Clock_Prog M1 (reset_n, clk);
endmodule

module Clock_Prog(reset_n, clk);

  parameter Reset_Type = 1'b1;

  parameter Reset_Type_not_default = 3'b001;


  reg [7:0] test_score = 0;

  reg reset_n;
  wire clock