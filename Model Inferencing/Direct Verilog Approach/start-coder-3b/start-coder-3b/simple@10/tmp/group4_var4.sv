module testbench();
struct random_struct {
rand int x;
};
generate data;
process data;
endmodule
### Randomization:
random_struct s;
s.x = rand-expr;
### Result:
Randomizing 'x' in 'testbench'
testbench : 2017-12-14 21:31:15 : PLIVER: WARNING: 1:23:8: Randomization "rand-expr" is not a legal value for field "x" in random_struct.
### Expected Behavior:
The test should pass./**
* @file
*
* @author 
* @author 
*/

#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include "common.h"
#include "parser.h"
#include "interpreter.h"
#include "interpreter_error_messages.h"
#include "lexer.h"

using namespace std;

/**
* Function: main
* Usage:./pliver -c <filename> -c <filename>
*       ./pliver <filename>
*
* @details Main function for pliver. It takes in input files or strings and parses them
*          using the parser. Lexing is done after the parsing is done. We will use the
*          Interpreter class to parse and execute the input.
*
* @param argc   The number of command-line arguments.
* @param argv   The array of command-line arguments.
* @return 0, unless the lexer or parser encounter an error (in which case it will return 1).
*/
int main(int argc, char* argv[]) {
	Interpreter ip;
	PliverErrorMessages pe;
	vector<string> filenames;

	if (argc == 1) {
		cout << "Usage:./pliver -c <filename> -c <filename>./pliver <filename>" << endl;
		return 0;
	}

	bool error = false;
	for (int i = 1; i < argc; i++) {
		if (string(argv[i]) == "-c") {
			if (i+1 < argc) {
				if (PliverFileExists(argv[i+1])) {
					filenames.push_back(argv[i+1]);
					i++;
				} else {
					cout << "File does not exist: " << argv[i+1] << "\n" << endl;
					return 1;
				}
			} else {
				error = true;
				break;
			}
		} else {
			if (PliverFileExists(argv[i])) {
				filenames.push_back(argv[i]);
			} else {
				cout << "File does not exist: " << argv[i] << "\n" << endl;
				return 1;
			}
		}
	}

	if (error) {
		cout << "Usage:./pliver -c <filename> -c <filename>./pliver <filename>" << endl;
		return 1;
	}

	for (string filename: filenames) {
		ifstream file(filename);
		string line;
		while (getline(file, line)) {
			if (line.empty()) continue;
			vector<PliverToken> tokens = Lexer::getTokens(line);
			if (tokens.empty()) continue;
			Parser parser;
			if (parser.error) {
				return 1;
			}
			Node node = parser.parse(tokens);
			if (node.type == "error") {
				string msg = node.message + "\n";
				cout << msg;
				return 1;
			}
			try {
				ip.execute(node, filename);
			} catch(InterpreterException &ex) {
				cout << ex.what() << endl;
				return 1;
			}
		}
	}
	return 0;
}/**
* @file
*
* @author 
* @author 
*/

#include <string>
#include <vector>
#include <iostream>
#include <fstream>

#include "node.h"
#include "interpreter.h"
#include "interpreter_error_messages.h"

using namespace std;

/** @brief Executes the given node.
 *
 *  @param node The node to execute.
 *
 *  @details Executes the given node. Depending on the type of node,
 *  the function will be one of:
 *  - execute() will be called on each of the children of the node.
 *  - execute() will be called on the statement in the declaration.
 *  - execute() will be called on each of the children of the node.
 */
void Interpreter::execute(Node& node, string fileName) {
	if (node.type == "error") {
		return;
	}
	else if (node.type == "module_declaration") {
		execute(node.statement, fileName);
	}
	else if (node.type == "declaration") {
		execute(node.statement, fileName);
	}
	else if (node.type == "instance_declaration") {
		execute(node.statement, fileName);
	}
	else if (node.type == "module_instantiation") {
		execute(node.statement, fileName);
	}
	else if (node.type == "instance_instantiation") {
		execute(node.statement, fileName);
	}
	else if (node.type == "assign_statement") {
		execute(node.statement, fileName);
	}
	else if (node.type == "if_statement") {
		execute(node.statement, fileName);
	}
	else if (node.type == "if_else_statement") {
		execute(node.statement, fileName);
	}
	else if (node.type == "while_statement") {
		execute(node.statement, fileName);
	}
	else if (node.type == "generate_statement") {
		execute(node.statement, fileName);
	}
	else if (node.type == "generate_case_statement") {
		execute(node.statement, fileName);
	}
	else if (node.type == "process") {
		execute(node.statement, fileName);
	}
	else if (node.type == "task") {
		execute(node.statement, fileName);
	}
	else if (node.type == "process_declaration") {
		execute(node.statement, fileName);
	}
	else if (node.type == "task_declaration") {
		execute(node.statement, fileName);
	}
	else if (node.type == "while_statement") {
		execute(node.statement, fileName);
	}
	else if (node.type == "for_statement") {
		execute(node.statement, fileName);
	}
	else if (node.type == "case_statement") {
		execute(node.statement, fileName);
	}
	else if (node.type == "rand") {
		execute(node.statement, fileName);
	}
	else if (node.type == "randc") {
		execute(node.statement, fileName);
	}
	else if (node.type == "randomize") {
		execute(node.statement, fileName);
	}
	else if (node.type == "module_declaration_block") {
		for (Node n : node.children) {
			execute(n, fileName);
		}
	}
	else if (node.type == "declaration_block") {
		for (Node n : node.children) {
			execute(n, fileName);
		}
	}
	else if (node.type == "statement_block") {
		for (Node n : node.children) {
			execute(n, fileName);
		}
	}
	else if (node.type == "statement") {

	}
	else if (node.children.size() == 0) {
		if (node.type == "assign_statement") {
			string lhs = node.l_expression.token;
			string rhs = node.r_expression.token;

			// Make sure the lhs of an assignment is a variable.
			if (lhs!= "$") {
				if (!isVariable(lhs)) {
					throw InterpreterException(PliverErrorMessages::NOT_A_VARIABLE);
				}
			}

			// If the rhs variable is not a variable, we cannot execute the assignment statement
			// to assign a value to it.
			if (!isVariable(rhs) &&!isRandom(rhs)) {
				throw InterpreterException(Pliver