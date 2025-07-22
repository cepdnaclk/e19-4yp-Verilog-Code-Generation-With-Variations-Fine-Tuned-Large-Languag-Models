module orfr_tst;
  typedef struct {logic logic_b_c; string string_b_c;} structure_b_c;
  structure_b_c structure_b_c_variable_d;
  wire structure_b_c_variable_a;
  initial begin
    structure_b_c_variable_d.logic_b_c = 1'b0;
    structure_b_c_variable_d.string_b_c = "initial";
  end
  always @(structure_b_c_variable_d.logic_b_c)
    #1 $display("b=%b, c=%s", structure_b_c_variable_d.logic_b_c, structure_b_c_variable_d.string_b_c);
  always #3 structure_b_c_variable_d.logic_b_c = ~structure_b_c_variable_d.logic_b_c;
  // Toggle input 'b' every 3 time units
  or_fr_rl #(.DataType(structure_b_c),.DataIn("logic_c"),.DataOut("a")) dd(structure_b_c_variable_a, structure_b_c_variable_d);
  // Instantiate the module containing force/release
endmodule
### Simulation Output:
<snip>
b=1, c=initial
b=0, c=initial
b=1, c=initial
b=0, c=initial
b=1, c=initial
b=0, c=initial
b=1, c=initial
b=0, c=initial
b=1, c=initial
b=0, c=initial
b=1, c=initial
b=0, c=initial
b=1, c=initial
b=0, c=initial
b=1, c=initial
b=0, c=initial
b=1, c=initial
b=0, c=initial
b=1, c=initial
b=0, c=initial
b=1, c=initial
b=0, c=initial
b=1, c=initial
b=0, c=initial
b=1