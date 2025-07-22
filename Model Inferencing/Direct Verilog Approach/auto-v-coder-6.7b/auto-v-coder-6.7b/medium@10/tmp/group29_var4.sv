```verilog
module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output reg Q;
always @(posedge Clock)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule


module array_element_access(input [7:0] array, input [2:0] index, output reg result);

reg [7:0] array_internal;
wire [7:0] array_internal_wire;

muxdff muxdff_inst0(array_internal[0], array[0], index[0], Clock, array_internal_wire[0]);
muxdff muxdff_inst1(array_internal[1], array[1], index[1], Clock, array_internal_wire[1]);
muxdff muxdff_inst2(array_internal[2], array[2], index[2], Clock, array_internal_wire[2]);
muxdff muxdff_inst3(array_internal[3], array[3], index[3], Clock, array_internal_wire[3]);
muxdff muxdff_inst4(array_internal[4], array[4], index[4], Clock, array_internal_wire[4]);
muxdff muxdff_inst5(array_internal[5], array[5], index[5], Clock, array_internal_wire[5]);
muxdff muxdff_inst6(array_internal[6], array[6], index[6], Clock, array_internal_wire[6]);
muxdff muxdff_inst7(array_internal[7], array[7], index[7], Clock, array_internal_wire[7]);

always @(posedge Clock)
    array_internal <= array_internal_wire;

assign result = array_internal[index];
endmodule
```
In the above code, 8 instances of `muxdff` module are created to handle each bit of an 8-bit array. The selected bit is selected using the `index` input variable.