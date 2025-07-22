```verilog
module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;

typedef enum bit {St0, St1} state;

state [1:0] current_state;

always_comb begin
current_state = {zn, zp}; // ZN -> 0, ZP -> 1;
case(current_state)
St0: zn = ~a & ~c;
St1: zp =  a & ~c;
default: begin
           zn = 'z;
           zp = 'z;
          end
endcase
end
endmodule
```
This code defines an enum type for the states of the two output signals. For each state, it performs the logic functions of the original code. If the input 'c' is 0, the output is 'zn' and if 'c' is 1, the output is 'zp'. This variation is especially useful for verification tests as it encapsulates the behavior of the base code in a structured and testable manner.