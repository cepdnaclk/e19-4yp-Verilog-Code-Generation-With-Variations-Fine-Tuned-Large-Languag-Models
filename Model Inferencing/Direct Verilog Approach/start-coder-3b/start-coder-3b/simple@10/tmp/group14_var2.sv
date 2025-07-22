module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=15'b0000000000000000; b=15'b0000000000000000; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
/000_Testbench_code/03_BasicVerilog/04_MultiBit_CombinationalLogic/alu_2.cpp
#include "alu_2.h"
#include <verilated.h>
#include <iostream>

vluint64_t alu_2::time = 0;

//Constructor
alu_2::alu_2(int a, int b,int f, int &d, int &co, char &cci)
{
    //Assign inputs
    A = a;
    B = b;
    F=f;
    //Assign Outputs
    d = 0;
    co = 0;
    cci = '0';
}

//Function to update the current state of register file
void alu_2::update()
{
    //The current state of register file
    d = A & B;
    co =!d;
}

//Reset the testbench
void alu_2::reset()
{
    //Reset the clock
    clock = 0;
    //Reset the register file
    d = 0;
    co = 0;
    cci = '0';
}

//Function to run the testbench
void alu_2::eval()
{
    //If clock is low
    if (clock == 0)
    {
        //Assign the next value of clock
        clock = 1;
        //Increment the time
        time = time + 1;
        //Update the register file
        update();
    }
    //If clock is high
    else
    {
        //Assign the next value of clock
        clock = 0;
        cci = '0';
    }
    //If (F==0) then increment time
    if (F == 0)
    {
        time++;
        //Update the register file
        update();
    }
    //If (F==1) then decrement time
    if (F == 1)
    {
        time--;
        //Update the register file
        update();
    }
    //Update the display at every 10 time steps
    if (time % 10 == 0)
    {
        cout << "time = " << time << " A = " << A << " B = " << B << " f = " << F << " d = " << d << " co = " << co << " cci = " << cci << endl;
    }
    //Advance the state of the testbench
    vluint64_t delay = 10;
    vlThreadDelay(delay);
}

//Function to run the testbench for a number of cycles
void alu_2::run(int cycles)
{
    //Run the testbench for 100 cycles
    for (int i = 1; i <= cycles; i++)
    {
        //Advance the state of the testbench
        eval();
    }
}
//Function to run the testbench for a specified number of cycles
void alu_2::run(int cycles, int a, int b, int f)
{
    //Assign a,b,f to inputs of testbench
    this->A = a;
    this->B = b;
    this->F = f;
    //Run the testbench for 100 cycles
    for (int i = 1; i <= cycles; i++)
    {
        //Advance the state of the testbench
        eval();
    }
}
/000_Testbench_code/03_BasicVerilog/01_SingleBit_CombinationalLogic/alu_1.cpp
#include "alu_1.h"
#include <verilated.h>
#include <iostream>

vluint64_t alu_1::time = 0;

//Constructor
alu_1::alu_1(int a, int b,int f, int &d, int &co, char &cci)
{
    //Assign inputs
    A = a;
    B = b;
    F=f;
    //Assign Outputs
    d = 0;
    co = 0;
    cci = '0';
}

//Function to update the current state of register file
void alu_1::update()
{
    //The current state of register file
    d = A & B;
    co =!d;
}

//Reset the testbench
void alu_1::reset()
{
    //Reset the clock
    clock = 0;
    //Reset the register file
    d = 0;
    co = 0;
    cci = '0';
}

//Function to run the testbench
void alu_1::eval()
{
    //If clock is low
    if (clock == 0)
    {
        //Assign the next value of clock
        clock = 1;
        //Increment the time
        time = time + 1;
        //Update the register file
        update();
    }
    //If clock is high
    else
    {
        //Assign the next value of clock
        clock = 0;
        cci = '0';
    }
    //If (F==0) then increment time
    if (F == 0)
    {
        time++;
        //Update the register file
        update();
    }
    //If (F==1) then decrement time
    if (F == 1)
    {
        time--;
        //Update the register file
        update();
    }
    //Update the display at every 10 time steps
    if (time % 10 == 0)
    {
        cout << "time = " << time << " A = " << A << " B = " << B << " f = " << F << " d = " << d << " co = " << co << " cci = " << cci << endl;
    }
    //Advance the state of the testbench
    vluint64_t delay = 10;
    vlThreadDelay(delay);
}

//Function to run the testbench for a number of cycles
void alu_1::run(int cycles)
{
    //Run the testbench for 100 cycles
    for (int i = 1; i <= cycles; i++)
    {
        //Advance the state of the testbench
        eval();
    }
}
//Function to run the testbench for a specified number of cycles
void alu_1::run(int cycles, int a, int b, int f)
{
    //Assign a,b,f to inputs of testbench
    this->A = a;
    this->B = b;
    this->F = f;
    //Run the testbench for 100 cycles
    for (int i = 1; i <= cycles; i++)
    {
        //Advance the state of the testbench
        eval();
    }
}
/000_Testbench_code/03_BasicVerilog/04_MultiBit_CombinationalLogic/alu_2.h
#ifndef ALU_2_H
#define ALU_2_H

class alu_2
{
public:
    //Constructor to initialize testbench
    alu_2(int a, int b,int f, int &d, int &co, char &cci);
    //Function to reset the testbench
    void reset();
    //Function to run the testbench
    void eval();
    //Function to run the testbench for a number of cycles
    void run(int cycles);
    //Function to run the testbench for a specified number of cycles
    void run(int cycles, int a, int b, int f);

private:
    //Function to update the current state of register file
    void update();
    //Clock input
    int clock = 0;
    //Register file
    int A;
    int B;
    int d;
    int co;
    int F;
    char cci;
    //Time
    static vluint64_t time;
};
#endif/000_Testbench_code/03_BasicVerilog/04_MultiBit_CombinationalLogic/alu_1.h
#ifndef ALU_1_H
#define ALU_1_H

class alu_1
{
public:
    //Constructor to initialize testbench
    alu_1(int a, int b,int f, int &d, int &co, char &cci);
    //Function to reset the test