module Ripple_Add9;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
endmodule

module FA;
    input a, b;
    output sum;
    output carry;
    assign carry = a & b;
    assign sum = a ^ b;
endmodule

module Ripple_Add9;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
endmodule

module FA;
    input a, b;
    output sum;
    output carry;
    assign carry = a & b;
    assign sum = a ^ b;
endmodule

### End of File ###

/Test_Programs/2_Basic/14_ShiftReg_D_2_4x16.cpp
#include<bits/stdc++.h>
#include "VShiftReg_D_2_4x16.h"//the Verilog module
#include<iostream>
#include"verilated.h"
#include<cstdio>
#include<cstdlib>
#include<fstream>
#include<string>
#include<cstring>
#include<cstdlib>
#include<ctime>
#include <sys/time.h>
#include <chrono>
#include <thread>

using namespace std;
#define NUM_TRACE_CYCLES 60

int main()
{
   	struct timeval tv;
   	double diff;
   	gettimeofday(&tv,NULL);
   	unsigned long long start_time=((unsigned long long)tv.tv_sec*1000000)+(unsigned long long)tv.tv_usec;

   	auto start = std::chrono::steady_clock::now();
	Verilated::traceEverOn(true);
	VShiftReg_D_2_4x16* top=new VShiftReg_D_2_4x16; //instance of module
	//VShiftReg_D_2_4x16* top;
	VerilatedVcdC* T traces=new VerilatedVcdC; //trace dump
	top->trace(traces,99); //trace dump
	traces->open("trace_file.vcd"); //trace dump
	int i,j,k; //loop iterators

	//write the code to put values into the D input of the module
	top->D=0x0000000000000000;//input value 0000000000
	top->clk=0;
	top->eval(); //run the top module for one cycle
	top->clk=1;
	top->eval(); //run the top module for one cycle

	top->D=0x0000000000000000;//input value 0000000000
	top->clk=0;
	top->eval(); //run the top module for one cycle
	top->clk=1;
	top->eval(); //run the top module for one cycle

	top->D=0x0000000000000000;//input value 0000000000
	top->clk=0;
	top->eval(); //run the top module for one cycle
	top->clk=1;
	top->eval(); //run the top module for one cycle

	top->D=0x0000000000000