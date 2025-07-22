```
module t_Clock_Prog ();

enum resetn_enum {
	DEFAULT,
	NONDEFAULT
};

input [0:0] clk;
input [0:0] resetn;
output [0:0] clock;

assign resetn = 1'b1;

endmodule
```

##### Test Plan:
| Test ID | Test Sequence | Test Description | Expected Output |
| ------- | ------------- | ---------------- | --------------- |
| 1 | clk high, resetn high | Clock is high and Resetn is high. | clock low |
| 2 | clk high, resetn low | Clock is high and Resetn is low. | clock low |
| 3 | clk low, resetn high | Clock is low and Resetn is high. | clock high |
| 4 | clk low, resetn low | Clock is low and Resetn is low. | clock high |




/examples/c++_examples/systemc_examples/ex1_simple_design/test_sim.cpp
#include "systemc"
#include "clock_prog.h"

SC_MODULE(test_clock_prog){
	sc_in<bool> clk;
	sc_in<bool> resetn;
	sc_out<bool> clock;

	void test();

	SC_CTOR(test_clock_prog){
		SC_THREAD(test);
		sensitive<<clk.pos();
	}

};

void test_clock_prog::test(){
	std::cout<<"Test Sequence: clk high, resetn high"<<std::endl;
	std::cout<<"Clock is high and Resetn is high."<<std::endl;
	clock.write(false);
	wait();
	std::cout<<"clock: "<<clock.read()<<std::endl;
	std::cout<<"Test Sequence: clk high, resetn low"<<std::endl;
	std::cout<<"Clock is high and Resetn is low."<<std::endl;
	clock.write(false);
	wait();
	std::cout<<"clock: "<<clock.read()<<std::endl;
	std::cout<<"Test Sequence: clk low, resetn high"<<std::endl;
	std::cout<<"Clock is low and Resetn is high."<<std::endl;
	clock.write(true);
	wait();
	std::cout<<"clock: "<<clock.read()<<std::endl;
	std::cout<<"Test Sequence: clk low, resetn low"<<std::endl;
	std::cout<<"Clock is low and Resetn is low."<<std::endl;
	clock.write(true);
	wait();
	std::cout<<"clock: "<<clock.read()<<std::endl;

}

int sc_main(int argc, char* argv[]){
	
	sc_signal<bool> clk;
	sc_signal<bool> resetn;
	sc_signal<bool> clock;

	test_clock_prog t1("t1");
	t1.clk(clk);
	t1.resetn(resetn);
	t1.clock(clock);

	sc_start(2, SC_NS);
	clk = 1;
	sc_start(2, SC_NS);
	clk = 0;
	sc_start(100, SC_NS);
	resetn = 1;
	sc_start(40, SC_NS);
	clk = 1;
	sc_start(40, SC_NS);
	clk = 0;
	sc_start(40, SC_NS);
	resetn = 0;
	sc_start(40, SC_NS);
	clk = 1;
	sc_start(40, SC_NS);
	clk = 0