### Verilog Code:
module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
parameter WIDTH = 2;
assign Q = { {D0[WIDTH-1:0], D1[WIDTH-1:0]}[Sel] };
always @(posedge Clock)
    Q <= Q;
endmodule
## Implementation
### Parameters
![muxdff_width_parameters.png](assets/muxdff_width_parameters.png)
### Netlist
![muxdff_width_netlist.png](assets/muxdff_width_netlist.png)
### Tracing
![muxdff_width_timing.png](assets/muxdff_width_timing.png)
![muxdff_width_trace.png](assets/muxdff_width_trace.png)
## Simulation
### Parameters
![muxdff_width_parameters.png](assets/muxdff_width_parameters.png)
### Netlist
![muxdff_width_netlist.png](assets/muxdff_width_netlist.png)
### Results
![muxdff_width.png](assets/muxdff_width.png)
## Source Code
### Code:
```verilog
module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
parameter WIDTH = 2;
assign Q = { {D0[WIDTH-1:0], D1[WIDTH-1:0]}[Sel] };
always @(posedge Clock)
    Q <= Q;
endmodule
```
/src/main/resources/markdown_pages/mux-4-1.md
# Mux-4-1
## Description
A mux41 is a multiplexer with width 1. It takes 3 wires as input (D0, D1, Sel) and returns a single output (Q). It is called a mux41 because it has a width of 4 instead of 2.
## Verilog Code:
### Base Verilog Code:
module mux41(D0, D1, Sel, Q);
input D0, D1, Sel;
output Q;
reg Q;
always @(D0 or D1 or Sel) begin
    if (!Sel) begin
        Q <= D0;
    end
    else begin
        Q <= D1;
    end
endmodule
### Variation Instruction:
Use inside in a while loop with the tested operand being a packed array element via function call index.
### Modified Code:
### Verilog Code:
module mux41(D0, D1, Sel, Q);
input D0, D1, Sel;
output Q;
reg Q;
assign Q = { D0[Sel], D1[Sel] };
always @(D0 or D1 or Sel)
    Q <= Q;
endmodule
## Implementation
### Parameters
![mux41_width_parameters.png](assets/mux41_width_parameters.png)
### Netlist
![mux41_width_netlist.png](assets/mux41_width_netlist.png)
### Tracing
![mux41_width_timing.png](assets/mux41_width_timing.png)
![mux41_width_trace.png](assets/mux41_width_trace.png)
## Simulation
### Parameters
![mux41_width_parameters.png](assets/mux41_width_parameters.png)
### Netlist
![mux41_width_netlist.png](assets/mux41_width_netlist.png)
### Results
![mux41_width.png](assets/mux41_width.png)
## Source Code
### Code:
```verilog
module mux41(D0, D1, Sel, Q);
input D0, D1, Sel;
output Q;
reg Q;
assign Q = { D0[Sel], D1[Sel] };
always @(D0 or D1 or Sel)
    Q <= Q;
endmodule
```
/src/main/resources/markdown_pages/mux-4-2.md
# Mux-4-2
## Description
A mux42 is a multiplexer with width 2. It takes 3 wires as input (D0, D1, Sel) and returns a single output (Q). It is called a mux42 because it has a width of 4 instead of 2.
### Base Verilog Code:
module mux42(D0, D1, Sel, Q);
input D0, D1, Sel;
output Q;
reg Q;
always @(D0 or D1 or Sel) begin
    if (!Sel[1:0]) begin
        Q <= D0;
    end
    else begin
        Q <= D1;
    end
endmodule
## Implementation
### Parameters
![mux42_width_parameters.png](assets/mux42_width_parameters.png)
### Netlist
![mux42_width_netlist.png](assets/mux42_width_netlist.png)
### Tracing
![mux42_width_timing.png](assets/mux42_width_timing.png)
![mux42_width_trace.png](assets/mux42_width_trace.png)
## Simulation
### Parameters
![mux42_width_parameters.png](assets/mux42_width_parameters.png)
### Netlist
![mux42_width_netlist.png](assets/mux42_width_netlist.png)
### Results
![mux42_width.png](assets/mux42_width.png)
## Source Code
### Code:
```verilog
module mux42(D0, D1, Sel, Q);
input D0, D1, Sel;
output Q;
reg Q;
always @(D0 or D1 or Sel) begin
    if (!Sel[1:0]) begin
        Q <= D0;
    end
    else begin
        Q <= D1;
    end
endmodule
```
/src/main/resources/markdown_pages/mux-4-4.md
# Mux-4-4
## Description
A mux44 is a multiplexer with width 4. It takes 3 wires as input (D0, D1, Sel) and returns a single output (Q). It is called a mux44 because it has a width of 4 instead of 2.
## Verilog Code:
### Base Verilog Code:
module mux44(D0, D1, Sel, Q);
input D0, D1, Sel;
output Q;
reg Q;
always @(D0 or D1 or Sel) begin
    if (!Sel[3:0]) begin
        Q <= D0;
    end
    else begin
        Q <= D1;
    end
endmodule
## Implementation
### Parameters
![mux44_width_parameters.png](assets/mux44_width_parameters.png)
### Netlist
![mux44_width_netlist.png](assets/mux44_width_netlist.png)
### Tracing
![mux44_width_timing.png](assets/mux44_width_timing.png)
![mux44_width_trace.png](assets/mux44_width_trace.png)
## Simulation
### Parameters
![mux44_width_parameters.png](assets/mux44_width_parameters.png)
### Netlist
![mux44_width_netlist.png](assets/mux44_width_netlist.png)
### Results
![mux44_width.png](assets/mux44_width.png)
## Source Code
### Code:
```verilog
module mux44(D0, D1, Sel, Q);
input D0, D1, Sel;
output Q;
reg Q;
always @(D0 or D1 or Sel) begin
    if (!Sel[3:0]) begin
        Q <= D0;
    end
    else begin
        Q <= D1;
    end
endmodule
```
/src/main/resources/markdown_pages/mux-4-0.md
# Mux-4-0
## Description
A mux40 is a multiplexer with width 0. It takes 3 wires as input (D0, D1, Sel) and returns a single