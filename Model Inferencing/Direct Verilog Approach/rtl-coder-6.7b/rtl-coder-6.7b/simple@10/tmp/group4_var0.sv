module testbench ();
generate struct { rand bit [15:0] data; } data;
process data;
endmodule

### Expected result:
Randomization inside the structure should be detected as a randomization error by the lint tool.