module nil22;
reg [0:15] ary [0:3];
bit a;
always @ (posedge $root.clk) begin
if (...)
$display("t=%0t display: %b", $time, ary[2][1]);
end
endmodule
### Explanation:
The $display task does not reference a part-select of an array.
### Reasoning:
The $monitor task triggers at every time step, whereas $display does not. Thus, $display does not reference a part-select on an array.
### References:
- [IEEE 1800-2012](http://standards.ieee.org/getieee/1800/download/1800-2012.pdf), SystemVerilog 
- [Mixed Logic](http://www.sunburst-design.com/papers/CummingsVLSISEA2007_MixedLogic.pdf)
- [Anatomy of a Verilog Source Code](http://www.sunburst-design.com/papers/CummingsSNUG2001SJ_AnatomyV_4.pdf)
### Notes:
### To Do:
- [ ] Add more examples
- [x] Add explanation
- [x] Add references
- [x] Add reason