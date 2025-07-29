module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  int i,j,k;
  case(j)
    1: i=1;
    2: i=2;
    3: i=3;
    default: i=0;
  endcase
  NMOS nms[4][4][4][4]; // 4D array of NMOS transistors
  initial begin
    in =1'b1; // Start with input high -> output low
    for (i=0; i<4; i=i+1) begin
      for (j=0; j<4; j=j+1) begin
        for (k=0; k<4; k=k+1) begin
          nms[i][j][k] = new( "nm_"+i+j+k); // Create new
          nms[i][j][k].connect("i",in);
          nms[i][j][k].connect("out",out);
        end
      end
    end
  end
  initial
    $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
endmodule
### Simulation Result:
![Screenshot](https://raw.githubusercontent.com/Brian-Gill/Digital-Circuits-Verilog-Code/master/Screenshot%20from%202019-04-19%2003-27-04.png)


## Variation 6:
### Base Verilog Code:
module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in