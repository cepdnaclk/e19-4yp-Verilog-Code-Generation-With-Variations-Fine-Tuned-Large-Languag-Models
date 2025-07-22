module latch (input d, c, output reg q, q_b );
always begin
wait ( c );
end
endmodule
### Expected Behavior:
The behavior should be same as previous code with single bit outputs.
### Actual Behavior:
Error: 3417: This expression may not be used in this context
Error: 3232: Undefined identifier 'q_b'
### Steps to Reproduce the Problem:
1. Select a latch file and run "Test"

### Specifications:
  - Version: 1.0.6
  - Platform: (e.g. Python, Visual Studio Code, etc) Python/VS Code
  - Subsystem: (e.g. frontend or backend, or both) Verilogusername_1: Fixed since #2678