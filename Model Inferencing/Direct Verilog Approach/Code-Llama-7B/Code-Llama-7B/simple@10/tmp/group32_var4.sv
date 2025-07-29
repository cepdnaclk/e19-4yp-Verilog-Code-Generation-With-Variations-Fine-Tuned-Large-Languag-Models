module t_Clock_Prog ();
wire clock;

initial #100 $finish;
Clock_Prog M1 (clk);
endmodule
module clock_prog (
	clk,
	done,
	resetn
);

timeunit 1ns / 1ps;


timeprecision 1ns / 1ps;


default clocking @(posedge clk);
endclocking

enum {
	reset_n_val = 0
} resetn_val_default;

enum {
	reset_n,
	default
} resetn_val_non_default;

parameter WIDTH = 8;
parameter DATA_WIDTH = 4;


input 	clk;
output 	done;
input 	resetn;


wire [WIDTH-1:0] sum = $unsigned(a) + $unsigned(b);
wire [WIDTH-1:0] a = 0;
wire [WIDTH-1:0] b = 0;
wire [WIDTH-1:0] c = 0;
wire [WIDTH-1:0] d = 0;
wire [WIDTH-1:0] e = 0;
wire [WIDTH-1:0] g = 0;
wire [WIDTH-1:0] h = 0;
wire [WIDTH-1:0] i = 0;
wire [WIDTH-1:0] j = 0;
wire [WIDTH-1:0] k = 0;
wire [WIDTH-1:0] l = 0;
wire [WIDTH-1:0] m = 0;
wire [WIDTH-1:0] n = 0;
wire [WIDTH-1:0] o = 0;
wire [WIDTH-1:0] p = 0;
wire [WIDTH-1:0] q = 0;
wire [WIDTH-1:0] r = 0;
wire [WIDTH-1:0] s = 0;
wire [WIDTH-1:0] t = 0;
wire [WIDTH-1:0] u = 0;
wire [WIDTH-1:0] v = 0;
wire [WIDTH-