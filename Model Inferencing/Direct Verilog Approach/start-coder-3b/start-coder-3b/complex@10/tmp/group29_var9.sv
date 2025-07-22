module control_unit (flush_P0_P1, Ld_P1, Ld_P0, Ld_R0, Ld, En, clock, rst);
output reg flush_P0_P1, Ld_P1, Ld_P0, Ld_R0;
input Ld, En, clock, rst;
reg [1: 0] state, next_state;
parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
always @ (posedge clock) if (rst) state <= S_idle;
else state <= next_state;
always @ (state, Ld, En) begin
flush_P0_P1 = 0;
Ld_P1 = 0;
Ld_P0 = 0;
Ld_R0 = 0;
next_state = S_idle;
case (state)
S_idle: if (En)
begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
else flush_P0_P1 = 1;

S_1: begin next_state = S_full; Ld_P1 = 1; Ld_P0 = 1; end
S_full: if (Ld == 1) begin
begin
int i;
for (i=0; i<2; i++)
if (x==const_array[i])
begin
Ld_R0 = 1;
case (En)
0: begin next_state = S_idle; flush_P0_P1 = 1; end
1: begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
endcase
end
end
next_state = S_wait;
S_wait: if (Ld == 1) begin
begin
int i;
for (i=0; i<2; i++)
if (x==const_array[i])
begin
Ld_R0 = 1;
case (En)
0: begin next_state = S_idle; flush_P0_P1 = 1; end
1: begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
endcase
end
end
else next_state = S_wait;
endcase
end
endmodule
Example 2.15.3

In the last example, we use `if-else` to compare `x` against a constant array declared in dollar unit scope. We also used `case` to compare `x` against the same constant array declared in dollar unit scope. Which one is more efficient?

The `if-else` version is more efficient because it utilizes the `if-else` structure instead of the `case` structure. The `case` structure is less efficient because both the `case` and `if-else` structures are designed for only one constant comparison. With multiple constant comparisons, the `case` structure is less efficient because it has to traverse through all the cases to find the correct case and then jump to the appropriate code.

## 2.2 Assignment Statements

This section will describe the assignment statements.

### 2.2.1 Assignment Statement

An assignment statement transfers (or passes) the value on the right-hand-side of the assignment operator to the left-hand-side. Assignment statements are of the form:

`target_signal <operator> source_signal`

`target_signal` can be any net or variable, and `source_signal` can be any signal or variable. `operator` can be any of the following:

`=`

`a = b`

The assignment operator `=` assigns the value of `b` to `a`.

`<=`

`a <= b`

The assignment operator `<=` assigns the value of `b