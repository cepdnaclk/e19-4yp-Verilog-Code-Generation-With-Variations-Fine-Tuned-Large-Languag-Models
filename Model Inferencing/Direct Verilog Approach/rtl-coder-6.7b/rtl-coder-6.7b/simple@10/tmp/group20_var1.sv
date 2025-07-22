```cpp
module latch (input d, c, output reg q, q_b );
localparam [7:0] T = 'h44;
localparam [7:0] C = 'h44;

union {
logic [7:0] value;
logic [3:0]  u;
logic [4:0]  v;
logic [1:0]  w;
}

initial begin
value = 0;
end

always begin
wait ( c );
end
endmodule
```
### Expected Results:
```
T = 11010100
C = 11010100
q_b = 0
q = 0
```

### Actual Results:
```
T = 11010100
C = 11010100
q_b = 0
q = 0
```