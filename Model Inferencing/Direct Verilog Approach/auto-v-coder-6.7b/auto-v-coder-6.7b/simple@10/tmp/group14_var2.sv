```verilog
module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci);
  initial begin 
    cci=1'b0; f=2'b00; a=4'h0; b=4'h0;
    #30 $stop; 
    // Test Case 1
    a=4'h9; b=4'h3; f=2'b00; cci=1'b0; #10;
    a=4'hA; b=4'hB; f=2'b01; cci=1'b1; #10;
    a=4'hF; b=4'h5; f=2'b10; cci=1'b1; #10;
    a=4'h1; b=4'h2; f=2'b11; cci=1'b0; #10;
    // Test Case 2
    a=4'hE; b=4'hF; f=2'b00; cci=1'b0; #10;
    a=4'h1; b=4'h2; f=2'b01; cci=1'b1; #10;
    a=4'h5; b=4'hC; f=2'b10; cci=1'b1; #10;
    a=4'h7; b=4'h8; f=2'b11; cci=1'b0; #10;
    // Test Case 3
    a=4'h6; b=4'h2; f=2'b00; cci=1'b0; #10;
    a=4'hF; b=4'h1; f=2'b01; cci=1'b1; #10;
    a=4'h4; b=4'h3