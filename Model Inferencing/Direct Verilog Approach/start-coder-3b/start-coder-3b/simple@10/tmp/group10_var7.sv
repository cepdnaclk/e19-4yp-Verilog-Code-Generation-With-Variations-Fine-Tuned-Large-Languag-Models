module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; logic cci; wire[3:0]d; logic co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin c