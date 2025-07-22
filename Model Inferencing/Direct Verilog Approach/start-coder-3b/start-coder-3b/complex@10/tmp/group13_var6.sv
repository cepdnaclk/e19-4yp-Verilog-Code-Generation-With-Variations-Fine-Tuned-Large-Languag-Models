```verilog
module t_Universal_Shift_Reg();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5;

Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1,
s0, clk, rst);
Clock_Gen M2(clk);

initial #1000 $finish;
initial fork
begin #5 rst = 1; #20 rst = 0;end
begin #120 rst = 1; #20 rst = 0;end
begin #260 rst = 1; #20 rst = 0;end
begin #380 rst = 1; #20 rst = 0;end
join
initial fork
join
begin // Verify left shift
join
begin // Verify load
join
begin // reset
join

join
endmodule

module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-12-2004
input s1, s0, clk, rst;
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];
always @ (posedge clk) begin
if (rst) Data_Out <= 0;
else case (s0) // 10-12-2004
0: Data_Out <= Data_Out; // Idle
1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
3: Data_Out <= Data_In; // Parallel Load
s0 <= s1;
endcase
end
endmodule
```---
layout: default
title: "Chapter 01: The Basics"
date: 2018-04-10 13:21
categories:
- DSP
- Digital Signal Processing
tags:
- Digital Signal Processing
- DSP
- Digital Signal Processing for Beginners
- Digital Signal Processing Courses
description: "Chapter 01: The Basics"
---

### Chapter 01: The Basics

#### What is a Digital Signal?

The most basic digital signal is a pulse. A digital signal can be either a square wave or a sawtooth.

**square wave**

![Square wave signal](/assets/images/Digital_Signal_Processor_Book/01-01.png)

**Sawtooth wave**

![Sawtooth wave signal](/assets/images/Digital_Signal_Processor_Book/01-02.png)

#### Digital Signal Processing

The goal of DSP is to create an electronic system that converts a digital signal into a digital signal so that it can be understood by the human brain.

![DSP](/assets/images/Digital_Signal_Processor_Book/01-03.png)

In the picture above, we have a digital signal in which we want to process.

In the picture above, you can see that the signal is digital. It is analog in nature.
In the picture above, you can see that there is a lot of information in the signal.

Now, the signal is a digital signal. The signal is in the form of digital information.

The goal of DSP is to convert the digital signal into something that is easier to be understood by human.

The goal of DSP is to convert the digital signal into something that is easier to be understood by human.

The goal of DSP is to convert the digital signal into something that is easier to be understood by human.

#### What Is a Digital Signal Processor (DSP)?

A DSP is a special type of electronic system that is built for the purpose of converting a digital signal into a digital signal.

Basically a DSP is a circuit that is built like a microcontroller that takes a digital signal as input and converts it to a digital signal as output.

The goal of DSP is to convert the digital signal into something that is easier to be understood by human.

The goal of DSP is to convert the digital signal into something that is easier to be understood by human.

The goal of DSP is to convert the digital signal into something that is easier to be understood by human.

#### What Is a Digital Signal Processor (DSP)?

A digital signal processor (DSP) is a special type of electronic system that is built for the purpose of converting a digital signal into a digital signal.

Basically, a digital signal processor (DSP) is a circuit that is built like a microcontroller that takes a digital signal as input and converts it to a digital signal as output.

#### What Is a Digital Signal Processor (DSP)?

A digital signal processor (DSP) is a special type of electronic system that is built for the purpose of converting a digital signal into a digital signal.

Basically, a digital signal processor (DSP) is a circuit that is built like a microcontroller that takes a digital signal as input and converts it to a digital signal as output.

The goal of DSP is to convert the digital signal into something that is easier to be understood by human.

The goal of DSP is to convert the digital signal into something that is easier to be understood by human.

The goal of DSP is to convert the digital signal into something that is easier to be understood by human.

In the picture below, the first picture shows a circuit that performs multiplication and the second picture shows the circuit that performs a digital signal processor.

![Digital Signal Processor Circuit](/assets/images/Digital_Signal_Processor_Book/01-04.png)

The picture above shows a circuit that performs multiplication and the picture above shows the circuit that performs a digital signal processor.

The first picture shows a circuit that performs multiplication and the second picture shows the circuit that performs a digital signal processor.

The first picture shows a circuit that performs multiplication and the second picture shows the circuit that performs a digital signal processor.

The first picture shows a circuit that performs multiplication and the second picture shows the circuit that performs a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal process

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a digital signal processor.

The first picture shows a circuit that is built for performing multiplication and the second picture shows a