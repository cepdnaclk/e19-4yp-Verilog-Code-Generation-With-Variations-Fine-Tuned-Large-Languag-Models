module alu_1(d,co,a,b,f,cci); input[3:0]a,b; input[1:0] f; input cci; output[3:0]d; output co;
  always @ (a or b or f or cci) begin
  case (f)
    2'b00: begin d=a and b; co=1'b0; end
    2'b01: begin d=a or b; co=1'b0; end
    2'b10: begin d=a xor b; co=1'b0; end
    2'b11: begin d=a+b; co=1'b0; end
  endcase
  end
endmodule
### Test Bench Code:
module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
    #10 f=2'b00; a=4'h3; b=4'h5;
    #10 f=2'b00; a=4'h8; b=4'h4;
    #10 f=2'b00; a=4'h5; b=4'hA;
    #10 f=2'b01; a=4'h3; b=4'h5;
    #10 f=2'b01; a=4'h8; b=4'h4;
    #10 f=2'b01; a=4'h5; b=4'hA;
    #10 f=2'b10; a=4'h3; b=4'h5;
    #10 f=2'b10; a=