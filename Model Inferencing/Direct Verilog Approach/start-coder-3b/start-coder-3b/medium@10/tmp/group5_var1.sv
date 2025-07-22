module test_k_mda;
wire q, clock, j, k, preset, clear;
reg j, k;
logic [2*5-1:0] jk;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
jk[5] = '10; //jk[5] = 10b;
jk[10] = '01; //jk[10] = 11b;
jk[15] = '11; //jk[15] = 1011b;
jk[20] = '01; //jk[20] = 1001b;
jk[25] = '10; //jk[25] = 1010b;
jk[30] = '01; //jk[30] = 1001b;
jk[35] = '11; //jk[35] = 1011b;
jk[40] = '01; //jk[40] = 1001b;
jk[45] = '10; //jk[45] = 1010b;
jk[50] = '01; //jk[50] = 1001b;
jk[55] = '11; //jk[55] = 1011b;
end
m555 timer(clock);
endmodule
### Design Files:
test_k.v
test_k_mda.v
### Expected Result:
If this variation is successful, the final states of j, k, and q should be as follows.
| j | k | q |
| --- | --- | --- |
| 0 | 0 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |
| 0 | 1 | 1 |
| 0 | 0 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |
| 0 | 1 | 1 |
| 0 | 0 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |
| 0 | 1 | 1 |
| 0 | 0 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |
| 0 | 1 | 1 |
### Simulation Output:
The following is a sample set of simulation output:
![Simulation Output](images/mda_simulation_output.png "Simulation Output")

### Extra Credit:
Make a copy of the jk_edge_ff_tb.nc and change the testbench parameters in it to test that the MDA in the jk_edge_ff.v module is working by passing in the array, jk, to the test bench.
#include <iostream>
#include <fstream>
#include <string>
#include <bitset>
using namespace std;

void bin2hex(uint8_t byte) {
	// Convert binary to hex
	uint8_t byte_low = byte << 4;
	uint8_t byte_high = byte >> 4;
	bitset<4> low_bits(byte_low);
	bitset<4> high_bits(byte_high);
	string low_bin = low_bits.to_string();
	string high_bin = high_bits.to_string();

	cout << "Byte: " << hex << uppercase << (int)byte << endl;
	cout << "Binary: " << hex << uppercase << byte << endl;
	cout << "Low nibble: " << hex << uppercase << (int)byte_low << " or " << low_bin << endl;
	cout << "High nibble: " << hex << uppercase << (int)byte_high << " or " << high_bin << endl;

	return;
}

int main(int argc, char** argv) {
	uint8_t byte = 0x10;
	bin2hex(byte);
	cout << "Done." << endl;
	return 0;
}#ifndef __JK_EDGE_FF_H__
#define __JK_EDGE_FF_H__

#define HIGH       1
#define LOW        0

// JKEdgeFF class
class JKEdgeFF {
	public:
		JKEdgeFF();
		JKEdgeFF(int q, int clock, int j, int k, int preset, int clear);
		~JKEdgeFF();
		int dojk();
		int dojk(int q, int clock, int j, int k, int preset, int clear);
	private:
		int dojk(int q, int clock);
		int dojk(int q, int clock, int j, int k, int preset, int clear);

		int Q, clock, J, K, PRESET, CLEAR;
		int Qprev, Jprev, Kprev;
};

#endif //__JK_EDGE_FF_H__#include <iostream>
#include <cstdint>
#include <bitset>
using namespace std;

int main(int argc, char** argv) {
	bitset<32> bin;
	bitset<32> twosComp;
	int num = -103;
	bin = num;
	twosComp = ~bin + 1;
	cout << "Bin: " << bin << endl;
	cout << "Twos Comp: " << twosComp << endl;
	return 0;
}#include <iostream>
#include <cstdint>
#include <bitset>
using namespace std;


int main(int argc, char** argv) {
	uint16_t s = 32767;
	uint32_t t = 7;
	uint32_t u = 255;
	float a = 442;
	bitset<16> s_bits(s);
	bitset<32> t_bits(t);
	bitset<32> u_bits(u);
	bitset<32> a_bits(a);
	cout << "s: " << s << " : " << s_bits << endl;
	cout << "t: " << t << " : " << t_bits << endl;
	cout << "u: " << u << " : " << u_bits << endl;
	cout << "a: " << a << " : " << a_bits << endl;
	cout << "Done." << endl;
	return 0;
}
#include <iostream>
#include <fstream>
#include <string>
#include <bitset>
#include <map>
#include <regex>
#include <iomanip>
#include <cmath>
#include <cstdint>
using namespace std;

#define PI 3.14159265

int main(int argc, char** argv) {
	// Check for valid file name
	if (argc < 2) {
		cout << "ERROR: Must specify an input filename." << endl;
		cout << "Usage: " << argv[0] << " input_file.ext" << endl;
		return 1;
	}

	// Open given input file
	ifstream inputFile;
	inputFile.open(argv[1], ios::in);
	if(!inputFile.is_open()) {
		cout << "ERROR: Invalid filename: " << argv[1] << endl;
		return 1;
	}

	// Declare variables
	string line;
	double r, theta;
	uint32_t N = 0;
	map<double, double> sinCosTable;
	map<double, double>::iterator sinCosTableIter;

	// Process file
	cout << "Reading file..." << endl;
	while(getline(inputFile, line)) {
		if(regex_match(line, regex("^#[0-9]*$"))) {
			N = stoi(line);
		}
		else if(regex_match(line, regex("^[-]?[0-9]+\\.?[0-9]*$"))) {
			r = stod(line);
			theta = 2 * PI * r / N;
			sinCosTableIter = sinCosTable.find(theta);
			if(sinCosTableIter == sinCosTable.end()) {
				sinCosTable.insert(pair<double, double>(theta, sin(theta)));
			}
		}
	}

	// Write file
	cout << "Writing file..." << endl;
	ofstream outputFile;
	outputFile