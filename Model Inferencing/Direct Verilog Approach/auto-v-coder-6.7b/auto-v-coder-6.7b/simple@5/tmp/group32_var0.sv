```verilog
module Reset_Prog (input logic clk, Resetn, input logic [1:0] enum_test, output logic [15:0] res);

enum logic [1:0] {A, B, C} enum;

always_ff @(posedge clk, negedge Resetn) begin
    if (!Resetn) begin
        enum <= A;
    end else begin
        case (enum_test)
            2'b00: enum <= A;
            2'b01: enum <= B;
            2'b10: enum <= C;
            default: enum <= A;
        endcase
    end
end

always_comb begin
    case (enum)
        A: res <= 16'b0000_0000_0000_0001;
        B: res <= 16'b0000_0000_0000_0010;
        C: res <= 16'b0000_0000_0000_0100;
    endcase
end

endmodule
```
This modified code introduces an enum type to the Reset_Prog module, and it uses a case statement to handle the different cases of enum_test input. Note the use of enum logic [1:0] {A, B, C}. This is a new way to declare an enum type. The values A, B, and C are the identifiers for the enum.

When writing the testbench, the enum_test input should be set in the testbench to verify that the enum is handled properly. This testbench will also include a check for the res output. This can be done in the testbench after the clk has been asserted.

Modified Testbench:
```verilog
module t_Reset_Prog ();
wire clk, Resetn;
logic [1:0] enum_test;
logic [15:0] res;

Clock_Prog M1 (clk);
Reset_Prog M2 (clk, Resetn, enum_test, res);

initial begin
    Resetn <= 1'b0;