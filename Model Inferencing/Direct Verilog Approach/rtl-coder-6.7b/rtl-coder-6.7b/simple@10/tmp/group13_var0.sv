logic [7:0] Sum, Carry;

module Half_Adder(
    input logic A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
### Modified Testbench:
module Testbench_Half_Adder;
    logic A, B, Sum, Carry;
    
    Half_Adder dut (.*);
    
    initial begin
        A = 0; B = 0;
        #5;
        A = 0; B = 1;
        #5;
        A = 1; B = 0;
        #5;
        A = 1; B = 1;
    end
endmodule