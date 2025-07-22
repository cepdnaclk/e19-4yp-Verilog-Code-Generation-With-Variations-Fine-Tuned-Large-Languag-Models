module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
**if( s inside [1'b0, 1'b1])**
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( r ) begin : force_a_0
if( r )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin : clocked
end
endmodule


**In this way, I can use the same verilog code with any size of constant and get rid of the repeated `deassign q and q_b` statements.**

## Q3. Verilog module `deassign` vs Verilog module `unassign`
I am not sure if the deassign and unassign can be used interchangebly. But I am not sure that the deassign is a generalized version of unassign.
I think deassign can be used only in the block scope.

## Q4. Verilog module `always` vs Verilog module `initial`

## Q5. Verilog module `always` vs Verilog module `always_comb`

## Q6. Verilog module `always` vs Verilog module `always_ff`
An example of `always_ff` is found in this link: https://github.com/eecs111/Labs/blob/master/Lab4_Verilog/demo/d_ff.v

## Q7. Verilog module `always` vs Verilog module `always_latch`
As far as I understand, the `always_latch` has same funtion as `always_ff` but it takes less space.

## Q8. Verilog module `always` vs Verilog module `always_latch`

## Q9. Verilog module `always` vs Verilog module `always_latch`

## Q10. Verilog module `always` vs Verilog module `always_latch`

## Q11. Verilog module `always` vs Verilog module `always_latch`

## Q12. Verilog module `always` vs Verilog module `always_latch`

# Verilog Codes

### d_ff

```verilog
module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( r ) begin : force_a_0
if( r )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin : clocked
end
endmodule
```

### d_ff

```verilog
module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( r ) begin : force_a_0
if( r )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin : clocked
end
endmodule
```

### MUX21

```verilog
module MUX21 (input a, b, sel, output c );
reg temp;
always @( posedge sel )
begin
if ( sel == 1'b0 ) begin
temp <= a;
end else begin
temp <= b;
end
end

always @( posedge sel ) begin
if (sel == 1'b0)
begin
c <= temp;
end else
begin
c <= a;
end
end

endmodule
```

### MUX21

```verilog
module MUX21 (input a, b, sel, output c );
reg temp;
always @( posedge sel )
begin
if ( sel == 1'b0 ) begin
temp <= a;
end else begin
temp <= b;
end
end

always @( posedge sel ) begin
if (sel == 1'b0)
begin
c <= temp;
end else
begin
c <= a;
end
end

endmodule
```

### d_mux

```verilog
module d_mux (input a, b, sel, output c );
reg temp;
always @( posedge sel )
begin
if ( sel == 1'b0 ) begin
temp <= a;
end else begin
temp <= b;
end
end

always @( posedge sel ) begin
if (sel == 1'b0)
begin
c <= temp;
end else
begin
c <= a;
end
end

endmodule
```

### d_mux

```verilog
module d_mux (input a, b, sel, output c );
reg temp;
always @( posedge sel )
begin
if ( sel == 1'b0 ) begin
temp <= a;
end else begin
temp <= b;
end
end

always @( posedge sel ) begin
if (sel == 1'b0)
begin
c <= temp;
end else
begin
c <= a;
end
end

endmodule
```

### MUX421

```verilog
module MUX421( input a, b, c, sel, output d );
reg temp_a;
reg temp_b;
always @( posedge sel ) begin
if( sel == 2'b00 )
begin
temp_a <= a;
end else if( sel == 2'b01 )
begin
temp_a <= b;
end else if( sel == 2'b10 )
begin
temp_a <= c;
end else if( sel == 2'b11 )
begin
temp_a <= b;
end
end

always @( posedge sel) begin
if( sel == 2'b00 )
begin
temp_b <= a;
end else if( sel == 2'b01 )
begin
temp_b <= b;
end else if( sel == 2'b10 )
begin
temp_b <= c;
end else begin
temp_b <= a;
end
end

always @( posedge sel) begin
if( sel == 2'b00 )
begin
d <= temp_a;
end else if( sel == 2'b01 )
begin
d <= temp_b;
end else begin
d <= c;
end
end

endmodule
```

### MUX421

```verilog
module MUX421( input a, b, c, sel, output d );
reg temp_a;
reg temp_b;
always @( posedge sel ) begin
if( sel == 2'b00 )
begin
temp_a <= a;
end else if( sel == 2'b01 )
begin
temp_a <= b;
end else if( sel == 2'b10 )
begin
temp_a <= c;
end else if( sel == 2'b11 )
begin
temp_a <= b;
end
end

always @( posedge sel) begin
if( sel == 2'b00 )
begin
temp_b <= a;
end else if( sel == 2'b01 )
begin
temp_b <= b;
end else if( sel == 2'b10 )
begin
temp_b <= c;
end else begin
temp_b <= a;
end
end

always @( posedge sel) begin
if( sel == 2'b00 )
begin
d <= temp_a;
end else if( sel == 2'b01 )
begin
d <= temp_b;
end else begin
d <= c;
end
end

endmodule
```

### MUX81

```verilog
module MUX81 (input [7:0] a, b, sel, output c );
reg [7:0] temp;
always @( posedge sel ) begin
if ( sel == 1'b0 ) begin
temp <= a;
end else begin
temp <= b;
end
end

always @( posedge sel ) begin
if (sel == 1'b0)
begin
c <= temp;
end else
begin
c <= a;
end
end

endmodule
```

### MUX81

```verilog
module MUX81 (input [7:0] a, b, sel, output c );