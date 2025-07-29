module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d;
  reg [3:0] a_reg,b_reg;
  wire [3:0]d_int,d_in;
  alu_1 aa(d_int,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
    a_reg=a; b_reg=b;
    #10 d_int=a_reg+b_reg;
    #10 d_int=a_reg-b_reg;
    #10 d_int=a_reg*b_reg;
    #10 d_int=a_reg/b_reg;
    #10 d_in=a_reg&b_reg;
    #10 d_in=a_reg|b_reg;
    #10 d_in=a_reg^b_reg;
  end
  always @(a_reg or b_reg) begin
    a_reg=a; b_reg=b;
    #10 d_int=a_reg+b_reg;