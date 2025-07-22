
module inside_var2
(
  input [7:0] A,
  output X
);

  reg [7:0] values [3:0];
  reg X;
  reg [31:0] i;
  reg found;

  initial begin
    values[0] = 100;
    values[1] = 110;
    values[2] = 120;
    values[3] = 130;
  end


  always @(posedge *) begin
    X = 0;
    found = 0;
    for(i=0; (i<4)&&(found==0); i=(i+1)) begin
      if(A == values[i]) begin
        X = 1;
        found = 1;
      end 
    end
  end


endmodule
