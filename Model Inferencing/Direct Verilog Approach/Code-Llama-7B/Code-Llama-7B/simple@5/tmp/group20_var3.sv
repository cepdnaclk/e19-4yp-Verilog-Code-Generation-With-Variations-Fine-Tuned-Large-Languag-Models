module latch (input d, c, output union logic [7:0] q, q_b );
always begin
wait ( c );
end
endmodule
### Expected Output:
Error on line 3: Argument types do not match:  expected  logic 7:0  but  found  union logic 7:0 
### Instruction Line 1:
Error on line 1: