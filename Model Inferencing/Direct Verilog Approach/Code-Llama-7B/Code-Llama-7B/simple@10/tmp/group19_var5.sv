module tb_dff_inst;
  logic [1:0] din;
  logic clock, resetn;
  logic [1:0] q;
  dff_inst u0(din, clock, resetn, q);
  dff_inst u1(din, clock, resetn, q);

  initial begin
    din = 2'b00;
    resetn = 1'b0;
    #10;
    resetn = 1'b1;
    #10;
    din = 2'b01;
    #10;
    din = 2'b11;
    #5;
    din = 2'b01;
    #20;
    $finish;
  end

  initial begin
    clock = 1;
    forever #10ns clock = ~clock;
  end
  initial begin
    $fsdbDumpfile("dff_inst.fsdb");
    $fsdbDump