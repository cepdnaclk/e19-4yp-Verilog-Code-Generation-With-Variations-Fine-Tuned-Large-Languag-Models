module dec3_top (
input wire [2:0] x,
output wire [2:0] z
);
wire [2:0] s;
wire [2:0] t;
wire [2:0] u;
dec3 U1 (
.x(x),
.y(s),
.z(t),
.a(u)
);

switch(x) begin
case(3'b000) dec3(x, z);
case(3'b001) dec3(x, z);
case(3'b010) dec3(x, z);
case(3'b011) dec3(x, z);
case(3'b100) dec3(x, z);
case(3'b101) dec3(x, z);
case(3'b110) dec3(x, z);
case(3'b111) dec3(x, z);
end
endmodule

# 8. Reversing Functions¶

## 8.1. The Problem¶

Suppose you are given a Verilog function.

### Example¶

function f(x, y, z);
f = x + (y * z);
endfunction

You want to reverse this function:

function g(x, y, z);
g = (z * y) + x;
endfunction

## 8.2. The Solution¶

Note

A good starting point is to start with the definition of the Verilog function and then figure out how you would reverse the function.

Then you can run this program to reverse the function.

$python3 reverse_verilog.py f(x, y, z) g(x, y, z) <--- Original function def f(x, y, z): return x + (y * z) <--- Reverse function def g(x, y, z): return (z * y) + x <--- Inverse of original function (z * y) + x <--- Reverse function$ echo "function f(x, y, z); f = x + (y * z); endfunction" | python3 reverse_verilog.py
<--- Original function
echo "function f(x, y, z); f = x + (y * z); endfunction" | python3 reverse_verilog.py
<--- Reverse function
echo "function f(