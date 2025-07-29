module clock_gen_forever2; 
  reg clk, en;
  // Generate clock using forever loop, controlled by 'en'
  integer i;
  always @(posedge en) // Start clock generation on posedge en
    forever #2 clk = ~clk; // Toggle clock every 2 time units forever
  initial
  begin
    $display("Starting clock_gen_forever2");
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time, en);
endmodule
### Modified Test:
module clock_gen_forever2_tb;
  reg clk_en, clk;
  // Clock and reset
  always
  begin
    #10;
    clk_en = 1'b0; // Start disabled
    #100;
    clk_en = 1'b1; // Start enabled
    #10;
    clk_en = 1'b0; // Stop enabled
    #100;
  end
  clock_gen_forever2 clock_obj (.clk(clk),.en(clk_en));
  // Test code and module
  initial
  begin
    $monitor("clk=%b, t=%0d, en=%b ",clk,$time, clk_en);
    #200;
    $finish;
  end
endmodule
### Expected Output:
```
  clk=0, t=0, en=0
  clk=0, t=20, en=0
  clk=1, t=40, en=0
  clk=1, t=60, en=0
  clk=1, t=80, en=0
  clk=0, t=100, en=0
  clk=0, t=120, en=0
  clk=0, t=140, en=0
  clk=1, t=160, en=0
  clk=1, t=180, en=0
  clk=0, t=200, en=0
  clk=0, t=220, en=0
  clk=0, t=240, en=0
  clk=1, t=260, en=0
  clk=1, t=280, en=0
  clk=0, t=300, en=0
  clk=0, t=320, en=0
  clk=1, t=340, en=0
  clk=1, t=360, en=0
  clk=1, t=380, en=0
  clk=0, t=400, en=0
  clk=0, t=420, en=0
  clk=0, t=440, en=0
  clk=0, t=460, en=0
  clk=1, t=480, en=0
  clk=1, t=500, en=0
  clk=1, t=520, en=0
  clk=1, t=540, en=0
  clk=0, t=560, en=0
  clk=0, t=580, en=0
  clk=0, t=600, en=0
  clk=1, t=620, en=0
  clk=1, t=640, en=0
  clk=1, t=660, en=0
  clk=1, t=680, en=0
  clk=0, t=700, en=0
  clk=0, t=720, en=0
  clk=0, t=740, en=0
  clk=0, t=760, en=0
  clk=1, t=780, en=0
  clk=1, t=800, en=0
  clk