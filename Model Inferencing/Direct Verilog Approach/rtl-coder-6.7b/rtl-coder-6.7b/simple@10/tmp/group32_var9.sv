module Clock_Prog (clock);
input wire clock;

input wire [0:0] clock;

enum {NORMAL = 0, P_ON = 1, P_OFF = 2} pstate;

initial
  pstate = NORMAL;

always @(posedge clock)
  case (pstate)
    NORMAL: pstate <= P_ON;
    P_ON:  pstate <= P_OFF;
    P_OFF: pstate <= NORMAL;
  endcase
endmodule
### Testbench:
module t_Clock_Prog ();
parameter PERIOD = 20;
parameter WIDTH = 4;
reg clock;

initial #100 $finish;
initial clock = 1'b0;

always #(PERIOD/2) clock =~ clock;

Clock_Prog M1 (clock);
endmodule
### Coverage:
Clock_Prog.sv:5.0: Unexpected coverage: 'pstate' with actual value 'P_OFF' and value 'NORMAL' is not listed as expected.
Clock_Prog.sv:5.0: Unexpected coverage: 'pstate' with actual value 'NORMAL' and value 'NORMAL' is not listed as expected.
Clock_Prog.sv:5.0: Unexpected coverage: 'pstate' with actual value 'NORMAL' and value 'P_ON' is not listed as expected.
Clock_Prog.sv:5.0: Unexpected coverage: 'pstate' with actual value 'P_ON' and value 'NORMAL' is not listed as expected.
Clock_Prog.sv:5.0: Unexpected coverage: 'pstate' with actual value 'P_OFF' and value 'P_OFF' is not listed as expected.
Clock_Prog.sv:5.0: Unexpected coverage: 'pstate' with actual value 'P_OFF' and value 'P_ON' is not listed as expected.
Clock_Prog.sv:5.0: Unexpected coverage: 'pstate' with actual value 'P_ON' and value 'P_OFF' is