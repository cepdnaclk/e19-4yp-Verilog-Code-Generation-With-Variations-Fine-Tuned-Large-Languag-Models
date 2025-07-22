```
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    if (S == 2'b00)
        f = w0;
    else if (S == 2'b01)
        f = w1;
    else if (S == 2'b10)
        f = w2;
    else if (S == 2'b11)
        f = w0 | w1;
endmodule
```/Week 05/module_declaration_exercise_2/main.cpp
#include <iostream>
#include "my_sum.h"
#include "my_product.h"

void printSum(int a, int b) {
    int sum;
    sum = my_sum(a, b);
    std::cout << "result: " << sum << std::endl;
}

void printProduct(int a, int b) {
    int prod;
    prod = my_product(a, b);
    std::cout << "result: " << prod << std::endl;
}

int main(int argc, char** argv) {
    printSum(10, 30);
    printProduct(10, 30);
}
/Week 05/module_declaration_exercise_4/include/my_mult.h
#include <verilated.h>

int my_mult(int a, int b, VerilatedClock& clk);
/Week 12/module_declaration_exercise_5/main.cpp
#include <iostream>
#include "my_counter_rtl.h"
#include "verilated.h"

using namespace std;

int main(int argc, char** argv) {
    my_counter_rtl* counter;
    int clk_count, rstn_count;
    bool clk, rstn;
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);
    counter = new my_counter_rtl;
    Verilated::traceEverOn(true);
    counter->trace(cout, 99);
    cout << endl;
    rstn = true;
    while (!Verilated::gotFinish()) {
        clk =!clk;
        rstn =!rstn;
        counter->set_clk(clk);
        counter->set_rstn(rstn);
        counter->eval();
        if (counter->get_clk()) {
            clk_count++;
        }
        if (counter->get_rstn()) {
            rstn_count++;
        }
        cout << "clk: " << counter->get_clk() << "\trstn: " << counter->get_rstn() << "\tlatch_out: " << counter->get_latch_out() << endl;
        if (clk_count == 100) {
            clk_count = 0;
            rstn =!rstn;
            counter->set_rstn(rstn);
        }
    }
    delete counter;
}
/Week 04/module_declaration_exercise_4/include/my_sum.h
int my_sum(int a, int b);
/Week 12/module_declaration_exercise_5/include/my_counter_rtl.h
#include <verilated.h>

class my_counter_rtl : public VerilatedClock {
public:
    my_counter_rtl();
    ~my_counter_rtl();
    void set_clk(bool clk);
    void set_rstn(bool rstn);
    bool get_clk();
    bool get_rstn();
    bool get_latch_out();
    bool do_reset();
private:
    my_counter my_top;
};
/Week 04/module_declaration_exercise_5/include/my_product.h
int my_product(int a, int b);
/Week 04/module_declaration_exercise_3/main.cpp
#include "my_sum.h"
#include "my_product.h"

int main(int argc, char** argv) {
    int a = 10;
    int b = 30;
    int sum, prod;
    sum = my_sum(a, b);
    prod = my_product(a, b);
    std::cout << "sum: " << sum << "\t" << "product: " << prod << std::endl;
}
/Week 05/module_declaration_exercise_4/build/CMakeFiles/my_mult.dir/cmake_clean.cmake
file(REMOVE_RECURSE
  "CMakeFiles/my_mult.dir/src/my_mult.cpp.o"
  "libmy_mult.pdb"
  "libmy_mult.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/my_mult.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
/Week 05/module_declaration_exercise_2/include/my_product.h
int my_product(int a, int b);
/Week 04/module_declaration_exercise_4/include/my_counter.h
class my_counter {
public:
    my_counter();
    my_counter(int a);
    ~my_counter();
    void set_clk(bool clk);
    bool get_clk();
    void set_rstn(bool rstn);
    bool get_rstn();
    bool get_latch_out();
    bool do_reset();
    int get_count();
private:
    int a;
    bool clk;
    bool rstn;
    bool latch_out;
};
/Week 04/module_declaration_exercise_2/build/CMakeFiles/my_sum.dir/cmake_clean.cmake
file(REMOVE_RECURSE
  "CMakeFiles/my_sum.dir/src/my_sum.cpp.o"
  "libmy_sum.pdb"
  "libmy_sum.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/my_sum.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
/Week 05/module_declaration_exercise_5/build/CMakeFiles/my_mult.dir/cmake_clean.cmake
file(REMOVE_RECURSE
  "libmy_mult.a"
)
/Week 12/module_declaration_exercise_5/include/my_counter.h
class my_counter {
public:
    my_counter();
    ~my_counter();
    void set_clk(bool clk);
    void set_reset(bool reset);
    void set_latch_out(bool latch_out);
    bool get_clk();
    bool get_reset();
    bool get_latch_out();
    bool do_reset();
private:
    bool clk;
    bool reset;
    bool latch_out;
};
/Week 05/module_declaration_exercise_4/include/my_mult.h
int my_mult(int a, int b);
/Week 04/module_declaration_