module wire_assign( input in, output out );
    assign out = in;
endmodule
import sys

def check_valid(line):
    return (len(line) == 2) and check_number(line[0]) and check_number(line[1])

def check_number(num):
    return (num.isdigit()) and (int(num) >= 0)


try:
    fd = open(sys.argv[1], 'r')
    # read each line in file, check if they are valid, and increment counts
    count1 = 0
    count2 = 0
    count3 = 0
    for line in fd:
        if check_valid(line.split(' ')):
            if int(line.split(' ')[0]) < int(line.split(' ')[1]):
                count1 += 1
            elif int(line.split(' ')[0]) > int(line.split(' ')[1]):
                count2 += 1
            else:
                count3 += 1
finally:
    fd.close()

print(count1)
print(count2)
print(count3)
#!/usr/bin/env python

import sys
import math
import operator

# Define Class to handle File processing
class FileMgr:
    def __init__(self, file_path):
        self.file_path = file_path

    def open_file(self):
        try:
            self.file = open(self.file_path, 'r')
        except:
            raise Exception("Unable to open: " + self.file_path)

    def read_file(self):
        self.numbers = []
        for line in self.file:
            self.numbers.append(int(line))

    def close_file(self):
        self.file.close()

    def write_file(self, count):
        self.file.write(str(count[0]) + "\n")
        self.file.write(str(count[1]) + "\n")
        self.file.write(str(count[2]) + "\n")

    def __del__(self):
        print("Cleaning up FileMgr")

# Define Class to handle Statistics calculation
class StatMgr:
    def __init__(self, numbers):
        self.numbers = numbers
        self.sum = sum(numbers)
        self.mean = self.sum / len(numbers)

    def variance(self):
        variance = [(x - self.mean)**2 for x in self.numbers]
        return sum(variance) / len(variance)

    def stdev(self):
        return math.sqrt(self.variance())

    def __del__(self):
        print("Cleaning up StatMgr")

# Define Class to handle Statistic output
class OutMgr:
    def __init__(self, output_file):
        self.output_file = output_file

    def write_numbers(self, numbers):
        self.output_file.write(str(numbers[0]) + "\n")
        self.output_file.write(str(numbers[1]) + "\n")
        self.output_file.write(str(numbers[2]))

    def __del__(self):
        print("Cleaning up OutMgr")

def main():
    # Input validation
    if (len(sys.argv)!= 3):
        print("Usage: python stats.py <input_file> <output_file>")
        sys.exit(1)

    print("Processing: " + sys.argv[1])
    print("Output to: " + sys.argv[2])

    # Open file
    input_file = FileMgr(sys.argv[1])
    input_file.open_file()

    # Read file
    input_file.read_file()

    # Create Statistics Manager
    stats = StatMgr(input_file.numbers)

    # Calculate Variance and Standard Deviation
    var = stats.variance()
    std = stats.stdev()

    # Write to Output file
    output_file = FileMgr(sys.argv[2])
    output_file.open_file()
    output_file.write_file((var, std))
    output_file.close_file()

    # Clean up
    input_file.close_file()
    del input_file
    del stats
    del output_file

main()
#!/usr/bin/env python

import sys
import math
import operator

class FileMgr:
    def __init__(self, file_path):
        self.file_path = file_path
        self.numbers = []

    def open_file(self):
        try:
            self.file = open(self.file_path, 'r')
        except:
            raise Exception("Unable to open: " + self.file_path)

    def read_file(self):
        for line in self.file:
            self.numbers.append(int(line))

    def close_file(self):
        self.file.close()

    def write_file(self, count):
        self.file.write(str(count[0]) + "\n")
        self.file.write(str(count[1]) + "\n")
        self.file.write(str(count[2]) + "\n")

    def __del__(self):
        print("Cleaning up FileMgr")

class StatMgr:
    def __init__(self, numbers):
        self.numbers = numbers
        self.sum = sum(numbers)
        self.mean = self.sum / len(numbers)

    def variance(self):
        variance = [(x - self.mean)**2 for x in self.numbers]
        return sum(variance) / len(variance)

    def stdev(self):
        return math.sqrt(self.variance())

    def __del__(self):
        print("Cleaning up StatMgr")

class OutMgr:
    def __init__(self, output_file):
        self.output_file = output_file

    def write_numbers(self, numbers):
        self.output_file.write(str(numbers[0]) + "\n")
        self.output_file.write(str(numbers[1]) + "\n")
        self.output_file.write(str(numbers[2]))

    def __del__(self):
        print("Cleaning up OutMgr")

def main():
    # Input validation
    if (len(sys.argv)!= 3):
        print("Usage: python stats.py <input_file> <output_file>")
        sys.exit(1)

    print("Processing: " + sys.argv[1])
    print("Output to: " + sys.argv[2])

    # Open file
    input_file = FileMgr(sys.argv[1])
    input_file.open_file()

    # Read file
    input_file.read_file()

    # Create Statistics Manager
    stats = StatMgr(input_file.numbers)

    # Calculate Variance and Standard Deviation
    var = stats.variance()
    std = stats.stdev()

    # Write to Output file
    output_file = FileMgr(sys.argv[2])
    output_file.open_file()
    output_file.write_file((var, std))
    output_file.close_file()

    # Clean up
    input_file.close_file()
    del input_file
    del stats
    del output_file

main()
#include <iostream>
#include <string>

using namespace std;

int main(int argc, char* argv[])
{
    if (argc!= 2) {
        cout << "Usage: " << argv[0] << " <number>" << endl;
        return 1;
    }

    cout << "Number: " << argv[1] << endl;

    int num = atoi(argv[1]);
    if (num!= 0) {
        cout << num << " is NOT zero." << endl;
    } else {
        cout << num << " is zero." << endl;
    }

    return 0;
}
from random import randint

fd = open("input/random.txt", "w")

counter = 100
while (counter > 0):
    fd.write(str(randint(1,30)) + "\n")
    counter = counter - 1

fd.close()
#include <iostream>
#include <string>
#include <fstream>

using namespace std;

int main(int argc, char* argv[])
{
    if (argc!= 3) {
        cout << "Usage: " << argv[0] << " <input_file> <output_file>" << endl;
        return 1;
    }

    ifstream in(argv[1]);
    ofstream out(argv[2]);

    if (!in.good()) {
        cout << "Could not open input file: " << argv[1] << endl;
        return 2;
    }
    if (!out.good()) {
        cout << "Could not open output file: " << argv[2] << endl;
        return 3;
    }

    int counter = 0;
    string line;
    while (getline(in, line)) {
        if (counter == 0) {
            counter++;
        } else {
            out << line << endl;
        }
    }

    return