module counter (
    input wire clk, rst,
    output reg [3:0] count
);
wire [3:0] count_i;
always @(posedge clk or posedge rst) begin
    if (rst) count_i <= 4'b0000;
    else count_i <= count_i + 1;
    count <= count_i;
end
endmodule
#include <iostream>
#include <fstream>
#include <sstream>
#include <stdlib.h>
#include <vector>
#include <bitset>
#include <string>
#include <math.h>
using namespace std;

//struct to hold the data of the instructions in the program
struct program_data {
	string instruction;
	string operand;
	int immediate;
	string op_type;
	string opcode;
	string rs;
	string rt;
	string rd;
	string shamt;
	string funct;
	string comment;
};

bool check_for_register(string word);
string to_binary(int num, int binary_length);
int to_decimal(string binary_num);
void update_program_data(vector <program_data> &program_vector);
void update_data(vector <int> &data_vector);
void update_address_map(vector <program_data> &program_vector);
void write_to_mem(vector <int> &data_vector, vector <program_data> &program_vector, vector <int> &address_map);
void openFile(string file_name, vector <program_data> &program_vector);

int main () {
	vector <program_data> program_vector;
	vector <int> data_vector;
	vector <int> address_map;
	openFile("add.txt", program_vector);
	update_program_data(program_vector);
	update_data(data_vector);
	update_address_map(program_vector);
	write_to_mem(data_vector, program_vector, address_map);
	return 0;
}

void openFile(string file_name, vector <program_data> &program_vector) {
	ifstream myfile(file_name);
	string line;
	if (myfile.is_open()) {
		while (getline(myfile, line)) {
			stringstream ss(line);
			program_data temp_program;
			ss >> temp_program.instruction;
			ss >> temp_program.operand;
			ss >> temp_program.immediate;
			ss >> temp_program.op_type;
			ss >> temp_program.opcode;
			ss >> temp_program.rs;
			ss >> temp_program.rt;
			ss >> temp_program.rd;
			ss >> temp_program.shamt;
			ss >> temp_program.funct;
			ss >> temp_program.comment;
			program_vector.push_back(temp_program);
		}
		myfile.close();
	}
	else cout << "Unable to open file";
}

void update_program_data(vector <program_data> &program_vector) {
	for (int i = 0; i < program_vector.size(); i++) {
		if (program_vector[i].op_type == "I") {
			program_vector[i].rs = "00000";
			program_vector[i].rt = "00000";
			program_vector[i].rd = "00000";
		}
		if (program_vector[i].op_type == "R") {
			program_vector[i].rs = "00000";
			program_vector[i].rt = "00000";
			program_vector[i].shamt = "00000";
		}
		if (program_vector[i].op_type == "J") {
			program_vector[i].rs = "00000";
			program_vector[i].rt = "00000";
			program_vector[i].rd = "00000";
			program_vector[i].shamt = "00000";
		}
		if (program_vector[i].rs.compare("$zero") == 0) {
			program_vector[i].rs = "00000";
		}
		if (program_vector[i].rt.compare("zero") == 0) {
			program_vector[i].rt = "00000";
		}
		if (program_vector[i].rd.compare("zero") == 0) {
			program_vector[i].rd = "00000";
		}
		if (program_vector[i].shamt.compare("zero") == 0) {
			program_vector[i].shamt = "00000";
		}
	}
}

void update_data(vector <int> &data_vector) {
	for (int i = 0; i < data_vector.size(); i++) {
		data_vector[i] = (1 << 31) | data_vector[i];
	}
}

void update_address_map(vector <program_data> &program_vector) {
	for (int i = 0; i < program_vector.size(); i++) {
		program_vector[i].address = i;
	}
}

void write_to_mem(vector <int> &data_vector, vector <program_data> &program_vector, vector <int> &address_map) {
	int decimal_address;
	int decimal_data;
	int binary_address;
	int binary_data;
	for (int i = 0; i < program_vector.size(); i++) {
		decimal_data = to_decimal(program_vector[i].opcode);
		binary_data = to_binary(decimal_data, 6).c_str();
		decimal_address = to_decimal(program_vector[i].address);
		binary_address = to_binary(decimal_address, 6).c_str();
		cout << "0x" << binary_address << " = 0x" << binary_data << endl;
	}
	for (int i = 0; i < data_vector.size(); i++) {
		decimal_data = data_vector[i];
		binary_data = to_binary(decimal_data, 32).c_str();
		decimal_address = address_map[i];
		binary_address = to_binary(decimal_address, 6).c_str();
		program_vector[i].binary_data = binary_data;
		cout << "0x" << binary_address << " = 0x" << binary_data << endl;
	}
}

string to_binary(int num, int binary_length) {
	bitset<32> bit(num);
	string binary_num = bit.to_string();
	int difference = 0;
	string binary_fill;
	while (binary_num.length() < binary_length) {
		difference = binary_num.length() - binary_length;
		for (int i = 0; i < difference; i++) {
			binary_fill = "0";
			binary_fill.append(binary_num);
			binary_num = binary_fill;
		}
	}
	return binary_num;
}

int to_decimal(string binary_num) {
	int decimal_num = 0;
	int power = 0;
	for (int i = 0; i < binary_num.length(); i++) {
		int binary_digit = binary_num[i] - '0';
		decimal_num = decimal_num + (binary_digit * pow(2, power));
		power++;
	}
	return decimal_num;
}

bool check_for_register(string word) {
	if (word.compare("$zero") == 0)
		return true;
	if (word.compare("$at") == 0)
		return true;
	if (word.compare("$v0") == 0)
		return true;
	if (word.compare("$v1") == 0)
		return true;
	if (word.compare("$a0") == 0)
		return true;
	if (word.compare("$a1") == 0)
		return true;
	if (word.compare("$a2") == 0)
		return true;
	if (word.compare("$a3") == 0)