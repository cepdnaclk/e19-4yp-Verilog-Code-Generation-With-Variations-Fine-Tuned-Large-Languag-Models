module DFF (input logic [(1+2+3+4)*8-1:0] a, output logic [(1+2+3+4)*8-1:0] y);
always_ff @(posedge clk)
y <= a;
endmodule

module top();
  logic [3:0] a;
  logic [3:0] b;
  logic [3:0] c;
  
  DFF #(4) dff(a, b);
  DFF #(3) dff_1(b, c);
  
  Anding anding(.*);
  assign c = (dff_1, dff);

endmodule

### Expected Output:
y = 0x0
### Expected Dump File:
# Variable Information

# Instances:
top = top@1 (anding@1, dff@1, dff_1@1, top@3)

# Hierarchy

top@3
  top@1 (anding@1, dff@1, dff_1@1, top@3)
  - anding@1
  - dff@1
  - dff_1@1
  top@1
  - anding@1
  - dff@1
  - dff_1@1
  - anding@1
  - dff@1
  - dff_1@1
  - anding@1
  - dff@1
  - dff_1@1
  - anding@1
  - dff@1
  - dff_1@1
  - anding@1
  - dff@1
  - dff_1@1
  - anding@1
  - dff@1
  - dff_1@1
  - anding@1
  - dff@1
  - dff_1@1
  - anding@1
  - dff@1
  - dff_1@1
  - anding@1
  - dff@1
  - dff_1@1
  - anding@1
  - dff@1
  - dff_1@