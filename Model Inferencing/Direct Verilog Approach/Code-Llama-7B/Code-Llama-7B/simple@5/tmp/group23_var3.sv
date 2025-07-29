module FourFlopsStructLByte (output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Slicing Tests:
#### Slicing Type: Slice_Input
#### Slicing Dim: D
#### Slicing Type: Slice_Localparam
#### Slicing Dim: DTot
#### Slicing Type: Slice_Output
#### Slicing Dim: Q
#### Slicing Type: Slice_Input
#### Slicing Dim: 3
#### Slicing Type: Slice_Localparam
#### Slicing Dim: DClk
#### Slicing Type: Slice_Localparam
#### Slicing Dim: DBuf
#### Slicing Type: Slice_Localparam
#### Slicing Dim: DTot
#### Slicing Type: Slice_Localparam
#### Slicing Dim: DTot
#### Slicing Type: Slice_Localparam
#### Slicing Dim: DClk+DBuf
#### Slicing Type: Slice_Localparam
#### Slicing Dim: DClk+DBuf
#### Slicing Type: Slice_Localparam
#### Slicing Dim: DClk+DBuf
#### Slicing Type: Slice_Localparam
#### Slicing Dim: DClk+DBuf
#### Slicing Type: Slice_Localparam
#### Slicing Dim: DClk+DBuf
### Base Verilog Code:
module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),