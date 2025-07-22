module latch (input d, c, output reg q, output q_b );
always begin
wait ( c );
end
endmodule
### Outputs:
{ q: 1, q_b: 0 }
### Error Message:
Error: Failed to infer output port direction due to conflicting values inferred for output port 'q' and 'q_b'