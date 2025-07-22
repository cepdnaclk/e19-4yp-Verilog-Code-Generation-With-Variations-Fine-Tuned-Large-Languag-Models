module test;
struct data;
reg a;
register data r1, r2, r3;
assign #25 a = 1;
assign r1.x = #10 a;
assign r2.y = #10 r1.x;
assign r3.z = #10 r2.y;
endmodule

struct data;
input x;
input [3:0] y;
input [4:0] z;
endstruct
### Resulting Verilog:
module test;
wire a;
reg a;
struct data;
register data r1, r2, r3;
assign #25 a = 1;
assign r1.x = #10 a;
assign r2.y = #10 r1.x;
assign r3.z = #10 r2.y;
endmodule

struct data;
input x;
input [3:0] y;
input [4:0] z;
endstruct

The above code should result in the following netlist:

## Schematic Syntax¶

The following are the syntaxes for the schematic languages.

### XESS:

##
##         __  __  __     _       _     _   _       _
##        |  \/  |/ /    | |     (_)   | | (_)     | |
##        | \  / | |     | |      _ _ __| | _  __ _| |
##        | |\/| | |     | |     | | |__ | || / _| | |
##        | |  | | |     | |     | | |  _|| || (_| | |
##        |_|  |_| \_____|_|     |_|_| |_|__(_)__,_|\__|
##
##  Version 2.0 Copyright (c) XESS Corporation, 2016
##  Author: 
##  XESS is an open source hardware platform for digital logic synthesis.
##  See http://www.xess.com for more information.
##
##  This program is free software; you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation; either version 2 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program; if not, write to the Free Software
##  Foundation, Inc., 59 Temple Place, Suite 330,
##  Boston, MA  02111-1307  USA
##  ___________________________________________________________
##  |                      XESS HDL                          |
##  |  Copyright (C) 2010 XESS Corporation, All Rights Reserved|
##  |________________________________________________________|
##

##
## XESS HDL 1.0
##
## This is a simple testbench.
##
##
module test;
signal a, b, c;

##
## Simple test to test some of the basics
##
module test1;
input [15:0] a;
input [3:0] b;
input [5:0] c;
output reg [15:0] d;

module test2;
input [15:0] a;
input [3:0] b;
input [5:0] c;
output reg [15:0] d;

module test3;
#10 a = 1;
#20 b = 2;
#30 c = 3;
output reg [15:0] d;

module test4;
#10 a = 1;
#20 b = 2;
#30 c = 3;
output reg [15:0] d;

## Test of constants in the top level
module test5;
output reg [15:0] d;

## Test of constants in the top level
module test6;
output reg [15:0] d;

## Test of constants in the top level
module test7;
output reg [15:0] d;

## Test of constants in the top level
module test8;
output reg [15:0] d;

## Test of constants in the top level
module test9;
output reg [15:0] d;

## Test of constants in the top level
module test10;
output reg [15:0] d;

## Test of constants in the top level
module test11;
output reg [15:0] d;

## Test of constants in the top level
module test12;
output reg [15:0] d;

## Test of constants in the top level
module test13;
output reg [15:0] d;

## Test of constants in the top level
module test14;
output reg [15:0] d;

## Test of constants in the top level
module test15;
output reg [15:0] d;

## Test of constants in the top level
module test16;
output reg [15:0] d;

## Test of constants in the top level
module test17;
output reg [15:0] d;

## Test of constants in the top level
module test18;
output reg [15:0] d;

endmodule

endmodule

##
## This is a test of the compiler.
##
module test;
input a, b, c;

##
## The testbench
##
module test2;
input a, b, c;

##
## This is a test of the compiler.
##
module test3;
input a, b, c;

##
## This is a test of the compiler.
##
module test4;
input a, b, c;

##
## This is a test of the compiler.
##
module test5;
input a, b, c;

##
## This is a test of the compiler.
##
module test6;
input a, b, c;

##
## This is a test of the compiler.
##
module test7;
input a, b, c;

##
## This is a test of the compiler.
##
module test8;
input a, b, c;

##
## This is a test of the compiler.
##
module test9;
input a, b, c;

##
## This is a test of the compiler.
##
module test10;
input a, b, c;

##
## This is a test of the compiler.
##
module test11;
input a, b, c;

##
## This is a test of the compiler.
##
module test12;
input a, b, c;

##
## This is a test of the compiler.
##
module test13;
input a, b, c;

##
## This is a test of the compiler.
##
module test14;
input a, b, c;

##
## This is a test of the compiler.
##
module test15;
input a, b, c;

##
## This is a test of the compiler.
##
module test16;
input a, b, c;

##
## This is a test of the compiler.
##
module test17;
input a, b, c;

##
## This is a test of the compiler.
##
module test18;
input a, b, c;

endmodule

##
## The testbench
##
module test2;
input a, b, c;

##
## The testbench
##
module test3;
input a, b, c;

##
## The testbench
##
module test4;
input a, b, c;

##
## The testbench
##
module test5;
input a, b, c;

##
## The testbench
##
module test6;
input a, b, c;

##
## The testbench
##
module test7;
input a, b, c;

##
## The testbench
##
module test8;
input a, b, c;

##
## The testbench
##
module test9;
input a, b, c;

##
## The testbench
##
module test10;
input a, b, c;

##