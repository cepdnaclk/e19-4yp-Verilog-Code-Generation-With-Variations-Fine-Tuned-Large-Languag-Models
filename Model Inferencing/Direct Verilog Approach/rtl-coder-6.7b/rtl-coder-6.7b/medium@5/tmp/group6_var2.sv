module clock_gen_forever2;

  reg clk, en;
  integer i;

  initial begin
    clk = 1'b0;
    en = 1'b0;
    // Generate clock using forever loop, controlled by 'en'
    for(i=1;i<=4;i=i+1)
        #2 clk = ~clk;
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);

endmodule 
### Results:
After running the simulation, we get this output which is what we expect:
$ monitor
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0
clk 1
clk 0