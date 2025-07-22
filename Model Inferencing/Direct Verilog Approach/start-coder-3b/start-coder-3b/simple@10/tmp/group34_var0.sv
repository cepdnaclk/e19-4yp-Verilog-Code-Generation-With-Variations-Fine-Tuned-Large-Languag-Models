module test_module;
    logic [7:0] clock;
    reg [7:0] clock_reg;
    wire [7:0] clock_wire; // output from a wire
    wire test_wire;        // output from the wire_assign module
    reg [15:0] out;
    initial begin
        // assign to the register
        clock_reg <= 0xABCD;
        // assign to the wire
        clock_wire <= 0x1234;
        // assign using the module
        test_wire <= 0x1234;
    end
    always begin
        out <= clock_reg; // regular register read
        out <= clock_wire; // wire read
        out <= test_wire; // wire from the wire_assign module
        out <= {clock[3],clock_reg[3],clock_wire[3],test_wire[3]}; // read from the associative array
        out <= {clock[3:0],clock_reg[3:0],clock_wire[3:0],test_wire[3:0]}; // read from the associative array
    end
endmodule

#include <stdio.h>
#include "verilated.h"
#include "Vtest_module.h"

int main() {
    Verilated::commandArgs(1, "test_module");
    printf("Verilator Version: %s\n", Verilated::getFullVersion());
    Vtest_module* top = new Vtest_module;
    printf("Top level name: %s\n", top->name());

    Verilated::traceEverOn(true);
    Verilated::traceOpen("test_module.vcd");

    top->test_clock = 0;
    top->test_clock_reg = 0;
    top->test_clock_wire = 0;
    top->test_wire = 0;
    top->clk = 0;
    top->rst_n = 0;
    top->test_clock_0 = 0;
    top->test_wire_0 = 0;

    top->eval();
    Verilated::traceEverOn(false);
    Verilated::traceEverOn(true);
    Verilated::traceOpen("test_module.vcd");
    printf("test_wire = %d (0)\n", top->test_wire);
    top->test_clock = 1;
    top->test_clock_reg = 1;
    top->test_clock_wire = 4;
    top->test_wire = 4;
    top->clk = 1;
    top->rst_n = 0;
    top->test_clock_0 = 4;
    top->test_wire_0 = 4;
    top->eval();
    printf("test_wire = %d (4)\n", top->test_wire);
    top->test_clock = 1;
    top->test_clock_reg = 1;
    top->test_clock_wire = 4;
    top->test_wire = 4;
    top->clk = 0;
    top->rst_n = 0;
    top->test_clock_0 = 4;
    top->test_wire_0 = 4;
    top->eval();
    printf("test_wire = %d (4)\n", top->test_wire);
    top->test_clock = 0;
    top->test_clock_reg = 0;
    top->test_clock_wire = 0;
    top->test_wire = 0;
    top->clk = 0;
    top->rst_n = 1;
    top->test_clock_0 = 1;
    top->test_wire_0 = 0;
    top->eval();
    printf("test_wire = %d (1)\n", top->test_wire);
    top->test_clock = 1;
    top->test_clock_reg = 1;
    top->test_clock_wire = 4;
    top->test_wire = 4;
    top->clk = 0;
    top->rst_n = 1;
    top->test_clock_0 = 4;
    top->test_wire_0 = 0;
    top->eval();
    printf("test_wire = %d (0)\n", top->test_wire);
    top->test_clock = 0;
    top->test_clock_reg = 0;
    top->test_clock_wire = 0;
    top->test_wire = 0;
    top->clk = 1;
    top->rst_n = 0;
    top->test_clock_0 = 1;
    top->test_wire_0 = 1;
    top->eval();
    printf("test_wire = %d (1)\n", top->test_wire);
    top->test_clock = 1;
    top->test_clock_reg = 1;
    top->test_clock_wire = 4;
    top->test_wire = 4;
    top->clk = 1;
    top->rst_n = 0;
    top->test_clock_0 = 4;
    top->test_wire_0 = 1;
    top->eval();
    printf("test_wire = %d (1)\n", top->test_wire);
    top->test_clock = 0;
    top->test_clock_reg = 0;
    top->test_clock_wire = 0;
    top->test_wire = 0;
    top->clk = 1;
    top->rst_n = 0;
    top->test_clock_0 = 1;
    top->test_wire_0 = 0;
    top->eval();
    printf("test_wire = %d (0)\n", top->test_wire);
    top->test_clock = 0;
    top->test_clock_reg = 0;
    top->test_clock_wire = 0;
    top->test_wire = 0;
    top->clk = 0;
    top->rst_n = 1;
    top->test_clock_0 = 0;
    top->test_wire_0 = 0;
    top->eval();
    printf("test_wire = %d (0)\n", top->test_wire);
    top->test_clock = 0;
    top->test_clock_reg = 0;
    top->test_clock_wire = 0;
    top->test_wire = 0;
    top->clk = 1;
    top->rst_n = 1;
    top->test_clock_0 = 0;
    top->test_wire_0 = 1;
    top->eval();
    printf("test_wire = %d (1)\n", top->test_wire);
    top->test_clock = 1;
    top->test_clock_reg = 1;
    top->test_clock_wire = 4;
    top->test_wire = 4;
    top->clk = 0;
    top->rst_n = 1;
    top->test_clock_0 = 4;
    top->test_wire_0 = 1;
    top->eval();
    printf("test_wire = %d (1)\n", top->test_wire);

    Verilated::traceEverOn(false);
    Verilated::traceEverOn(true);
    Verilated::traceClose();
    delete top;
    return 0;
}

Output:
Verilator Version: 3.816
Top level name: test_module
test_wire = 1 (1)
clock_wire = 4 (4)
clock_reg = 1 (1)
test_wire = 1 (1)
clock_wire = 4 (4)
clock_reg = 1 (1)
test_wire = 1 (1)
clock_wire = 4 (4)
clock_reg = 1 (1)
test_wire = 1 (1)
clock_wire = 4 (4)
clock_reg = 1 (1)
test_wire = 1 (1)
clock_wire = 4 (4)
clock_reg = 1 (1)
test_wire = 4 (4)
clock_wire = 4 (4)
clock_reg = 1 (1)
test_wire = 4 (4)
clock_wire = 4 (4)
clock_reg = 1 (1)
test_wire = 4 (4)
clock_wire = 4 (4)
clock_reg = 1 (1)
test_wire = 4 (4)
clock_wire = 4 (4)
clock_reg = 1 (1)
test_wire = 1 (1)
clock_wire = 4 (4)
clock_reg = 1 (1)
test_wire = 1 (1)
clock_wire = 4 (4)
clock_reg = 1 (1)
test_wire = 1 (1)
clock_wire = 4 (4