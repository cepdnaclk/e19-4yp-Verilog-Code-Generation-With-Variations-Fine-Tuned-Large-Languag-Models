module clock_gen_forever; // Renamed module for clarity
  reg clk, en;
  // Generate clock using forever loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    forever #2 clk = ~clk; // Toggle clock every 2 time units forever
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
    $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
  end
endmodule
```

## References
* Verilog HDL Programming by 
#include "mystdlib.h"
long fibonacci(int n)
{
    int res = 0;
    int a = 0;
    int b = 1;
    if(n==0)
    {
        res = a;
    }
    else if(n==1)
    {
        res = b;
    }
    else
    {
        for(int i=2;i<=n;i++)
        {
            res = a+b;
            a = b;
            b = res;
        }
    }
    return res;
}## Introduction
SystemC is an open-source language and a formal verification methodology developed by the IEEE and an industry-wide simulation support infrastructure (ISS) called SystemC. 

## Why SystemC?
SystemC has been designed to build a new methodology of high-level hardware design and verification.

## SystemC Features
* **Extensible**, users can create their own C++ classes that encapsulate data-structures, and then pass or receive them as parameters to SystemC's built-in procedures.
* **Modular**, the language is divided into separate units of computation called _modules_ that can be composed in a variety of ways to produce large-scale simulations.
* **Object-oriented**, provides full-featured classes to represent data-structures, processes, and functions.
* **Flexible**, uses C++ as a primary design language, and is interoperable through the use of a _runtime system_ that interprets C++ code.
* **Low-level**, offers a C++-like syntax that runs faster than conventional C++ and lets you program a large-scale simulation without going through the formal verification process.
* **Simulation**, allows you to simulate and verify your designs using the same simulation language to run both hardware and software simulators.

## References
* [SystemC System-Level Design Language](https://www.csee.umbc.edu/courses/486/systemc/language/book.html) by 
#include <iostream>
#include <string>
 
using namespace std;

// base class
class Person
{
  public:
    // constructor
    Person(std::string name, int age) : m_Name(name), m_Age(age) {}
    // destructor
    ~Person() {}
 
    // get and set methods
    std::string getName(void) { return m_Name; }
    void setName(std::string name) { m_Name = name; }
    int getAge(void) { return m_Age; }
    void setAge(int age) { m_Age = age; }
 
  protected:
    // attributes
    std::string m_Name;
    int m_Age;
};
 
// derived class
class Employee : public Person
{
  public:
    // constructor
    Employee(std::string name, int age, std::string dept, double salary) : Person(name, age), m_Dept(dept), m_Salary(salary) {}
 
    // get and set methods
    std::string getDept(void) { return m_Dept; }
    void setDept(std::string dept) { m_Dept = dept; }
    double getSalary(void) { return m_Salary; }
    void setSalary(double salary) { m_Salary = salary; }
 
  private:
    // attributes
    std::string m_Dept;
    double m_Salary;
};
 
int main()
{
    Employee e1("David", 35, "Marketing", 60000);
 
    cout << "Dept. = " << e1.getDept() << endl;
    cout << "Salary = " << e1.getSalary() << endl;
 
    // Derived class can access the base class public members
    cout << "Name = " << e1.getName() << endl;
    cout << "Age = " << e1.getAge() << endl;
 
    return 0;
}#include <stdio.h>

int main()
{
    int iLoop;

    for (iLoop = 0; iLoop < 10; iLoop++) {
        if (iLoop == 5) {
            continue;
        }
        printf("Loop #%d\n", iLoop);
    }

    return 0;
}#include <stdio.h>

int main()
{
    int iLoop = 0;

    for (iLoop = 0; iLoop < 10; iLoop++) {
        if (iLoop == 5) {
            break;
        }
        printf("Loop #%d\n", iLoop);
    }

    return 0;
}## Introduction
Verilog HDL is a Hardware Description Language that is used by digital signal processors or custom integrated circuits (IC) to describe and simulate the behavior of digital circuits.

## Verilog Architecture
![verilog-architecture](./images/verilog-architecture.png)

## References
* [Verilog HDL Programming](https://www.coursera.org/learn/digital-logic-design) by Imperial College London
#include "mystdlib.h"
long fibonacci(int n)
{
    int res = 0;
    int a = 0;
    int b = 1;
    if(n==0)
    {
        res = a;
    }
    else if(n==1)
    {
        res = b;
    }
    else
    {
        for(int i=2;i<=n;i++)
        {
            res = a+b;
            a = b;
            b = res;
        }
    }
    return res;
}## Introduction
This project is aimed at creating an embedded system that can run a simple program.

## Program Files
* [main.c](./src/main.c)
* [mystdlib.h](./src/mystdlib.h)
* [fibonacci.c](./src/fibonacci.c)
* [Makefile](./src/Makefile)

## Build
```bash
$ make
```

## Use a Makefile to Compile the Program
```makefile
# Makefile
# Compile with -std=c89
# Run with./a.out

CC=gcc
CFLAGS=-Wall -std=c89

a.out: main.o fibonacci.o
	$(CC) $(CFLAGS) -o a.out main.o fibonacci.o

test: a.out
	@echo "Running the program..."
	./a.out

main.o: main.c mystdlib.h
	$(CC) $(CFLAGS) -c main.c -o main.o

fibonacci.o: fibonacci.c mystdlib.h
	$(CC) $(CFLAGS) -c fibonacci.c -o fibonacci.o

clean:
	rm -f *.o a.out
	rm -f *.o build/*
	echo "Cleaned up!"
```## Introduction
This project is aimed at creating a basic operating system that can run a simple program.

## References
* [Writing a Basic Operating System](https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf) by 
#include <stdio.h>

int main()
{
    printf("Hello, world!\n");

    return 0;
}## Introduction
A Verilog module is a program unit that contains a set of signals and statements.

## Declaring a Verilog Module
```verilog
module m1(input i, output o);
  // Declare module statement, followed by all module signals and statements
  reg data; // Local register declaration
  always @* begin // Declare always block to process all signals
    data = i; // Assign values to module signals
  end
endmodule
```

## Verilog Module Properties
* __interface__ - A Verilog module is a set of signals and statements that communicate with other modules in a system
* __local__ - A verilog module is contained within a module

## Properties of a Verilog Module
* **Naming** - A module must be named on the first line of the module
* **Syntax** - Follows the following syntax:
  * `module` followed by module name (no spaces)
  * `(` followed by module input and output signals
  * `)` followed by module local signals and statements
  * `endmodule`
* **Input** - A module input signal is signaled by an input keyword followed by a signal name
* **Output** - A module output signal is signaled by an output keyword followed by