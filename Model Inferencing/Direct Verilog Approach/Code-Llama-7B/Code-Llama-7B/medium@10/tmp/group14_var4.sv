```
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y
);
always @(*) 
begin
case(s)
1'b0:     y = a;
1'b1:     y = b;
default:  y = 0;
endcase
end
endmodule
```
### Explanation:
The combinational case structure has been replaced by a priority case statement.
The default statement can be used to force the output to 0 when the input is invalid.
This modification of the code is called a structural modification. 
### Tested Cases:
![image](images/mux21b_1.PNG)

### Recommended Codes:
#### Code 1:
```
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y
);
always @(*) 
begin
casex({s,a})
2'b00:     y = 1'bx;
2'b01:     y = a;
2'b10:     y = b;
2'b11:     y = 2'b00;
default:   y = 1'bx;
endcase
end
endmodule
```
#### Code 2:
```
module mux21b(
input wire a,
input wire b,
input wire s,
output reg y
);
reg unsigned [2:0] d={~s,a,b};
always @(*)
y=d[2];
endmodule
```
#### Code 3:
```
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y
);
reg [2:0] d={~s,a,b};
always @(*)
y=d[2];
endmodule
```
#### Code 4:
```
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y
);
output tri reg d;
always @(*)
d=s? b : a;
assign y=d;
endmodule
```
#### Code 5:
```
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y
);
reg d={~s,a,b};
always @(*)
y=d[2];
endmodule
```
#### Code 6:
```
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y
);
reg unsigned [2:0] d={~s,a,b};
always @(*)
y=d[2];
endmodule
```
#### Code 7:
```
module mux21b(
input wire a,
input wire b,
input wire s,
output reg y
);
reg [2:0] d={~s,a,b};
always @(*)
y=d[2];
endmodule
```
#### Code 8:
```
module mux21b(
input wire a,
input wire b,
input wire s,
output reg y
);
reg unsigned [2:0] d={s,a,b};
always @(*)
y=d[2];
endmodule
```
#### Code 9:
```
module mux21b(
input wire a,
input wire b,
input wire s,
output reg y
);
reg [2:0] d={s,a,b};
always @(*)
y=d[2];
endmodule
```
#### Code 10:
```
module mux21b(
input wire a,
input wire b,
input wire s,
output reg y
);
reg unsigned [2:0] d={a,b,s};
always @(*)
y=d[2];
endmodule
```
#### Code 11:
```
module mux21b(
input wire a,
input wire b,
input wire s,
output reg y
);
reg [2:0] d={a,b,s};
always @(*)
y=d[2];
endmodule
```
#### Code 12:
```
module mux21b(
input wire a,
input wire b,
input wire s,
output