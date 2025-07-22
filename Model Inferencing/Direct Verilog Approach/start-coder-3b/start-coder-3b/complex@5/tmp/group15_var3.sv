module tst_clkgen();//TEST_BENCH
reg clk;
wire rst_n;
clkgen c1(clk,rst_n);

initial
begin
clk = 0;
rst_n = 1'b1; // Set "high-impedance"
end
always #500 clk = ~clk; // Toggle clk every 500 time units (50 Hz)
always #300 rst_n = 1'b0; // Set low-impedance for 300 time units (10 Hz)
always #500 $display("clk=%b, rst_n=%b",clk,rst_n); // Display values
always #600 $stop; // Stop simulation
endmodule
### Variation Results:
![Before](https://github.com/albert-xie/Design-of-Digital-System-Verilog/blob/master/Lab07/Before_rst_var.png)
![After](https://github.com/albert-xie/Design-of-Digital-System-Verilog/blob/master/Lab07/After_rst_var.png)
/Lab07/clkgen.cpp
#include <cstdlib>
#include <iostream>

using namespace std;

int main(int argc, char* argv[]){
	int time = atoi(argv[1]);
	int rst_t = atoi(argv[2]);

	int clk = 0;
	int rst_n = 1;

	// 50Hz
	for(int i=0; i<time; i++){
		cout << "clk: " << clk << "  rst_n: " << rst_n << endl;
		clk = ~clk;
		if(i == rst_t) rst_n = 0;
	}

	return 0;
}/Lab04/tst_ram.cpp
#include <cstdlib>
#include <iostream>

using namespace std;

int main(int argc, char* argv[]){
	int time = atoi(argv[1]);
	int addr = atoi(argv[2]);
	int data = atoi(argv[3]);