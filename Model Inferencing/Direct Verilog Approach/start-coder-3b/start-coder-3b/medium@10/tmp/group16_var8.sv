module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire [3:0] c,
input wire s,
output reg [3:0] y
);
always @(*)
y=s==0? a : b;
endmodule

## Summary

• Most of the coding and design in Verilog is similar to the C programming language.
• A lot of the code design in Verilog is similar to the code design in C.
• The main difference from the C programming language is that in Verilog, the input and output signals are not separate.
• The input and output signals are together.
• The input and output signals are a signal pair.
• The output signal is a signal pair.
• The signal pair is a single signal.
• The signal pair is a data type.
• The signal pair is a data type width.
• The signal pair is a signal pair of two signals.
• The signal pair is a signal pair of two data types.
• The signal pair is a signal pair of two data type widths.

## Code Samples

• ### Sample 1: Verilog MUX

module mux2b(
input wire [1:0] a,
input wire [1:0] b,
input wire s,
output reg [1:0] y
);
always @(*)
if(s == 0)
y = a;
else
y = b;
endmodule

• ### Sample 2: Verilog RAM

module ram8b(
input wire [7:0] i,
input wire [1:0] a,
input wire w,
output reg [7:0] d
);
always @(*)
case(i)
default:
d = 0;
4'h0:
d = 0;
case(a)
default:
d = 0;
1'b0:
d = 4'h1C;
1'b1:
d = 4'h38;
endcase
endcase
endmodule

• ### Sample 3: Verilog Sequential Logic

module sq_logic(
input wire clk,
input wire [3:0] a,
input wire [3:0] b,
output reg [3:0] c,
output reg [3:0] d
);
always @(posedge clk)
c = a;
always @(posedge clk)
d = b;
endmodule

• ### Sample 4: Verilog Sequential Logic

module sq_logic(
input wire clk,
input wire [3:0] a,
input wire [3:0] b,
output reg [3:0] c,
output reg [3:0] d
);
always @(posedge clk)
c = a;
always @(posedge clk)
d = b;
endmodule

• ### Sample 5: Verilog D-Flip-Flop

module dff(
input  wire clk,
input  wire t,
input  wire d,
output reg q
);
always @(posedge clk)
if(t)
q <= d;
endmodule

• ### Sample 6: Verilog D-Flip-Flop

module dff(
input  wire clk,
input  wire t,
input  wire d,
output reg q
);
always @(posedge clk)
if(t)
q <= d;
endmodule

• ### Sample 7: Verilog D-Flip-Flop

module dff(
input  wire clk,
input  wire t,
input  wire d,
output reg q
);
always @(posedge clk)
if(t)
q <= d;
endmodule

• ### Sample 8: Verilog Sequential Counter

module seq_counter(
input  wire clk,
input  wire r,
input  wire t,
output reg [3:0] c
);
always @(posedge clk)
case(c)
3'h000:
if(r) begin
c <= 4'h001;
end
default:
if(r & t) begin
c <= c + 4'h001;
end
endcase
endmodule

• ### Sample 9: Verilog Sequential RAM

module ram8b(
input wire [7:0] i,
input wire [1:0] a,
input wire w,
output reg [7:0] d
);
always @(*)
case(i)
default:
d = 0;
4'h0:
d = 0;
case(a)
default:
d = 0;
1'b0:
d = 4'h1C;
1'b1:
d = 4'h38;
endcase
endcase
endmodule

• ### Sample 10: Verilog Sequential RAM

module ram8b(
input wire [7:0] i,
input wire [1:0] a,
input wire w,
output reg [7:0] d
);
always @(*)
case(i)
default:
d = 0;
4'h0:
d = 0;
case(a)
default:
d = 0;
1'b0:
d = 4'h1C;
1'b1:
d = 4'h38;
endcase
endcase
endmodule