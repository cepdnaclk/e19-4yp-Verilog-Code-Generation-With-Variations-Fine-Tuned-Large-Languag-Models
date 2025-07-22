module contres(o,i1,i2);
input i1,i2;
output o;
reg [3:0] arr [9:1];

initial
begin
  $display("The value of arr[1:4][1:4] is %b", arr[4][4]);
  #10;
  $display("The value of arr[1:4][1:4] is %b", arr[4][4]);
end

// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
endmodule
### Testbench Code:
module contres_tb;
reg [9:1] i1,i2;
wire o;

contres cntr(o,i1,i2);

initial
begin
  i1 = 2'b00; i2 = 2'b00;
  #10;
  i1 = 2'b01; i2 = 2'b01;
  #10;
  i1 = 2'b10; i2 = 2'b10;
  #10;
  i1 = 2'b11; i2 = 2'b11;
  #10;
  i1 = 2'b00; i2 = 2'b01;
  #10;
  i1 = 2'b01; i2 = 2'b00;
  #10;
  i1 = 2'b10; i2 = 2'b11;
  #10;
  i1 = 2'b11; i2 = 2'b10;
  #