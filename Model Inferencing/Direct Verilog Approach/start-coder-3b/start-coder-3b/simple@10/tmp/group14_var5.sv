For example, the code is as follows:
module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h1; b=4'h2; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
/Lab4/Project/Makefile
top?= top_alu1
tb?= $(top)_tb

VICFLAGS=-O4

ifdef VICFLAGS
CXXFLAGS=$(VICFLAGS)
else
CXXFLAGS=-O0 -ggdb
endif

SRCS=$(wildcard *.cpp *.v)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $<

%.o: %.v
	vlog $(VICFLAGS) $<

all: $(tb).bin

$(tb).bin: $(tb).o $(top).o
	$(CXX) -o $@ $^

$(top).o: $(top).cpp

%.obj: %.v
	vlog $(VICFLAGS) $<

%.obj: %.cpp
	$(CXX) $(CXXFLAGS) -c $<

clean:
	rm -f *.o $(tb).bin *~ $(top).o

.PHONY: all clean
/Lab1/Project2/test-alu1.cpp
#include <iostream>
#include <string>
#include <climits>

#include "alu1.h"

int main(int argc, char** argv) {
  alu1 alu1;
  alu1.set_cci(1);
  std::cout << "cci: " << std::hex << alu1.get_cci() << std::endl;
  alu1.set_f(0);
  std::cout << "f: " << std::hex << alu1.get_f() << std::endl;
  alu1.set_a(UINT32_MAX);
  std::cout << "a: " << std::hex << alu1.get_a() << std::endl;
  alu1.set_b(UINT32_MAX);
  std::cout << "b: " << std::hex << alu1.get_b() << std::endl;
  alu1.propagate();
  std::cout << std::endl;
  std::cout << "d: " << std::hex << alu1.get_d() << std::endl;
  std::cout << "ci: " << std::hex << alu1.get_ci() << std::endl;
  std::cout << "co: " << std::hex << alu1.get_co() << std::endl;
  alu1.set_cci(0);
  alu1.propagate();
  std::cout << "cci: " << std::hex << alu1.get_cci() << std::endl;
  std::cout << "f: " << std::hex << alu1.get_f() << std::endl;
  alu1.set_a(UINT32_MAX);
  alu1.set_b(UINT32_MAX);
  alu1.propagate();
  std::cout << std::endl;
  std::cout << "d: " << std::hex << alu1.get_d() << std::endl;
  std::cout << "ci: " << std::hex << alu1.get_ci() << std::endl;
  std::cout << "co: " << std::hex << alu1.get_co() << std::endl;
  std::cout << std::endl;
  alu1.set_cci(1);
  alu1.set_a(UINT32_MAX);
  alu1.set_b(UINT32_MAX);
  alu1.propagate();
  std::cout << std::endl;
  std::cout << "d: " << std::hex << alu1.get_d() << std::endl;
  std::cout << "ci: " << std::hex << alu1.get_ci() << std::endl;
  std::cout << "co: " << std::hex << alu1.get_co() << std::endl;
  alu1.set_cci(1);
  alu1.set_a(0x1234);
  alu1.set_b(0x5678);
  alu1.propagate();
  std::cout << std::endl;
  std::cout << "d: " << std::hex << alu1.get_d() << std::endl;
  std::cout << "ci: " << std::hex << alu1.get_ci() << std::endl;
  std::cout << "co: " << std::hex << alu1.get_co() << std::endl;
  alu1.set_cci(0);
  alu1.propagate();
  std::cout << "cci: " << std::hex << alu1.get_cci() << std::endl;
  std::cout << "f: " << std::hex << alu1.get_f() << std::endl;
  alu1.set_a(0x1234);
  alu1.set_b(0x5678);
  alu1.set_cci(1);
  alu1.set_f(1);
  alu1.propagate();
  std::cout << std::endl;
  std::cout << "d: " << std::hex << alu1.get_d() << std::endl;
  std::cout << "ci: " << std::hex << alu1.get_ci() << std::endl;
  std::cout << "co: " << std::hex << alu1.get_co() << std::endl;
  alu1.set_cci(0);
  alu1.set_f(1);
  alu1.set_a(0x1234);
  alu1.set_b(0x5678);
  alu1.set_cci(1);
  alu1.propagate();
  std::cout << "cci: " << std::hex << alu1.get_cci() << std::endl;
  std::cout << "f: " << std::hex << alu1.get_f() << std::endl;
  alu1.set_a(0x1234);
  alu1.set_b(0x5678);
  alu1.set_cci(1);
  alu1.set_f(2);
  alu1.propagate();
  std::cout << std::endl;
  std::cout << "d: " << std::hex << alu1.get_d() << std::endl;
  std::cout << "ci: " << std::hex << alu1.get_ci() << std::endl;
  std::cout << "co: " << std::hex << alu1.get_co() << std::endl;
  alu1.set_cci(0);
  alu1.set_f(2);
  alu1.set_a(0x1234);
  alu1.set_b(0x5678);
  alu1.set_cci(1);
  alu1.propagate();
  std::cout << "cci: " << std::hex << alu1.get_cci() << std::endl;
  std::cout << "f: " << std::hex << alu1.get_f() << std::endl;
  return 0;
}
/Lab3/Project/test_alu2.cpp
#include <iostream>
#include <string>
#include <climits>
#include <cstdlib>

#include "alu2.h"

int main(int argc, char** argv) {
  alu2 alu2;
  alu2.set_cci(1);
  std::cout << "cci: " << std::hex << alu2.get_cci() << std::endl;
  alu2.set_f(0);
  std::cout << "f: " << std::hex << alu2.get_f() << std::endl;
  alu2.set_a(UINT32_MAX);
  std::cout << "a: " << std::hex << alu2.get_a() << std::