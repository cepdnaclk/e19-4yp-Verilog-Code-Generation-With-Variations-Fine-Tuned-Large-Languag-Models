module latch (input d, c, output [7:0] q, q_b );
always begin
q = d;
q_b = ~d;
wait ( c );
end
endmodule
### Output Suffix:
### Test Outputs:
### Expected Output:
### Test Instructions:
Set Verilog version to 1800-2017.