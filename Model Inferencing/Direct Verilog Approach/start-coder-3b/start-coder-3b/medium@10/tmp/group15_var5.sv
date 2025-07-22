`module control_branch (
    input  [15:0] opcode,
    input  [4:0] func3,
    output reg    branch,
    output reg    jump
);

// Control Logic
module control (
    input  [15:0] opcode,
    input  [4:0] func3,
    output reg    branch,
    output reg    jump,
    output reg    nops,
    output [1:0]  rfout_valid,
    output [1:0]  forward_a,
    output [1:0]  forward_b,
    output reg    load,
    output reg    store,
    output reg    ecall,
    output reg    csr,
    output reg    memw
);

// Register-Forwarding Logic
module forwarding (
    input  reg                  output_valid,
    input  [31:0]               reg_value,
    output reg                  forward_a,
    output reg                  forward_b
);
`

## 3.4.4.6.2. Exercise: Add Control Logic (12.2)
In this exercise, you are required to implement the control logic for
the ALU and the memory stages in Figure 5.4(b).

### Base Verilog Code:
`module control_alu (
    input  [15:0] opcode,
    input  [4:0] func3,
    output reg    branch,
    output reg    jump,
    output reg    nops,
    output [1:0]  rfout_valid,
    output [1:0]  forward_a,
    output [1:0]  forward_b,
    output reg    load,
    output reg    store,
    output reg    ecall,
    output reg