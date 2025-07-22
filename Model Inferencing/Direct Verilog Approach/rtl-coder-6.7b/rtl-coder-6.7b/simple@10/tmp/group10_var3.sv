module alu_4(d,co,a,b,f,cci);
  input [3:0] a,b; input [1:0] f; input cci; input logic co;
  output [3:0]  d; output logic co;
  begin
    case(f)
      2'b00: {co,d}=a+b+cci;
      2'b01: {co,d}=a+b-cci;
      2'b10: {co,d}=a-b;
      2'b11: {co,d}=a-b;
      default : {co,d}=a+b+cci;
    endcase
  end
endmodule
### Compilation Result:

* Verification failed.

* Error (suppressible) In statement at line 15 of /home/student/my/tst_alu4.v:
    'logic' type is incompatible with non-vector 'wire' on line 15
* Error (suppressible) In statement at line 15 of /home/student/my/tst_alu4.v:
    'logic' type is incompatible with non-vector 'wire' on line 15