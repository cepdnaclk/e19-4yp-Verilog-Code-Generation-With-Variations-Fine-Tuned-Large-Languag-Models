```
> vcs -full64 -notice Problem10.v 
> vcs Problem10.v
> vsim -c -do sim.do
(OK) Loading work library: work
(OK) Saving results into directory: /home/kristina/verilog/test/Problem10/obj_dir
(OK) Executing vlogan (VCS)
(OK) Found {Problem10.v}
(OK)   and {Problem10.v}
(OK) Executing vlogan -full64 (VCS)
(OK) vlogan execution completed
(OK) Executing vhdlan (VCS)
(OK) vhdlan execution completed
(OK) Executing compile_system (VCS)
(OK) compile_system execution completed
(OK) Executing link (VCS)
(OK) link execution completed
Simulation time: 0 ps
>
```
## Problem 11
### Base Verilog Code:
module Problem11(input [9:3] in, output [3:0] out);
	reg [3:0]