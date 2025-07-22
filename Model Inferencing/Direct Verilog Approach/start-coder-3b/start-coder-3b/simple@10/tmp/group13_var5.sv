module Half_Adder(
    input logic A, B,
    output logic Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
### Input File:
input.v
### Modified Input File:
[Verilog]
module Half_Adder(
    input A, B,
    output Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule

### Output File:
output.v
### Modified Output File:
[Verilog]
module Half_Adder(
    input logic A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule

### Output File:
output_tb.v
### Modified Output File:
[Verilog]
module Half_Adder_tb;
    reg A = 0;
    reg B = 0;
    reg Sum = 0;
    reg Carry = 0;
    Half_Adder half_adder (
       .A(A),
       .B(B),
       .Sum(Sum),
       .Carry(Carry)
    );
    initial begin
        A = 0;
        B = 1;
        #20
        A = 1;
        B = 0;
        #20
        A = 0;
        B = 0;
        #20
        A = 0;
        B = 0;
    end
endmodule
### Makefile:
Makefile
### Modified Makefile:
VERILOG_FILES = input.v

all: $(VERILOG_FILES)
	iverilog -o output.vha $(VERILOG_FILES)
	vvp output.vha

clean:
	rm -rf *.vho *.vvp *.vda *.do *.log *.wlf *.vlog

clean_verilog:
	rm -rf *.v

clean_output:
	rm -rf output.vha output.v output_tb.v

clean_all: clean_verilog clean_output
/assignment1/v1/Makefile
all:
	iver

clean:
	rm -rf output.vha output.v output_tb.v

clean_verilog:
	rm -rf *.v

clean_output:
	rm -rf output.vha output.v

clean_all: clean_verilog clean_output
ilog -o output.vha input.v
	vvp output.vha

clean_verilog:
	rm -rf *.v/README.md
# EEE1027
All my source code and coursework for Embedded System Programming (EEE1027-02) at NTU, Taiwan University.

## Course Description

> An introduction to the fundamentals of signal and data processing, along with the principles of embedded system design and application software. Topics include digital logic design, Verilog and VHDL languages, software development tools, and system design and verification.

## Course Schedule

|Week|Date|Topic|Lecture|Lab|
|-|----|-|-|-|
|1.1|2020/08/31|[Part 1. Introduction](https://github.com/zahn-s/EEE1027/blob/main/assignment1/v1/README.md)|0831-001 - [Introduction to Logic and Fundamental Digital Design](https://ntu-csie.github.io/2020-fall-01-embedded-systems/lectures/L1.pdf)|-|
|1.2|2020/09/01|[Part 2. Logic Design](https://github.com/zahn-s/EEE1027/blob/main/assignment1/v2/README.md)|0901-001 - [Logic Design](https://ntu-csie.github.io/2020-fall-01-embedded-systems/lectures/L2.pdf)|1015-012 - [Logic Design: Lab](https://ntu-csie.github.io/2020-fall-01-embedded-systems/labs/L2.pdf)|
|[1.3](https://github.com/zahn-s/EEE1027/tree/main/assignment1/v3)|2020/09/02|[Part 3. Sequential Logic](https://github.com/zahn-s/EEE1027/blob/main/assignment1/v3/README.md)|0902-001 - [Sequential Logic](https://ntu-csie.github.io/2020-fall-01-embedded-systems/lectures/L3.pdf)|1015-012 - [Logic Design: Lab](https://ntu-csie.github.io/2020-fall-01-embedded-systems/labs/L2.pdf)|
|1.4|2020/09/03|[Part 4. Combinational Circuits](https://github.com/zahn-s/EEE1027/blob/main/assignment1/v4/README.md)|0903-001 - [Combinational Circuits](https://ntu-csie.github.io/2020-fall-01-embedded-systems/lectures/L4.pdf)|1015-012 - [Logic Design: Lab](https://ntu-csie.github.io/2020-fall-01-embedded-systems/labs/L2.pdf)|
|1.5|2020/09/06|[Part 5. Sequential Circuits](https://github.com/zahn-s/EEE1027/blob/main/assignment1/v5/README.md)|0906-001 - [Sequential Circuits](https://ntu-csie.github.io/2020-fall-01-embedded-systems/lectures/L5.pdf)|1015-012 - [Logic Design: Lab](https://ntu-csie.github.io/2020-fall-01-embedded-systems/labs/L2.pdf)|
|1.6|2020/09/07|[Part 1. Microprocessor Systems](https://github.com/zahn-s/EEE1027/blob/main/assignment1/v6/README.md)|0907-001 - [Microprocessor Systems](https://ntu-csie.github.io/2020-fall-01-embedded-systems/lectures/L6.pdf)|1014-012 - [Microprocessor Systems: Lab](https://ntu-csie.github.io/2020-fall-01-embedded-systems/labs/L6.pdf)|
|1.7|2020/09/08|[Part 2. Digital Design](https://github.com/zahn-s/EEE1027/blob/main/assignment1/v7/README.md)|0908-001 - [Digital Design](https://ntu-csie.github.io/2020-fall-01-embedded-systems/lectures/L7.pdf)|1014-012 - [Microprocessor Systems: Lab](https://ntu-csie.github.io/2020-fall-01-embedded-systems/labs/L6.pdf)|
|1.8|2020/09/09|[Part 3. Digital Systems](https://github.com/zahn-s/EEE1027/blob/main/assignment1/v8/README.md)|0909-001 - [Digital Systems](https://ntu-csie.github.io/2020-fall-01-embedded-systems/lectures/L8.pdf)|1014-012 - [Microprocessor Systems: Lab](https://ntu-csie.github.io/2020-fall-01-embedded-systems/labs/L6.pdf)|
|1.9|2020/09/10|[Part 4. FPGA Design](https://github.com/zahn-s/EEE1027/blob/main/assignment1/v9/README.md)|0910-001 - [FPGA Design](https://ntu-csie.github.io/2020-fall-01-embedded-systems/lectures/L9.pdf)|1014-012 - [Microprocessor Systems: Lab](https://ntu