module Problem1(input [3:0] a, b, output [3:0] sum);
  logic [3:0] di;
  logic clk;
  assign sum = di;
endmodule
### Run Code:
```
%systemverilog -o Problem1 -Wno-fatal
%systemverilog -o Problem1
```
### Run Results:
```
%systemverilog -o Problem1 -Wno-fatal
%systemverilog -o Problem1
```
#!/bin/bash

echo "---------------------------"
echo "---------------------------"
echo "Running all test cases in:"
echo "$PWD"
echo "---------------------------"
echo "---------------------------"

# Check if sv2v is installed
if [ -x "$(command -v sv2v)" ]; then
  echo "sv2v is executable"
else
  echo "sv2v is not installed, please install sv2v"
  echo "https://github.com/ft4/sv2v"
  exit 1
fi

testCases=("Problem1" "Problem2" "Problem3" "Problem4" "Problem5")

for testCase in "${testCases[@]}"
do
  testDir="${testCase}"
  if [ -d "${testDir}" ]; then
    echo "---------------------------"
    echo "---------------------------"
    echo "Running test case: ${testCase}"
    echo "---------------------------"
    echo "---------------------------"
  else
    echo "ERROR: directory '${testCase}' does not exist"
    exit 1
  fi

  # Create sv output directory if it does not exist
  if [! -d "${testCase}"/sv ]; then
    mkdir "${testCase}"/sv
  fi

  # Create v output directory if it does not exist
  if [! -d "${testCase}"/v ]; then
    mkdir "${testCase}"/v
  fi

  # Convert verilog to sv
  sv2v -no-timescale -sv -tverilog "${testCase}"/*.v -v2005 -o "${testCase}"/sv/main.sv

  # Run simulation
  vvp -t "100ps" -M "${testCase}"/sv "${testCase}"/sv/main.v
done
#include <string>

namespace test {
namespace verilog {

void func(std::string s) {
  printf("Hello from C++, s is %s\n", s);
}

}  // namespace verilog
}  // namespace test#include <unistd.h>
#include <string>

#include "verilog_util.hpp"

namespace test {
namespace verilog {

void func(std::string s) {
  puts(s);
}

int main() {
  std::string s = verilog::util::readFile("./test/verilog/problem3/main.v");
  if (!s.empty()) {
    func(s);
  } else {
    perror("Failed to read file:./test/verilog/problem3/main.v");
    return 1;
  }

  return 0;
}

}  // namespace verilog
}  // namespace test
#include <unistd.h>
#include <string>

#include "verilog_util.hpp"

namespace test {
namespace verilog {

void func(std::string s) {
  puts(s);
}

int main() {
  std::string s = verilog::util::readFile("./test/verilog/problem2/main.v");
  if (!s.empty()) {
    func(s);
  } else {
    perror("Failed to read file:./test/verilog/problem2/main.v");
    return 1;
  }

  return 0;
}

}  // namespace verilog
}  // namespace test
#include <unistd.h>
#include <string>

#include "verilog_util.hpp"

namespace test {
namespace verilog {
namespace util {

void func(std::string s) {
  puts(s);
}

}  // namespace util
}  // namespace verilog
}  // namespace test
#include <unistd.h>
#include <string>

#include "verilog_util.hpp"

namespace test {
namespace verilog {
namespace util {

std::string readFile(std::string fileName) {
  std::string fileStr;

  if (fileName.empty()) return "";

  FILE *fp = fopen(fileName.c_str(), "r");
  if (NULL == fp) {
    perror("Failed to open file");
    return "";
  } else {
    char buffer[4096];
    buffer[sizeof(buffer) - 1] = '\0';
    while (fgets(buffer, sizeof(buffer) - 1, fp)) {
      fileStr += buffer;
    }
    fclose(fp);
  }
  return fileStr;
}

}  // namespace util
}  // namespace verilog
}  // namespace test
#
# File:   CMakeLists.txt
# Author: 
#

# Define the project name
cmake_minimum_required(VERSION 3.0)
project(VerilogTests)

# Define the language for this project
set(CMAKE_CXX_STANDARD 17)

# Add the subdirectories
add_subdirectory("./test/verilog/problem1")
add_subdirectory("./test/verilog/problem2")
add_subdirectory("./test/verilog/problem3")
add_subdirectory("./test/verilog/problem4")
add_subdirectory("./test/verilog/problem5")