```
module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
```
### Additional Information:

### Source Code:
```
/*==============================
Vars and Functions
==============================*/

localparam Buf = 1;
localparam Clk = 2;
localparam DIn = 3;
localparam Ena = 4;
localparam QOut = 5;

// Signals
logic[3:0] D, Q;
logic[0:0] Ena;
logic[0:0] Clk;
logic[0:0] DClk1;
logic[0:0] DBuf1;
logic[0:0] DBuf2;

/*==============================
Testbench
==============================*/
logic[3:0] Inp = 4'h2;
logic[3:0] Exp = 4'h1;
logic[3:0] Act;

module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output [3:0] Q, input [3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule

// Test Inputs
logic [0:0] [0:0] [0:0] [0:0] [3:0] [3:0] 
    DCl