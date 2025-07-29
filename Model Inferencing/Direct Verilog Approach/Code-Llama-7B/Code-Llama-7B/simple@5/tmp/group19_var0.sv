module test_latch(clock, q, inputD, outputD);
    parameter N = 2;
    input clock;
    input [N-1:0] inputD;
    output [N-1:0] outputD;
    wire [N-1:0] Q;
    for(genvar i = 0; i < N; i++) begin : dff
        dff_inst DFF(inputD[i], clock, inputD[i], Q[i]);
    end
    initial begin
        clock = 0;
        #0;
        inputD = 1;
        repeat (10) begin
            #10;
            outputD = Q;
        end
        $finish;
    end
endmodule
### Test Result:
The following test cases are used to check the correctness of the design: 
   * inputD = 00
   * inputD = 01
   * inputD = 10
   * inputD = 11

The above cases should be simulated in the above modified testbench, and the outputs are shown as follows:

| testcase | inputD  | outputQ |
| :------: | :-----: | :-----: |
|    00    |  00     |   00    |
|    01    |  01     |   00    |
|    10    |  10     |   01    |
|    11    |  11     |   11    |


## Verilog Code:
module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;
endmodule
### Base Verilog Code:
module test_latch(clock, q, inputD, outputD);
    parameter N = 2;
    input clock;
    input [N-1:0] inputD;
    output [N-1:0] outputD;