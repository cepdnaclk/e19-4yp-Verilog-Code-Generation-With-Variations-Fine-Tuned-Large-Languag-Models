```verilog
module priority_mux21b (
input wire [7:0] operand [1:0],
input wire [1:0] selector,
output reg [7:0] output_data
);
always @(*)
begin
case ({selector,operand[1],operand[0]})
4'b1??: output_data = operand[1];
4'b01?: output_data = operand[1];
4'b001: output_data = operand[0];
4'b000: output_data = {operand[1][7:1],operand[0][0]};
endcase
end
endmodule
```
This will give priority to operand 1 if selector equals 2, operand 1 if selector equals 1, operand 0 if selector equals 0 and selects the most significant bit of operand 1 and the least significant bit of operand 0 if selector equals 3. 

This is done by packing the selector and operands into a 4 bit binary number. The case statement then selects between different outputs based on this binary number. 

Note: This Verilog code assumes that operand[0] is the lower 8-bits and operand[1] is the higher 8-bits. 

Also, be aware that this will not handle any input combination that does not fit into the case, so the use of such design might need to be carefully considered.

Remember to adjust the datatype and operand arrangement according to your needs.### This code is a basic version of priority mux. You can adapt it according to your needs for more complex cases. For instance, you can add more inputs or outputs by adding more case statements, the same way you added the inputs to the case statement.

For example, to adapt this for a 4-to-1 mux, you just need to add 3 more case statements and more input operands. The case statement would then be 5-bit, with the 5th bit being the selector.

If you want to design a mux with more than 4 select lines, you can just add more statements. It's a bit tricky and might need to be carefully managed. It's always a good idea to