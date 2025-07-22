module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_4beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation

endmodule

## Design Goal

The Design Goal is to implement a simple state machine, where each state is a 4-bit binary number and the state machine starts in state 0. The state machine should be implemented using a single 4-bit binary counter. The state machine should output a 4-bit binary number to o, and the counter should be incremented by 1. The state machine should start in state 0. The state machine should increment the counter by 1, at each clock cycle. The state machine logic should be implemented in an entity called dec2_4beh, located in a module called dec2_4beh.v. The counter logic should be implemented in an entity called d2_counter, located in a module called d2_counter.v. The top level design should have a module named tst_dec2_4beh, that instantiates the d2_counter and dec2_4beh.v modules. The d2_counter and dec2_4beh should be implemented in Verilog code. The counter is incremented by 1 each clock cycle. The state machine output is a 4-bit binary number, that is a binary number that corresponds to the state that the state machine is in.

The logic should work as follows. Initially, the state machine should be in state 0 as indicated below:

The value of i should be 0.

When the state is 0, the output o is 0000. The state is changed to 1. When the state is 1, the output o is 0001. The state is changed to 2. When the state is 2, the output o is 0010. The state is changed to 3. When the state is 3, the output o is 0011. The state is changed to 4. When the state is 4, the output o is 0100. The state is changed to 5. When the state is 5, the output o is 0101. The state is changed to 6. When the state is 6, the output o is 0110. The state is changed to 7. When the state is 7, the output o is 0111. The state is changed to 8. When the state is 8, the output o is 1000

The value of i should be 1.

When the state is 8, the output o is 1000. The state is changed to 9. When the state is 9, the output o is 1001. The state is changed to A. When the state is A, the output o is 1010. The state is changed to B. When the state is B, the output o is 1011. The state is changed to C. When the state is C, the output o is 1100. The state is changed to D. When the state is D, the output o is 1101

The value of i should be 2.

When the state is D, the output o is 1101. The state is changed to E. When the state is E, the output o is 1110. The state is changed to F. When the state is F, the output o is 1111. The state is changed to 0. When the state is 0, the output o is 0000.