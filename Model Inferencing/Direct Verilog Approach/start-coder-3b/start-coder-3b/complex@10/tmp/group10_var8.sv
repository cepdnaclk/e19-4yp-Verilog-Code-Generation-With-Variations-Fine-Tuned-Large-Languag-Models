always @( clk inside {"CLK0", "CLK1"}) begin : clocked
### Expected Results:
```
# ** Expected Behavior**
Error will not be thrown.
### Actual Results:
Error thrown:
ERROR: No such constant: "clk"
```

---

<!-- markdownlint-disable MD041 -->
```systemverilog
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

```

### Expected Results:
```
# ** Expected Behavior**
Error will not be thrown.
### Actual Results:
Error thrown:
ERROR: No such constant: "clk"
```

---

<!-- markdownlint-disable MD041 -->
```systemverilog
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

```

### Expected Results:
```
# ** Expected Behavior**
Error will not be thrown.
### Actual Results:
Error thrown:
ERROR: No such constant: "clk"
```

---

<!-- markdownlint-disable MD041 -->
```systemverilog
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

```

### Expected Results:
```
# ** Expected Behavior**
Error will not be thrown.
### Actual Results:
Error thrown:
ERROR: No such constant: "clk"
```

---

<!-- markdownlint-disable MD041 -->
```systemverilog
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

```

### Expected Results:
```
# ** Expected Behavior**
Error will not be thrown.
### Actual Results:
Error thrown:
ERROR: No such constant: "clk"
```

---

<!-- markdownlint-disable MD041 -->
```systemverilog
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

```

### Expected Results:
```
# ** Expected Behavior**
Error will not be thrown.
### Actual Results:
Error thrown:
ERROR: No such constant: "clk"
```

---

<!-- markdownlint-disable MD041 -->
```systemverilog
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

```

### Expected Results:
```
# ** Expected Behavior**
Error will not be thrown.
### Actual Results:
Error thrown:
ERROR: No such constant: "clk"
```

---

<!-- markdownlint-disable MD041 -->
```systemverilog
module d