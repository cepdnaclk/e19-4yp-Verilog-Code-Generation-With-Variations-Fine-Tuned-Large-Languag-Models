module latch (input d, c, output reg [7:0] packed_q, packed_q_b );
always begin
wait ( c );
end
endmodule
### Variation Type:
Struct Types
### Variation Name:
Struct as output
### Variation Instruction:
Similarly, change output from [