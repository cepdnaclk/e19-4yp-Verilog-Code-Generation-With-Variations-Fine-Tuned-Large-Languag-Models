module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
parameter [5:0] Address = 5'd0;

always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= D;
endmodule
### Output:
[info] Done parsing command line arguments.
[info] Done parsing file.
[warn] module reg4:49:3,15:15: parameter <Address> is not used inside the module block.
[info] module reg4 is synthesized
[info] Running CADENCE PNR...
[info] 16 cells are replaced from the user design.
[info] 16 cells (15 cells are replaced from the user design, 1 is replaced by default).
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info] Done running CADENCE PNR.
[info