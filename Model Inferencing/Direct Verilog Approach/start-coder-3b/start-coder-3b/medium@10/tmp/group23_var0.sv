module CPU (output Vout, input[7:0] Ibus, input[2:0] Adr, input Clk, Read);
RAM Dmem (Ibus, Adr, Clk, Read, Obus);
RAM Imem (Ibus, Adr, Clk, Read, Obus);
reg[7:0] VoutReg;
assign #1 Vout = VoutReg;
assign #1 Adr = Obus;
always @(RISING_EDGE Clk) begin:
    if (Adr==8'd0) begin:
        VoutReg = 7'd0;
    end
    else if (Adr==8'd8) begin:
        VoutReg = 7'd1;
    end
    else if (Adr==8'd32) begin:
        VoutReg = 7'd4;
    end
    else begin:
        VoutReg = 7'd5;
    end
end: endmodule
/CPU/CPU.cpp
#include "CPU.hpp"
#include <iostream>
using namespace std;

CPU::CPU(int memory_size)
{
    Dmem = new RAM(memory_size / 2);
    Imem = new RAM(memory_size / 2);
}
RAM *CPU::Dmem;
RAM *CPU::Imem;

void CPU::execute_one_instruction()
{
    Dmem->execute_one_instruction(Adr, Vout, Clk, Read);

    Imem->execute_one_instruction(Adr, Vout, Clk, Read);
}

void CPU::execute_one_instruction_with_register_address()
{
    Dmem->execute_one_instruction_with_register_address(Adr, Vout, Clk, Read);

    Imem->execute_one_instruction_with_register_address(Adr, Vout, Clk, Read);
}

void CPU::execut1)
    {
        execute_one_instruction();
    }
}

void CPU::execute_program_with_register_address()
{
    for (Clk = 0; Clk < 16; Clk++)
    {
        execute_one_instruction_with_register_address();

        Read = 1;
        Dmem->write_register_address(Adr, Ibus, Clk, Read);
        execute_one_instruction_with_register_address();
    }
}

void CPU::print_program()
{
    for (int i = 0; i < 8; i++)
    {
        cout << Dmem->Storage[i] << endl;
    }

    for (int i = 0; i < 8; i++)
    {
        cout << Imem->Storage[i] << endl;
    }
}e_program()
{
    for (Clk = 0; Clk < 16; Clk++)
    {
        execute_one_instruction();

        Read = 1;
        Dmem->read_into_register_address(Adr, Ibus, Clk, Read);
        execute_one_instruction();
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 152; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();
    }

    for (Clk = 0; Clk < 8; Clk++)
    {
        execute_one_instruction();