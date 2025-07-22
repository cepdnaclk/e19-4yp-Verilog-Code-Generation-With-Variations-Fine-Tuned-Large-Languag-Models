```verilog
module test_delay;  // Testbench for delay mechanism

reg i;
wire o;

initial begin
  i = 0;
  #10;
  i = 1;
  #10;
  $stop;
end

delay delay_instance(i, o);

always @(*) begin
  $display("i = %b, o = %b", i, o);
end

endmodule

module delay (i, o);  // Delay module

input i;
output o;

always @(i) begin
  #5 o <= i;
end

end