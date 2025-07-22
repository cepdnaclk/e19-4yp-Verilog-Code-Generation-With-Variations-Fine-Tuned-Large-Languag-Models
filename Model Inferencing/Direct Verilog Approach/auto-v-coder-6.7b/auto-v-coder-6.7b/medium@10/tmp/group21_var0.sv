```verilog
module tst_nm_in();
  reg in; wire out;
  wire [3:0] res;
  NMOSinv nmv(.out(out),.in(in)); // Instantiate NMOS inverter

  function [3:0] getResult;
    input [3:0] val;
    begin
      case(val)
        4'b1111: getResult = 4'b0000;
        4'b1110: getResult = 4'b0001;
        4'b1101: getResult = 4'b0010;
        4'b1100: getResult = 4'b0011;
        4'b1011: getResult = 4'b0100;
        4'b1010: getResult = 4'b0101;
        4'b1001: getResult = 4'b0110;
        4'b1000: getResult = 4'b0111;
        4'b0111: getResult = 4'b1000;
        4'b0110: getResult = 4'b1001;
        4'b0101: getResult = 4'b1010;
        4'b0100: getResult = 4'b1011;
        4'b0011: getResult = 4'b1100;
        4'b0010: getResult = 4'b1101;
        4'b0001: getResult = 4'b1110;
        4'b0000: getResult = 4'b1111;
      endcase
    end
  endfunction

  initial in =1'b1; // Start with input high -> output low
  always
  begin
    $monitor($time, " in = %b, output = %b ",in,out);
    res = getResult(out);
  end
  initial #15 $stop; // Stop simulation
endmodule