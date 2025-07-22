module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; logic co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>
#include <cstring>
using namespace std;

int main()
{
	string s;
	string line;
	string line_new;
	ifstream file1("testbench.txt");
	ofstream file2;
	file2.open("testbench_new.txt", ios::out | ios::trunc);
	if (file1.is_open())
	{
		while (getline(file1, line))
		{
			line_new += line[0];
			for (int i = 1; i < line.size(); i++)
			{
				if (line[i] =='' && line[i - 1]!='')
				{
					line_new += line[i];
				}
				else
					line_new += line[i];
			}
			line_new += '\n';
		}
		
		file2 << line_new;
		file1.close();
		file2.close();
	}
	else cout << "Unable to open file";
	return 0;
}