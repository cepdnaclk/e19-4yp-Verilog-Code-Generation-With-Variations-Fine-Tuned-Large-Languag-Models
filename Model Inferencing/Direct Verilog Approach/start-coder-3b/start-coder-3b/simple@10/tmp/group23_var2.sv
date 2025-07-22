module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
wire Q0, Q1, Q2, Q3;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
/ECE 430/430_project_4/testbench/testbench.cpp
#include <systemc.h>
#include "430_project_4.h"
SC_MODULE(testbench) {
	sc_out<bool> A_valid, B_valid, C_valid;
	sc_in<sc_uint<8>> A_data, B_data, C_data, R_data;
	sc_out<bool> Clk;
	sc_signal<bool> reset;
	sc_signal<bool> done;
	sc_signal<sc_uint<8>> A, B, C;
	sc_uint<8> R0;
	sc_fifo<sc_uint<8>> R_fifo;
	sc_uint<8> R0_expected;
	sc_uint<32> start_addr, end_addr, addr;
	sc_uint<32> num_addrs=1;
	sc_uint<8> max_val=100;
	sc_uint<8> min_val=0;
	sc_uint<8> num_tests=100;
	sc_uint<8> t;
	sc_uint<8> num_test_passed=0;
	sc_uint<8> num_test_failed=0;
	sc_uint<8> num_test_max_addr=1;
	
	void write_to_test_fifo(sc_uint<8> addr, sc_uint<8> data) {
		R_fifo<<addr<<data;
	}
	
	void test_setup() {
		bool A_valid, B_valid, C_valid;
		A_valid=0;
		B_valid=0;
		C_valid=0;
		for(t=0; t<num_tests; t++) {
			A_valid=0;
			B_valid=0;
			C_valid=0;
			addr=0;
			for(addr=0; addr<num_addrs; addr++) {
				A=min_val+rand()%(max_val-min_val+1);
				B=min_val+rand()%(max_val-min_val+1);
				C=min_val+rand()%(max_val-min_val+1);
				write_to_test_fifo(addr, A);
				write_to_test_fifo(addr, B);
				write_to_test_fifo(addr, C);
				start_addr=addr;
				end_addr=addr;
				A_valid=1;
				B_valid=1;
				C_valid=1;
			}
			if(num_test_max_addr>1) {
				done=0;
				while(!done.read()) {
					wait(100, SC_NS);
				}
				for(addr=start_addr; addr<end_addr; addr++) {
					if(num_test_max_addr>1) {
						R0=min_val+rand()%(max_val-min_val+1);
						write_to_test_fifo(addr, R0);
					}
					R0_expected=R_fifo.read();
				}
				for(addr=start_addr; addr<end_addr; addr++) {
					A_data.write(A);
					B_data.write(B);
					C_data.write(C);
					A_valid.write(A_valid);
					B_valid.write(B_valid);
					C_valid.write(C_valid);
					Clk.write(1);
					wait(100, SC_NS);
					Clk.write(0);
					wait(100, SC_NS);
					R_data.read();
					done.read();
					done.write(1);
					wait(100, SC_NS);
					done.write(0);
				}
			}
			else {
				done=0;
				while(!done.read()) {
					wait(100, SC_NS);
				}
				R0_expected=R_fifo.read();
				A_data.write(A);
				B_data.write(B);
				C_data.write(C);
				done.write(1);
				A_valid.write(1);
				B_valid.write(1);
				C_valid.write(1);	
				wait(100, SC_NS);
				Clk.write(1);
				wait(100, SC_NS);
				Clk.write(0);
				wait(100, SC_NS);
				R_data.read();
				done.read();
				done.write(0);
				for(addr=start_addr+1; addr<end_addr; addr++) {
					R_fifo.read();
				}
			}
			if(R0_expected==R_data.read()) {
				num_test_passed++;
			}
			else {
				num_test_failed++;
			}
		}
	}
	
	SC_CTOR(testbench) {
		SC_THREAD(test_setup);
	}
};
/ECE 390/390_lab_2/testbench.cpp
#include <systemc.h>

SC_MODULE (testbench) {
	sc_signal<bool> A_valid, B_valid, C_valid;
	sc_signal<sc_uint<8>> A_data, B_data, C_data;
	sc_signal<sc