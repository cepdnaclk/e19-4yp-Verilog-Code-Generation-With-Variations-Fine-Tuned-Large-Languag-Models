module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; //wire co;
  alu_1 aa(d,/*co,*/a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin
      case(f)
	2'b01: a=0; b=a+1;
	2'b10: a=0; b=a*2;
	2'b11: a=0; b=