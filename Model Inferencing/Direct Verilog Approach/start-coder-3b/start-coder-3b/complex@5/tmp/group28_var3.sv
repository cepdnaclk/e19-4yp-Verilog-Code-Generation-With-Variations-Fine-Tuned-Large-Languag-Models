module latch;
reg d,en;
wire q,qb;
assign qb=q;
// latch
assign q = d & en;
endmodule
# SFC-02-17

# Case 1:

## Base Verilog Code:

```verilog
module tstdlatch; //test-bench
reg d,en;
wire q,qb;
// dlatch ff(en,d,q,qb); // Assuming instantiation of a D latch module
initial
begin
d = 1'b0;
en = 1'b0; // Latch disabled
end
always #4 en =~en; // Enable toggles every 4 time units
always #8 d=~d; // Data toggles every 8 time units
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule
```

## Variation Instruction:

Replace `flush_P0_P1` transition with an `inside` check of `state` against a packed range defined in package scope.

## Modified Code:

```verilog
module tstdlatch; //test-bench
reg d,en;
wire q,qb;
// dlatch ff(en,d,q,qb); // Assuming instantiation of a D latch module
initial
begin
d = 1'b0;
en = 1'b0; // Latch disabled
end
always #4 en =~en; // Enable toggles every 4 time units
always #8 d=~d; // Data toggles every 8 time units
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule
```

# Case 2:

## Base Verilog Code:

```verilog
module adder;
wire [7:0]a,b,c,s,cout;
// a,b,c,s,cout 8 bit adder module
assign s = a+b;
assign cout = ($reduce_or(a,b) &&~ (~s[7] || c));
//assign c = $reduce_or(a,b) &&~ (~s[7] || c);
initial
begin
a=8'h23;
b=8'h45;
c=1'b0;
end
initial $monitor($time," a=%b b=%b c=%b s=%b cout=%b ", a,b,c,s,cout);
initial $stop;
endmodule
```

## Variation Instruction:

Change the `assign` at line 5 to an `inside` check of `a` and `b` against a packed range defined in package scope.

## Modified Code:

```verilog
module adder;
wire [7:0]a,b,c,s,cout;
// a,b,c,s,cout 8 bit adder module
assign s = a+b;
assign cout = ($reduce_or(a,b) &&~ (~s[7] || c));
//assign c = $reduce_or(a,b) &&~ (~s[7] || c);
initial
begin
a=8'h23;
b=8'h45;
c=1'b0;
end
initial $monitor($time," a=%b b=%b c=%b s=%b cout=%b ", a,b,c,s,cout);
initial $stop;
endmodule
```

# Case 3:

## Base Verilog Code:

```verilog
module adder;
wire [7:0]a,b,c,s,cout;
// a,b,c,s,cout 8 bit adder module
assign s = a+b;
assign cout = ($reduce_or(a,b) &&~ (~s[7] || c));
//assign c = $reduce_or(a,b) &&~ (~s[7] || c);
initial
begin
a=8'h23;
b=8'h45;
c=1'b0;
end
initial $monitor($time," a=%b b=%b c=%b s=%b cout=%b ", a,b