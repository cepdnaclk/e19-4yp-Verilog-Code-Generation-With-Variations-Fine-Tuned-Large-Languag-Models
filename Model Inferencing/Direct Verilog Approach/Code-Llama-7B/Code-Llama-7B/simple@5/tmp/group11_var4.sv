module DataComponent (DataIn, DataOut, ControlSignals);
    parameter RND_STR = 1;
    typedef struct {
        int Rand;
    } Data;
    Data DataIn;
    Data DataOut;
    input ControlSignals;
endmodule
### Testbench
```v
module DataComponent_tb;
    reg CtrlSig;
    reg [7:0] DataIn;
    Data.DataOut DataOut;

    DataComponent dc (.DataIn(DataIn),.DataOut(DataOut),.ControlSignals(CtrlSig));

    initial begin
        CtrlSig = 0;
        DataIn = 8'd1;
        #10 CtrlSig = 1;
        #10 $finish;
    end
endmodule
```
### Expected Result
`x