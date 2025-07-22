module tst_alu1();
   reg [3:0] a,b; reg[1:0] f; reg cci; wire[3:0] d; wire co;
   alu_1 aa(d,co,a,b,f,cci);
   initial begin
      cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop;
   end
   always begin
   #25 a=4'h1; b=4'h2; f=2'b00; cci=1'b0;
   #25 a=4'h1; b=4'h2; f=2'b01; cci=1'b0;
   #25 a=4'h1; b=4'h2; f=2'b10; cci=1'b0;
   #25 a=4'h1; b=4'h2; f=2'b11; cci=1'b0;
   #25 a=4'h1; b=4'h2; f=2'b00; cci=1'b1;
   #25 a=4'h1; b=4'h2; f=2'b01; cci=1'b1;
   #25 a=4'h1; b=4'h2; f=2'b10; cci=1'b1;
   #25 a='h1; b='h2; f=2'b11; cci=1'b1;
   #25 a=4'h5; b=4'h3; f=2'b00; cci=1'b0;
   #25 a=4'h5; b=4'h3; f=2'b01; cci=1'b0;
   #25 a=4'h5; b=4'h3; f=2'b10; cci=1'b0;
   #25 a=4'h5; b=4'