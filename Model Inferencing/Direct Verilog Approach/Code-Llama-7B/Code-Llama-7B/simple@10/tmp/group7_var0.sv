module AndOr (output X, Y, input [7:0] A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Output Directory:
Output directory is the directory where the output files are to be written to. If
not present, the current directory is taken as the output directory, i.e. the
cwd.
### Output File Name:
The Output file name is the name of the ver