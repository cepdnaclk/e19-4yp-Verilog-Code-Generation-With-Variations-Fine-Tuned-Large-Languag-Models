```
module netdelay_struct (x,y);
input [31:0] x;
output [31:0] y;
wire [31:0] nn;
not #(2,1) (nn,x);
assign y=nn;
endmodule
```
## Simulation Steps:
```
$ vcs -full64 netdelay1.v
$ vsim -novopt work.netdelay1
```
## Simulation Output:
```
$ vsim -novopt work.netdelay1 
# 100ns - Simulation Time: 100ns
# 120ns - Simulation Time: 120ns
# 140ns - Simulation Time: 140ns
# 160ns - Simulation Time: 160ns
# 180ns - Simulation Time: 180ns
# 200ns - Simulation Time: 200ns
# 220ns - Simulation Time: 220ns
# 240ns - Simulation Time: 240ns
# 260ns - Simulation Time: 260ns
# 280ns - Simulation Time: 280ns
# 300ns - Simulation Time: 300ns
# 320ns - Simulation Time: 320ns
# 340ns - Simulation Time: 340ns
# 360ns - Simulation Time: 360ns
# 380ns - Simulation Time: 380ns
# 400ns - Simulation Time: 400ns
# 419ns - Simulation Time: 419ns
WARN-XVLOG: netdelay1.v:12: The delay of assign statement is ignored.
# 450ns - Simulation Time: 450ns
# 470ns - Simulation Time: 470ns
# 490ns - Simulation Time: 490ns
# 510ns - Simulation Time: 510ns
# 530ns - Simulation Time: 530ns
# 550ns - Simulation Time: 550ns
# 570ns - Simulation Time: 570ns
# 590ns - Simulation Time: 590ns
# 610ns - Simulation Time: 610ns
# 630ns - Simulation Time: 630ns
# 650ns - Simulation Time: 650ns
# 670ns - Simulation Time: 670ns
# 690ns - Simulation Time: 690ns
# 710ns - Simulation Time: 710ns
# 730ns - Simulation Time: 730ns
# 750ns - Simulation Time: 750ns
# 770ns - Simulation Time: 770ns
# 790ns - Simulation Time: 790ns
# 810ns - Simulation Time: 810ns
# 830ns - Simulation Time: 830ns
# 850ns - Simulation Time: 850ns
# 870ns - Simulation Time: 870ns
# 890ns - Simulation Time: 890ns
# 910ns - Simulation Time: 910ns
# 930ns - Simulation Time: 930ns
# 950ns - Simulation Time: 950ns
# 970ns - Simulation Time: 970ns
# 990ns - Simulation Time: 990ns

```
## Comments:
The net delay is defined at the beginning of the wire. This net delay is ignored by the assign statement.
For a delay defined by assign statement, the net delay from source to destination must be explicitly defined using delay modifiers.