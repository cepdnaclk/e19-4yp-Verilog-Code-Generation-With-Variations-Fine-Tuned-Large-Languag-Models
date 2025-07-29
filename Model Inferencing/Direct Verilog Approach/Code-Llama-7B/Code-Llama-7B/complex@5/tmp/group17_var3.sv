```
module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
function int f;
  input [3:0] i;
  reg [3:0] temp;
  initial temp = 4'b0001;
  always @(*)
  begin
  if (i < 4)
    begin
    case (i)
      0: temp = 4'b0001;
      1: temp = 4'b0010;
      2: temp = 4'b0100;
      3: temp = 4'b1000;
    endcase
    end
  end
  endfunction
generate
assign x_index = x < y? 0 : (x == y? 1 : 2);
assign y_index = x < y? 2 : (x == y? 1 : 0);
assign gt = x < y? 1 : (x == y? 0 : 0);
assign eq = x == y? 1 : 0;
assign lt = x < y? 1 : (x == y? 0 : 1);
endgenerate
endmodule
```
### Test Bench:
```
module comp_tb;
reg [3:0] x, y;
wire gt, eq, lt;
comp cmp (.x(x),.y(y),.gt(gt),.eq(eq),.lt(lt));
wire [3:0] x_index, y_index;
initial
begin
x = 4'b0001;
y = 4'b0001;
#1 assert(gt == 1'b0);
#1 assert(eq == 1'b1);
#1 assert(lt == 1'b0);
x = 4'b0001;
y = 4'b0000;
#1 assert(gt == 1'b1);
#1 assert(eq == 1'b0);
#1 assert(lt == 1'b0);
x = 4'b0001;
y = 4'b0011;
#1 assert(gt == 1'b0);
#1 assert(eq == 1'b0);
#1 assert(lt == 1'b1);
x = 4'b0001;
y = 4'b0000;
#1 assert(gt == 1'b1);
#1 assert(eq == 1'b0);
#1 assert(lt == 1'b0);
x = 4'b0000;
y = 4'b0001;
#1 assert(gt == 1'b0);
#1 assert(eq == 1'b0);
#1 assert(lt == 1'b1);
endmodule
```
### Simulation:
![comp_tb image 1](https://drive.google.com/uc?export=view&id=0ByOc-29M0crmZDg5bjRaQmhKM2M)
### Conclusion:
The approach of generating the constants by using an array index inside the `inside` operator and a function call result inside the `