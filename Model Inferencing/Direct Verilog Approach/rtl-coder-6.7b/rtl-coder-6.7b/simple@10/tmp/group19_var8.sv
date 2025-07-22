module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;
endmodule
### Verilog Dynamic Array Testbench:
`timescale 1ns / 1ns
module testbench;
  reg [7:0] D;
  reg Clock, Resetn;
  wire Q;
  
  dff_inst dff_inst0(.D(D[7]),.Clock(Clock),.Resetn(Resetn),.Q(Q));

  initial begin
    $monitor("At %time D=%b Resetn=%b Q=%b", $time, D, Resetn, Q);
    Clock = 0;
    #10;
    Resetn = 1;
    D = 8'b11110000;
    #10;
    Clock = ~Clock;
    #10;
    D = 0;
    #10;
    Clock = ~Clock;
    #10;
    $finish;
  end

endmodule