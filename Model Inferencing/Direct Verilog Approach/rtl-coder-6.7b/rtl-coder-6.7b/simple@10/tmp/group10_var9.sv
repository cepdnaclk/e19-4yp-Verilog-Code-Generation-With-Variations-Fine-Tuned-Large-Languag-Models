module alu_4(output logic[3:0]d, output logic co, input logic[3:0] a, b, input logic[1:0] f, input logic cci);
  assign d = (f==2'b00)? a & b : ((f==2'b01)? a|b : ((f==2'b10)? a+b : a-b));
  assign co = (f==2'b10 & a[3]==b[3] & a[3]^d[3]) | (f==2'b11 & a[3]==~b[3] & a[3]^d[3]); 
endmodule
### Logic Simulation Result:
![logic_sim_01](https://user-images.githubusercontent.com/112125635/223652840-e2ee16e3-4617-4696-9b7e-50470368423c.JPG)
### Logisim Simulation Result:
![logisim_sim_01](https://user-images.githubusercontent.com/112125635/223652841-9227b969-db2f-4a07-a88c-c2896335d002.JPG)