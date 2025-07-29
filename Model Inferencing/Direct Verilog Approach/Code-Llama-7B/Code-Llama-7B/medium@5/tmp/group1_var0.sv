```
timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        4: ParOut <= {ParOut[6:0], sl, sr};
        default: ParOut <= 8'bX;
    endcase
end
endmodule
```
### Unit Test Bench:
```
timescale 1ns/100ps
module ShiftRegister8_UnitTest;
parameter WIDTH = 8;
reg sr, sl;
reg clk;
wire [WIDTH-1:0] ParOut;
wire [WIDTH-1:0] ParIn;
reg [1:0] m;
ShiftRegister8 U1 (sl, sr, clk, ParIn, m, ParOut);
initial begin
    //Set inputs
    ParIn = 'hAB;
    m = 'b0;
    sr = 1;
    sl = 1;
    clk = 0;
    $monitor("%t: ParIn=%b, Sl=%b, Shr=%b, m=%b, ParOut=%b,",
                $time, ParIn, sl, sr, m, ParOut);
    #100;
    m = 'b1;
    #100;
    m = 'b2;
    #100;
    m = 'b3;
    #100;
    $finish;
end
always #5 clk = ~clk;
endmodule
```

### Results:
### Running
```
vlog -sv../src/ShiftRegister8.sv
vsim -novopt -c ShiftRegister8_UnitTest
run -all
```
### Viewing the Transcript:
```
$ cat transcript
# ** Note: ShiftRegister8_UnitTest.v(80)
# ** STEP: 100
# ** Note: #100; ParIn=10101010, Sl=X, Shr=X, m=0, ParOut=00000000,
# ** Note: #100; ParIn=10101010, Sl=X, Shr=X, m=1, ParOut=00000000,
# ** Note: #100; ParIn=10101010, Sl=X, Shr=X, m=2, ParOut=00000000,
# ** Note: #100; ParIn=10101010, Sl=X, Shr=X, m=3, ParOut=10101010,
# ** Note: #100; ParIn=10101010, Sl=X, Shr=X, m=4, ParOut=10100010,
# ** Note: #100; ParIn=10101010, Sl=X, Shr=X, m=0, ParOut=00000000,
# ** Note: #100; ParIn=10101010, Sl=X, Shr=X, m=1, ParOut=00000000,
# ** Note: #100; ParIn=10101010, Sl=X, Shr=X, m=2, ParOut=00000000,
# ** Note: #100; ParIn=10101010, Sl=X, Shr=X, m=3, ParOut=10101010,
# ** Note: #100; ParIn=10101010, Sl=X, Shr=X, m=4, ParOut=10100010,
# ** Note: #100; ParIn=101