module orfr_tst; // Testbench for OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule
module or_fr_rl(.out(a),.data2(b),.data1(c));
  wire rldata2, rldata1;
  string rlname = "data2_%m" ;
  assign rldata2 = data2;
  assign rldata1 = data1;
  assign rldata2 = {rldata2, 1'b0};
  assign rldata1 = {rldata1, 1'b0};
  assign data2 = {data2[1:0], 1'b0};
  assign data1 = {data1[1:0], 1'b0};
  string name = "data2_%m" ;
  always @ (data2) begin
  $display(`"Forcing %s to %b...\n\tforcing %s to %b...\n\tForcing %s to %b", name, data2, rlname, rldata2, name, data1);
  force data2 = {data2[1:0], 1'b0};
  force data1 = {data1[1:0], 1'b0};
  end
  always @ (data1) begin
  $display(`"Releasing %s from forcings...\n\treleasing %s from forcings...", name, rlname);
  release data2;
  release data1;
  end
  wire a = data2 | data1;
endmodule
### Simulation Results:
### 
    orfr_tst.v:10: Error: Value assigned to data2 cannot be converted to a constant.
    orfr_tst.v:10: Error (suppress