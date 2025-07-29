```verilog
module ALU_COMP (x, comparison, result);
  input [3:0] x;
  output [2:0] result;
  output comparasion;
  assign result = comparison? 1'b1 : 1'b0;
  always @ (x or comparasion) begin
    if (compare) begin
      case (x)
        INSIDE_0: result = 3'b100;
        INSIDE_1: result = 3'b010;
        INSIDE_2: result = 3'b001;
      endcase
    end else begin
      result = 3'b000;
    end
  end
endmodule

package INSIDE_PACKAGE;
  parameter INSIDE_0 = 4'b0100;
  parameter INSIDE_1 = 4'b0010;
  parameter INSIDE_2 = 4'b0001;
endpackage

module ALU_ADD (x, y, result);
  input [3:0] x, y;
  output [3:0] result;
  always @ (x or y) begin
    result = x + y;
  end
endmodule

module ALU_MUL (x, y, result);
  input [3:0] x, y;
  output [7:0] result;
  always @ (x or y) begin
    result = 8'b0;
    for (int i=0; i<4; i++) begin
      result += (x[i]? y : 0'b0) << i;
    end
  end
endmodule

module ALU_DIV (x, y, result);
  input [3:0] x, y;
  output [3:0] result;
  always @ (x or y) begin
    result = y? x / y : 0;
  end
endmodule

module ALU (x, y, operation, result);
  input [3:0] x, y, operation;
  output [3:0] result;
  wire [2:0] comparasion;
  wire [3:0] inside_result;

  ALU_COMP u_comp (.x(x),.comparasion(comparasion),.result(inside_result));
  ALU_ADD u_add (.x(x),.y(y),.result(result));
  ALU_MUL u_mul (.x(x),.y(y),.result(result));
  ALU_DIV u_div (.x(x),.y(y),.result(result));
endmodule

module TOP1 (CLK, RST_X);
  input CLK, RST_X;
  reg [3:0] x, y, operation;
  wire [3:0] result;

  always @ (posedge CLK or posedge RST_X) begin
    if (RST_X == 0) begin
      operation <= 0;
      x <= 4'b0;
      y <= 4'b0;
    end else begin
      operation <= operation + 1;
      if (operation == 0) begin
        x <= 4'b1000;
        y <= 4'b0100;
      end else if (operation == 1) begin
        x <= inside_result;
        y <= 4'b0010;
      end else begin
        x <= 4'b1000;
        y <= 4'b0001;
      end
    end
  end

  ALU u_alu (
   .x(x),
   .y(y),
   .operation(operation),
   .result(result)
  );
endmodule
```
### Expect Result:
![image](https://user-images.githubusercontent.com/42842621/137656354-1b992418-9db1-40e4-a12f-144cd3330c86.png)

# **Question 3**
### Base Verilog Code:
module TOP1 (CLK, RST_X);
  input