module clock_gen_forever_func; // Renamed module for clarity
  reg clk, en;
  // Generate clock using forever loop, controlled by 'en'
  always @(posedge en) begin
    int i = 0;
    for (i=0; i<10; i=i+1) begin
      clk = 1'b0; // Toggle clock every 2 time units
      #2 clk = ~clk;
    end
  end
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
### Expected Result:
clk=0, t=   0, en=0 
clk=0, t=   2, en=0 
clk=1, t=   4, en=0 
clk=0, t=   6, en=0 
clk=0, t=   8, en=0 
clk=0, t=  10, en=0 
clk=1, t=  12, en=0 
clk=0, t=  14, en=0 
clk=0, t=  16, en=0 
clk=1, t=  18, en=0 
clk=0, t=  20, en=0 
clk=0, t=  22, en=0 
clk=1, t=  24, en=0 
clk=0, t=  26, en=0 
clk=0, t=  28, en=0 
clk=1, t=  30, en=0 
clk=0, t=  32, en=0 
clk=0, t=  34, en=0 
clk=1, t=  36, en=0 
clk=0, t=  38, en=0 
clk=0, t=  4