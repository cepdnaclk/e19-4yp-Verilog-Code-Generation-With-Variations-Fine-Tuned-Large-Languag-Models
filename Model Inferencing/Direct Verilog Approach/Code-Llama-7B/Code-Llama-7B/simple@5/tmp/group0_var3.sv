module bit_assign( input bit in, output bit out );
    // assign out to in
    assign out = in;
endmodule
### Verification Steps:
1. Run ```sim_verilog_wire.py -p 1000 -n 10000```
2. Run ```sim_verilog_wire.py -p 1000 -n 10000 --syntax "wire_assign"```
3. Run ```sim_verilog_wire.py -p 1000 -n 10000 --syntax "bit_assign"```
### Expected Result:
The expected result is that 1) the module with the input as type wire correctly simulates, 2) the module with the input as type bit correctly simulates, and 3) the module with the input as type wire fails to simulate.
### Actual Result:
The actual result was that 1) the module with the input as type wire correctly simulates, 2) the module with the input as type bit correctly simulates, and 3) the module with the input as type wire correctly simulates.

# Issue
https://github.com/chipsalliance/cocotb/issues/1761

# Hypothesis
When passing a module name (e.g. 'wire_assign'), ```sim_verilog.py``` should recognize the module is a Verilog module.
###