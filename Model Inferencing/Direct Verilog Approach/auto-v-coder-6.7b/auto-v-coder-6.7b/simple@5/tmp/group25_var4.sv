```verilog
// Enum Declaration
// Define enum for all possible states based on 'a' and 'c'
typedef enum {Z0, Z0_5, Z1, Z1_5, Z2, Z2_5, Z3, Z3_5, Z4, Z4_5, Z5, Z5_5, Z6, Z6_5, Z7, Z7_5, Z8, Z8_5} state;

module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;

// Assign signals zn, zp to the enum state based on the inputs
state current_state;
assign zn = (current_state == Z0 || current_state == Z0_5 || current_state == Z1 || current_state == Z1_5 || current_state == Z2 || current_state == Z2_5 || current_state == Z3 || current_state == Z3_5 || current_state == Z4 || current_state == Z4_5 || current_state == Z5 || current_state == Z5_5 || current_state == Z6 || current_state == Z6_5 || current_state == Z7 || current_state == Z7_5 || current_state == Z8 || current_state == Z8_5)? 1 : 0;
assign zp = (current_state == Z0 || current_state == Z1 || current_state == Z2 || current_state == Z3 || current_state == Z4 || current_state == Z5 || current_state == Z6 || current_state == Z7 || current_state == Z8)? 1 : 0;

// State Transition
always @(*) begin
    case ({a, c}) 
        2'b00: current_state = Z0;
        2'b01: current_state = Z1;
        2'b10: current_state = Z2;
        2'b11: current_state = Z3;
    endcase
end
endmodule
```

This code creates a state machine with 4 states (Z0 to Z3) based on the input