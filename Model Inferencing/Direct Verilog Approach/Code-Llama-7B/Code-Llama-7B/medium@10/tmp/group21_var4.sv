module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  always @(in) case(fun(in,0,2,3)) // 4D array index
    {1'b0:out = 1'b1;} // in->out Low->High
    default: out = 1'bX; // 4D array index
  endcase // switch on 4D array
  initial in =1'b1; // Start with input high -> output low
  always $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
endmodule
### Modified Function definition:
function [3:0] fun(input [0:0] in,i1,i2,i3); // 4D array index
  case(i1)
    1: case(i2)
        2: case(i3)
          3: fun = 4'b1000; // (1,2,3) -> 4'b1000
          2: fun = 4'b0100; // (1,2,2) -> 4'b0100
          1: fun = 4'b0010; // (1,2,1) -> 4'b0010
          0: fun = 4'b0001; // (1,2,0) -> 4'b0001
        default: fun = 4'b0000; // (1,X,X) -> 4'b0000
        endcase // switch on i2
        1: case(i3)
          3: fun = 4'b0000; // (1,1,3) -> 4'b0000
          2: fun = 4'b0001; // (1,1,2) -> 4'b0001
          1: fun = 4'b0010; // (1,1,1) -> 4'b0010
          0: fun = 4'b0100; // (1,1,0) -> 4'b0100
        default: fun = 4'b1000; // (1,X,X) -> 4'b1000
        endcase // switch on i3
        0: fun = 4'b1000; // (1,0,X) -> 4'b1000
      default: fun = 4'b0100; // (1,X,X) -> 4'b0100
      endcase // switch on i1
    0: case(i2)
      1: case(i3)
        2: fun = 4'b0010; // (0,1,2) -> 4'b0010
        1: fun = 4'b0011; // (0,1,1) -> 4'b0011
        0: fun = 4'b0000; // (0,1,0) -> 4'b0000
      default: fun = 4'b1000; // (0,X,X) -> 4'b1000
      endcase // switch on i3
      0: case(i3)
        1: fun = 4'b0001; // (0,0,1) -> 4'b0001
        0: fun = 4'b0000; // (0,0,0) -> 4'b0000
      default: fun = 4'b1000; // (0,X,X) -> 4'b1000
      endcase // switch on i3
    default: fun = 4'b0100; // (X,X,X