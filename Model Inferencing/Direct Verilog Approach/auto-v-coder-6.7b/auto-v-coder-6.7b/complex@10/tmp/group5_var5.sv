```systemverilog
// Define the states
typedef enum {A, B} state_t;

// Define the Moore Machine
class MealyMachine;
  state_t state;
  bit z;
  bit [31:0] w;

  function new();
    state = A;
    z = 0;
    w = 0;
  endfunction

  task update(bit [31:0] w);
    this.w = w;
    case (state)
      A: begin
          if (w[0]) begin
            state <= B;
            z <= 0;
          end else begin
            state <= A;
            z <= 0;
          end
        end
      B: begin
          if (w[0]) begin
            state <= B;
            z <= 1;
          end else begin
            state <= A;
            z <= 0;
          end
        end
    endcase
  endtask
endclass

// Instantiate the Moore Machine
MealyMachine m = new();

always @(posedge Clock or negedge Resetn)
  if (Resetn == 0) begin
    m.state = A;
    m.z = 0;
  end else begin
    m.update(w);
  end

assign z = m.z;
```
This code is an SV class implementation of the Mealy machine, which takes one input signal `w` over all the states. The Moore machine is in state `A` initialized with `z = 0`. 

Based on the input `w[0]`, it changes the state and also the output `z`. 

In the `update` method, I've used the input `w` inside the condition and then based on this `w[0]` it moves to the next state or doesn't move to the next state.

In instantiation of the `MealyMachine`, it takes `Resetn` as reset signal and `Clock` as clock.

Using `always @(posedge Clock or negedge Resetn)` block, It checks both posedge and negedge of the clock. For `posedge` it updates the state and `z` based on the `w`