module SchedDelayB;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### New Verilog Code:
module SchedDelayC;
reg a, b;
reg [3:0] a_addr = 2'b00;
reg [3:0] b_addr = 2'b00;
initial
begin
a_addr <= {a_addr[0:3], 4'b0000};
b_addr <= {b_addr[0:3], 4'b0000};
end
always @(b) a = b;
always @(a) b <= a;
endmodule
/2008/s0105.c
/*
 * Copyright 2008 The Khronos Group Inc.
 */

/*
 * SPDX-License-Identifier: Apache-2.0
 */

/**
 * \file
 * \brief XEON Phi: Test of the C++ language.
 *
 * We have to compile this program using the compiler that we use for
 * the other tests. This is done by defining the XEON_PHI_COMPILEPREPROCESSOR
 * macro.
 */
#ifndef XEON_PHI_COMPILEPREPROCESSOR
#define XEON_PHI_COMPILEPREPROCESSOR
#endif
#include "s0000.c"

#include "xstypes.h"
#include "xstypesprivate.hpp"

#include <vector>

void testCPlusPlusStandardVector()
{
	std::vector<int> vs;
	for (int i = 0; i < 10; i++) {
		vs.push_back(i);
	}
	std::for_each(vs.begin(), vs.end(), [](int i) { std::cout << i << std::endl; });
}

void testCPlusPlusString()
{
	std::string s("foo");
	std::cout << s << std::endl;
}

void testCPlusPlusIterator()
{
	std::vector<int> vs;
	for (int i = 0; i < 10; i++) {
		vs.push_back(i);
	}
	std::for_each(vs.begin(), vs.end(), [](int i) { std::cout << i << std::endl; });
}

void testCPlusPlusArray()
{
	int a[] = {1, 2, 3, 4, 5};
	std::cout << "Array:" << std::endl;
	for (int i = 0; i < 5; i++) {
		std::cout << a[i] << std::endl;
	}
}

void testCPlusPlusInitializerList()
{
	std::vector<int> v = {1, 2, 3, 4, 5};
	std::for_each(v.begin(), v.end(), [](int i) { std::cout << i << std::endl; });
}

struct A {
	int data;
	A(int i) : data(i) {};
	static int counter;
	void printData() {
		std::cout << data << std::endl;
	}
};

int A::counter = 0;

void testCPlusPlusStatic()
{
	std::cout << A::counter << std::endl;
	A a(1);
	a.printData();
	A::counter = 5;
	std::cout << A::counter << std::endl;
	a.printData();
	std::cout << a.data << std::endl;
	std::cout << a.data << std::endl;
}

void testCPlusPlusException()
{
	try {
		throw std::string("foo");
		std::cout << __LINE__ << std::endl;
		throw 1;
		std::cout << __LINE__ << std::endl;
	}
	catch(std::string s) {
		std::cout << "std::string" << std::endl;
	}
	catch(int i) {
		std::cout << "int" << std::endl;
	}
	catch(...) {
		std::cout << "other" << std::endl;
	}
}

struct B {
	virtual void print() = 0;
};

struct C : A, B {
	void print() override {
		std::cout << "C" << std::endl;
	}
};

void testCPlusPlusPolymorphism()
{
	A a(0);
	a.printData();
	B *b = new A;
	b->print();
	b->printData();
	C *c = new C;
	c->print();
	c->printData();
}

class D {
	int data;
public:
	D() : data(0) {}
	int getData() { return data; }
	void setData(int i) { data = i; }
};

class E : public D {
	static D d;
	static int c;
public:
	E() : D() { d.setData(c++); }
	int getData() override { return D::getData(); }
};

D E::d;
int E::c = 0;

void testCPlusPlusVirtual()
{
	std::vector<E> v;
	for (int i = 0; i < 10; i++) {
		E e;
		v.push_back(e);
	}
	for (int i = 0; i < 10; i++) {
		std::cout << v[i].getData() << std::endl;
	}
}

void testCPlusPlusNamespace()
{
	using namespace std;
	vector<int> vs;
	for (int i = 0; i < 10; i++) {
		vs.push_back(i);
	}
	for_each(vs.begin(), vs.end(), [](int i) { std::cout << i << std::endl; });
}

void testCPlusPlusOperator()
{
	D& d = E::d;
	d.getData();
}

#pragma pack(1)
typedef struct
{
	int i;
	float f;
	char c;
} sDataType;
#pragma pack()

void testCPlusPlusStructure()
{
	std::vector<sDataType> v;
	for (int i = 0; i < 10; i++) {
		sDataType s;
		s.i = i;
		s.f = i / 2;
		s.c = 'f';
		s.c = 'f';
		v.push_back(s);
	}
	for (int i = 0; i < 10; i++) {
		std::cout << v[i].i << " " << v[i].f << " " << v[i].c << std::endl;
	}
}

void testCPlusPlusNewDelete()
{
	std::vector<D *> v;
	for (int i = 0; i < 10; i++) {
		v.push_back(new D);
	}
	for (int i = 0; i < 10; i++) {
		std::cout << v[i]->getData() << std::endl;
		delete v[i];
	}
}

void testCPlusPlusAuto()
{
	for (int i = 0; i < 10; i++) {
		auto int_ptr = new int(i);
		std::cout << *int_ptr << std::endl;
		delete int_ptr;
	}
}

void testCPlusPlusConst()
{
	const int c = 0;
	std::cout << "c: " << c << std::endl;
	for (int i = 0; i < 10; i++) {
		auto int_ptr = new int(i);
		std::cout << *int_ptr << std::endl;
		delete int_ptr;
	}
}

void testCPlusPlusEnum()
{
	enum class COLOR { red, green, blue };
	std::cout << "red: " << (int) COLOR::red << std::endl;
	std::cout << "green: " << (int) COLOR::green << std::endl;
	std::cout << "blue: " << (int) COLOR::blue << std::endl;
}

void testCPlusPlusClass()
{