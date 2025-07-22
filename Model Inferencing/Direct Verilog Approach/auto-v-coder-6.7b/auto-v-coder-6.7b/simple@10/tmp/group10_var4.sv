```verilog
module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin
    cci = 1'b0; f = 2'b00; a = 4'h0; b = 4'h0; // Initialize
    #30 $stop; // Stop after a certain time to avoid continuous running
  end
  always begin
    #3 a=a+1; b=b+1; f=f+1;