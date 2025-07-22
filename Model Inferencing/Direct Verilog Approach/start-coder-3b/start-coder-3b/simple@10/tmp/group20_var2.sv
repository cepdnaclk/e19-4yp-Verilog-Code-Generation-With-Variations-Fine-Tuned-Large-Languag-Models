module latch (input d, c, output reg q, q_b );
always begin
wait ( c );
end
endmodule
#include <iostream>
#include <fstream>
#include <sstream>
#include <map>
#include <vector>
#include <string>

using namespace std;

struct Instruction{
  string opcode;
  int operand;
};

int main(int argc, char **argv){
  if(argc!= 2){
    cout << "Usage: " << argv[0] << " <input file name>" << endl;
    return 1;
  }

  string line;
  string file_name = argv[1];
  ifstream input;
  input.open(file_name);
  
  map<string, int> symbol_table;
  int locctr = 0;
  int start_locctr = 0;
  bool symbol_found = 0;
  int program_size = 0;
  int opcode_index = 0;
  
  while(getline(input,line)){
    istringstream is(line);
    
    int opcode_index = 4;
    Instruction instruction;
    instruction.opcode = "";
    instruction.operand = 0;
    
    while(is.good() && opcode_index!= 0){
      string token;
      is >> token;
      if(token == ".org"){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ".fill"){
	is >> locctr;
	locctr = stoi(token);
	is >> program_size;
	program_size = stoi(program_size);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> program_size;
	program_size = stoi(program_size);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> program_size;
	program_size = stoi(program_size);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol_found = 0;
      }
      else if(token == ""){
	is >> locctr;
	locctr = stoi(token);
	symbol