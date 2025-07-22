module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

struct DataComponentStruct;
DataComponentStruct dcs;

initial begin
dcs.rand = $urandom;
end

endmodule
### Test Case:
Test case will be created by creating a test bench and simulating it, with the modified data component struct. Test case will test the randomization of the rand member of the struct.
### Results:
The results of the simulation can be seen in the attached file.
Output of the simulation:
![image](https://user-images.githubusercontent.com/43009620/65621978-1bb8ed80-df76-11e9-80ab-0c61d196509b.png)
/Projects/Project1/README.md
This project uses the MIPS architecture, and includes instructions for the following:
 * ADD
 * SUB
 * MULT
 * DIV
 * BEQ
 * BNE
 * JR
 * J
 * LW
 * SW

The programs for these instructions are in the.s file, and the output of these programs is printed via the MIPS terminal.
/Projects/Project4/README.md
This project will contain the following:
 * C++ code that will be stored in the cpp file
 * Verilog code that will be stored in the v file
 * The test bench for testing, stored in the v file
 * The module that will be compiled into the test bench, stored in the cpp file
 * A Makefile


# How to run the Project:
1. Clone the repository on to your machine
2. Create a new folder on your machine called Simulation
3. Go to the Simulation folder
4. Create a new folder called C++Codes
5. Inside C++, create a new file called cppCode.cpp
6. Copy the verilog code from the verilog file into the cpp file
7. In the cpp code, add the following:

```c
#include <iostream>
#include <string>

using namespace std;

int main(int argc, char *argv[]){
	...
}
```

8. In the cpp file, compile the cpp code with the following commands:

```bash
cd C++Codes
g++ cppCode.cpp
```

9. Inside the Simulation folder, run the following command:

```bash
make
```

10. To run the simulation, run the following command:

```bash
make run
```

11. Alternatively, you can create a makefile that runs the program for you, with the following commands:

```bash
make clean
make all
make run
```

10. To view the output from the simulation, open the ouput.txt file
/Projects/Project4/simulation/C++Codes/cppCode.cpp
#include <iostream>
#include <string>
#include "cpp_test.h"

using namespace std;

int main(int argc, char *argv[]){
	int arr[20];
	int count = 0;

	while(true){
		cout << "\nPlease input a number: ";
		cin >> arr[count];

		if(arr[count] >= 33 && arr[count] <= 126){
			count++;
		}else{
			break;
		}
	}

	cout << "\nThe numbers in the array are: ";
	for(int i = 0; i < count; i++){
		cout << arr[i] << " ";
	}

	std::cout << std::endl;

	return 0;
}
/Projects/Project4/simulation/C++Codes/cpp_test.h
#ifndef CPP_TEST_H
#define CPP_TEST_H

int arr[20];
int count = 0;

while(true){
	cout << "\nPlease input a number: ";
	cin >> arr[count];

	if(arr[count] >= 33 && arr[count] <= 126){
		count++;
	}else{
		break;
	}
}

cout << "\nThe numbers in the array are: ";
for(int i = 0; i < count; i++){
	cout << arr[i] << " ";
}

std::cout << std::endl;

#endif
/Projects/Project4/simulation/sim.sh
#!/bin/bash
cd C++Codes
g++ cppCode.cpp
cd..
make
cd simulation
make run
/Projects/Project3/README.md
This project will contain the following:
 * C++ code that will be stored in the cpp file
 * Verilog code that will be stored in the v file
 * The test bench for testing, stored in the v file
 * The module that will be compiled into the test bench, stored in the cpp file
 * A Makefile

# How to run the Project:
1. Clone the repository on to your machine
2. Create a new folder on your machine called Simulation
3. Go to the Simulation folder
4. Create a new folder called C++Codes
5. Inside C++, create a new file called cppCode.cpp
6. Copy the verilog code from the verilog file into the cpp file
7. In the cpp code, add the following:
```c
#include <string>

int main(int argc, char *argv[]){
	std::string name;
	std::cout << "\nPlease enter your name: ";
	std::cin >> name;
	
	std::cout << "\nHello " << name << "!" << std::endl;
	
	return 0;
}
```
8. In the cpp file, compile the cpp code with the following commands:
```bash
cd C++Codes
g++ cppCode.cpp
```
9. Inside the Simulation folder, run the following command:
```bash
make
```
10. To run the simulation, run the following command:
```bash
make run
```
11. Alternatively, you can create a makefile that runs the program for you, with the following commands:
```bash
make clean
make all
make run
```
10. To view the output from the simulation, open the ouput.txt file
/Projects/Project4/simulation/cpp_test.h
#ifndef CPP_TEST_H
#define CPP_TEST_H

int arr[20];
int count = 0;

while(true){
	cout << "\nPlease input a number: ";
	cin >> arr[count];

	if(arr[count] >= 33 && arr[count] <= 126){
		count++;
	}else{
		break;
	}
}

cout << "\nThe numbers in the array are: ";
for(int i = 0; i < count; i++){
	cout << arr[i] << " ";
}

std::cout << std::endl;

#endif
/Projects/Project4/simulation/Makefile
CXX=g++
CXXFLAGS=-Wall -O -g

CPP=cpp_test.cpp

all:
	$(CXX) $(CXXFLAGS) $(CPP)

run:
	./a.out

clean:
	rm -f *.out