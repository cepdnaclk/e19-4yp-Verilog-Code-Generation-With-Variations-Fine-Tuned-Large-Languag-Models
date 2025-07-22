module Problem11(input logic [3:0] a, b, output logic [3:0] sum);
  logic [3:0] di, clk;
  assign sum = a + b;
endmodule
/3.0/HW3/HW3_B/src/problem3/main.cpp
#include "problem3.h"

int main() {
	init_problem3();
	return 0;
}/3.0/HW3/HW3_A/src/problem1/problem1.h
#pragma once
#include <systemc.h>

SC_MODULE(Problem1) {
private:
	sc_in<bool> di, clk;
	sc_out<bool> q;
	sc_signal<bool> d;

public:
	SC_CTOR(Problem1) {
		SC_METHOD(do_di_clk);
		sensitive << clk;
	}
	void do_di_clk();
};

void Problem1::do_di_clk() {
	d =!d;
	q = d;
}

void init_problem1() {
	Problem1 *p = new Problem1("P1");
	sc_start(100, SC_NS);
}/4.0/HW4/HW4_B/src/problem3/main.cpp
#include "problem3.h"

int sc_main(int argc, char **argv) {
	init_problem3();
	return 0;
}/3.0/HW3/HW3_B/src/problem2/main.cpp
#include "problem2.h"

int main() {
	init_problem2();
	return 0;
}/4.0/HW4/HW4_A/src/problem1/problem1.h
#pragma once
#include <systemc.h>

SC_MODULE(Problem1) {
private:
	sc_in<bool> in, se, di, clk;
	sc_out<bool> q;
	sc_signal<bool> d;

public:
	SC_CTOR(Problem1) {
		SC_METHOD(do_di_clk);
		sensitive << clk;
	}
	void do_di_clk();
};

void Problem1::do_di_clk() {
	d = in && se &&!d;
	q = d;
}

void init_problem1() {
	Problem1 *p = new Problem1("P1");
	sc_start(100, SC_NS);
}/3.0/HW3/HW3_B/src/problem8/problem8.h
#pragma once
#include <systemc.h>

SC_MODULE(Problem8) {
private:
	sc_in<bool> di, clk;
	sc_out<bool> d0, d1;
	sc_signal<bool> s0, s1, s2, s3, s4;

public:
	SC_CTOR(Problem8) {
		SC_METHOD(do_di_clk);
		sensitive << clk;
		dont_initialize();
	}
	void do_di_clk();
};

void Problem8::do_di_clk() {
	s0 =!d0 && sc_time_stamp() < 50;