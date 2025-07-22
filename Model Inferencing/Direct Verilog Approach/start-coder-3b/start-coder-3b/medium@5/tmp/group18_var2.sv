`timescale 1ns/100ps
module maj (input a, b, c, output y);
//and #(2, 5) (y, a, b, c);
and #(2, 5) (a, b, c);
endmodule`
### Synthesis Results:
![alt text](https://github.com/bahadir0110/Synthesis-Verilog/blob/main/images/maj_modified_synthesis.png)#include <iostream>
#include <fstream>
#include <string>
#include "FunctionCall.hpp"
#include <vector>

using namespace std;

void modify_verilog(string file_name, string function_name, vector<string> function_args)
{
	string var_name;
	string temp;
	string to_replace;
	string replaced_with;
	int pos;
	int counter;

	ifstream file;
	file.open(file_name);
	if (!file.is_open())
	{
		cout << "File does't exsist" << endl;
	}
	else
	{

		//Extract function_name from file_name
		pos = file_name.find("_");
		while (pos!= -1)
		{
			temp += file_name[pos];
			pos += 1;
		}
		function_name += temp;
		function_args.push_back(function_name);

		//Extract function_args from file_name
		temp.clear();
		pos = file_name.find("_");
		pos += 1;
		while (pos!= -1)
		{
			if (file_name[pos] >= '0' && file_name[pos] <= '9')
			{
				temp += file_name[pos];
			}
			else
			{
				break;
			}
			pos += 1;
		}

		//Extract function_name from file_name
		var_name.clear();
		while (pos!= -1)
		{
			var_name += file_name[pos];
			pos += 1;
		}
		var_name += '_';
		var_name += temp;

		//Extract var_name
		//pos = file_name.find(".v");
		//pos = file_name.find("(");
		temp.clear();
		pos = function_name.rfind("(");
		pos += 1;
		while (pos!= -1)
		{
			temp += function_name[pos];
			pos += 1;
		}
		function_name += temp;

		//Extract function_args
		pos = 0;
		while (pos!= -1)
		{
			if (file_name[pos] == ',')
			{
				temp += file_name[pos];
				pos += 1;
				temp += file_name[pos];
				pos += 1;
				function_args.push_back(temp);
				temp.clear();
			}
			else
			{
				temp += file_name[pos];
				pos += 1;
			}
		}

		bool flag = false;
		temp.clear();
		pos = 0;
		pos = file_name.find(".v");
		while (pos!= -1)
		{
			if (file_name[pos] =='' || file_name[pos] == '(' || file_name[pos] =='' || file_name[pos] =='')
			{
				pos += 1;
				continue;
			}
			else
			{
				flag = true;
				break;
			}
		}
		counter = 0;
		while (flag)
		{
			to_replace += file_name[pos];
			pos += 1;
			counter++;
			switch (file_name[pos])
			{
			case'':
			{
				to_replace += file_name[pos];
				pos += 1;
				break;
			}
			case '(':
			{
				break;
			}
			case ')':
			{
				break;
			}
			case ',':
			{
				to_replace += file_name[pos];
				pos += 1;
				break;
			}
			default:
			{
				break;
			}
			}

			if (file_name[pos] =='' || file_name[pos] == '(' || file_name[pos] =='' || file_name[pos] =='' || file_name[pos] == ')' || counter == 31)
			{
				flag = false;
				counter = 0;
				replaced_with += to_replace;
				to_replace.clear();
			}
		}

		//Replace function and arguments to modified version of the function
		//Replace function name
		function_name.clear();
		function_name += var_name;
		temp.clear();
		temp += function_args[0];
		temp += function_args[1];
		temp += function_args[2];
		temp += function_args[3];
		function_name += temp;
		replaced_with += function_name;
		replaced_with += "\n";
		//Replace argument names and argument variables
		for (int i = 4; i < function_args.size(); i++)
		{
			replaced_with += "\t";
			replaced_with += function_args[i];
			replaced_with += ";\n";
		}

		temp.clear();
		to_replace.clear();
		replaced_with.clear();
		//Replace function body with function call
		flag = false;
		counter = 0;
		temp.clear();
		pos = temp.length();
		to_replace = "";
		replaced_with.clear();
		while (pos!= -1)
		{
			if (file_name[pos] =='' || file_name[pos] == '(' || file_name[pos] =='' || file_name[pos] =='')
			{
				pos += 1;
				continue;
			}
			else
			{
				flag = true;
				break;
			}
		}
		counter = 0;
		while (flag)
		{
			to_replace += file_name[pos];
			pos += 1;
			counter++;
			switch (file_name[pos])
			{
			case'':
			{
				to_replace += file_name[pos];
				pos += 1;
				break;
			}
			case '(':
			{
				break;
			}
			case ')':
			{
				break;
			}
			case ',':
			{
				to_replace += file_name[pos];
				pos += 1;
				break;
			}
			default:
			{
				break;
			}
			}

			if (file_name[pos] =='' || file_name[pos] == '(' || file_name[pos] =='' || file_name[pos] =='' || file_name[pos] == ')' || counter == 31)
			{
				flag = false;
				counter = 0;
				replaced_with += to_replace;
				to_replace.clear();
			}
		}
		temp.clear();
		//Replace function call with function name
		temp += function_name;
		replaced_