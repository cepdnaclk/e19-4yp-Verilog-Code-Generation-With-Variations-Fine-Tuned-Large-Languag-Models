module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yReg = yReg;
always @(a, b, c)
begin: PartList
    xReg <= a & b & c;
    if (a >= 4'b0111 && a <= 4'b1110) begin
        xReg <= xReg || a;
    end
    if (a < 4'b0011 || a > 4'b1100) begin
        yReg <= yReg || a;
    end
end
endmodule
### Generate Verilog
Generated verilog file path is:
/Users/Jiangshan/Documents/TestBench/TestChip_1/tb_2/simulator/modelsim/modelsim.ini
Set active hdl file path to:
/Users/Jiangshan/Documents/TestBench/TestChip_1/tb_2/simulator/modelsim/modelsim.ini
Set active hdl file path to:
/Users/Jiangshan/Documents/TestBench/TestChip_1/tb_2/simulator/modelsim/modelsim.ini

INFO: [Common 17-342] -- PARSING TCL: /Users/Jiangshan/Documents/TestBench/TestChip_1/tb_2/simulator/modelsim/modelsim.ini
INFO: [Common 17-342] -- READING TCL: /Users/Jiangshan/Documents/TestBench/TestChip_1/tb_2/simulator/modelsim/modelsim.ini
INFO: [Common 17-342] -- LOAD TCL: /Users/Jiangshan/Documents/TestBench/TestChip_1/tb_2/simulator/modelsim/modelsim.ini

MODELSIM>
\end{code}

Any help is highly appreciated!

Answer: You need to change the `$display` statement to read:

\begin{code}
$display("%t %0d", $time, xReg);
\end{code}

Or, to get the values of xReg and yReg all in one waveform (and avoid the need to look at the waveform and find the value), change to use `$monitor`:

\begin{code}
$monitor  "%t %0d %0d", $time, xReg, yReg;
\end{code}

And add a delay for 10ns, to make the simulator actually run (I think you were seeing only the time on the clock):

\begin{code}
#10;
\end{code}

And make sure you are simulating the module in question:

\begin{code}
vsim work.EventCtlPart
\end{code}

(or whatever your top-level design module is called).

Here is the complete script file with both of these changes, and the waveform:

\begin{code}
vlib work
vmap work work
vlog -sv../Source/EventCtlPart.sv

vsim -novopt work.EventCtlPart

force -freeze sim:/EventCtlPart/a 1'b0
force -freeze sim:/EventCtlPart/b 1'b1
force -freeze sim:/EventCtlPart/c 1'b0

run 100ns

#10;
$display("%t %0d", $time, xReg);
$monitor  "%t %0d %0d", $time, xReg, yReg;

run 50ns

run 100ns

#10;
$