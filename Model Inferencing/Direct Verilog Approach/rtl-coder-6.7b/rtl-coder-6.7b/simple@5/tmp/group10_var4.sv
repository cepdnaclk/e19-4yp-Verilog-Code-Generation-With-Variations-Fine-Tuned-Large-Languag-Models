module alu_4 (d, co, a, b, f, cci);
  input logic [3:0] a, b; input logic[1:0] f; input logic cci;
  output logic[3:0] d; output logic co;
  logic[3:0] aa, bb, dd;
  logic c1, c2, c3, c4;
  assign aa=cci? ~a : a; assign bb=~b;
  assign {c3, dd}=aa+bb+c1;
  assign {c2, d}=cci? {c3, dd} : aa-bb;
  assign c1=(aa[3]!= bb[3]) & c2;
  assign c4=(a[3] &!b[3]) | (a[3] & bb[3]) | (aa[3] & c2);
  assign {c1, co}={c4, c1};
endmodule
### Simulation Output:
![image](https://user-images.githubusercontent.com/98285449/191234066-5ceb36ff-026b-43bd-a520-f0fb41923c4d.png)