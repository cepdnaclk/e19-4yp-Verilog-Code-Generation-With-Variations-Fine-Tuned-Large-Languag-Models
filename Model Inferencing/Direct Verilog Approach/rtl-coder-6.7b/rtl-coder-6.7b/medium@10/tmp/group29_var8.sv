module muxdff(D0, D1, Sel, Clock, Q);
    input D0, D1, Sel, Clock;
    output Q;
    reg Q;
    always @(posedge Clock)
        if (!Sel)
            Q <= D0;
        else
            Q <= D1;
endmodule
### Tested Code:
module muxdff(D0, D1, Sel, Clock, Q);
    input D0, D1, Sel, Clock;
    output Q;
    reg Q;
    always @(posedge Clock)
        if (!Sel)
            Q <= D0;
        else
            Q <= D1;
endmodule
### Tested Packed Array Call:
### Expected:
Pass
### Actual:
Pass
### Tested Packed Array Index:
### Expected:
Pass
### Actual:
Pass
### Tested Packed Array Call and Index:
### Expected:
Pass
### Actual:
Pass
### Base Verilog Code:
module muxdff(D0, D1, Sel, Clock, Q);
    input D0, D1, Sel, Clock;
    output Q;
    reg Q;
    always @(posedge Clock)
        if (!Sel)
            Q <= D0;
        else
            Q <= D1;
endmodule