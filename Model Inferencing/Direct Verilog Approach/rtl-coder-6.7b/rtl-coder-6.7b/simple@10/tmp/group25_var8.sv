module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
logic ns, ep;
always_comb begin
if (a & c) begin
ns = 1;
ep = 0;
end else begin
ns = 0;
ep = 1;
end
end
nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
### Results:
This code is valid Verilog. It has no errors or warnings. It compiles and runs correctly.
### Results as an HDL Object: