
module and_gate_for_integer
(
  input [7:0] A,
  output Y
);

  reg [31:0] values [3:0];
  reg Y;

  always @(A) begin
    values[0] = 100;
    values[1] = 101;
    values[2] = 102;
    values[3] = 103;
    Y <= 0;
    for(i=0; i<4; i=i+1) begin
      if(A == values[i]) begin
        Y <= 1;
      end 
    end
  end


endmodule
