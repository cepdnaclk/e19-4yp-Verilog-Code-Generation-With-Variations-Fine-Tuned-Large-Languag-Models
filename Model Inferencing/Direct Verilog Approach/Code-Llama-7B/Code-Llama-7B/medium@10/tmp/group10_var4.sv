module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= D;

    always_comb begin
        int i;
        for (i = 0; i < 4; i++) begin
            if (i == D)
                Q[i] = 1;
            else
                Q[i] = 0;
        end
    end

endmodule
### Original Simulation:
![original simulation](original_simulation.png)
### Modified Simulation:
![modified simulation](modified_simulation.png)
### Result of Verification:
* Passed: All testvectors
* Notes: There is a 1 clock delay on the modifed code.
### Reference:
[Verilog Tutorial #4: Registers](https://www.youtube.com/watch?v=jBxAJDJK6Ek&list=PLowKtXNTBypGqImE