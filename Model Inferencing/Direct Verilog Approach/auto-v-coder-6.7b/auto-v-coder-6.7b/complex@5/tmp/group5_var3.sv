```systemverilog
// Define an SV class for the Mealy FSM
class MealyFSM;
  localparam bit [1:0] A = 2'b00, B = 2'b01;
  bit y, z;
  
  function new();
    y = A;
  endfunction
  
  function void mealy(input bit w);
    case (y)
      A: begin
        if (w == 1) begin
          z = 0;
          y = B;
        end else begin
          z = 0;
          y = A;
        end
      end
      B: begin
        if (w == 1) begin
          z = 1;
          y = B;
        end else begin
          z = 0;
          y = A;
        end
      end
    endcase
  endfunction
endclass

// Instantiate and use the Mealy FSM
module top();
  MealyFSM fsm = new();
  
  initial begin
    fsm.mealy(0);
    $display("Outputs: z=%0d, y=%0d", fsm.z, fsm.y);
    fsm.mealy(1);
    $display("Outputs: z=%0d, y=%0d", fsm.z, fsm.y);
    fsm.mealy(0);
    $display("Outputs: z=%0d, y=%0d", fsm.z, fsm.y);
  end
endmodule
```
In this code, a class `MealyFSM` is defined in order to encapsulate the FSM state and transitions. The `mealy` method is an instance method that performs the state transition for the FSM, while the `y` and `z` are instance variables for the current state and output of the FSM.

The top module `top` instantiates the FSM, and the `initial` block demonstrates the usage of FSM by calling the `mealy` method with different inputs. 

Please note that this is a basic example and not the same as the provided Verilog code for synthesizable design. SV classes in SystemVerilog do not have