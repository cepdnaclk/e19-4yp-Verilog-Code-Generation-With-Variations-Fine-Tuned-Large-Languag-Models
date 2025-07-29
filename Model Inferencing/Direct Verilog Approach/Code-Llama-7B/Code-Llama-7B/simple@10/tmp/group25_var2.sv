module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
localparam logic[1:0] St0 = 2'b00, St1 = 2'b01, Z = 2'b10; // Use enum instead of xor and and expressions
nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
### Instruction
1. Use and enum to replace the xor and and expressions
2. Define a localparam enum that holds the same values as the xor expressions, then use it to replace them
### Testbench:
module mos_strength_tb();
logic a, c, zn, zp;
mos_strength mos(.a(a),.c(c),.zn(zn),.zp(zp));
initial begin // Initialize the inputs
    $dumpfile("mos_strength.vcd");
    $dumpvars(0,mos_strength);
    c = 1;
    a = 0;
    #10 $finish;
end // End the testbench
endmodule
### Expected Output:
![