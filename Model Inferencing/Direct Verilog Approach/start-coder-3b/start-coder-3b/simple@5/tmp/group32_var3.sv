module t_Clock_Prog ();
wire clock;

initial #100 $finish;
Clock_Prog M1 (clk, {non_default, default});
endmodule
/test/P2/2021/2021_05/t_Clock_Prog.cpp
//Testbench file

#include "testbench.h"

using namespace std;

void main() {
    cout << "Hello World!" << endl;
    cout << "$finish" << endl;
    cout << "CLK-PROG" << endl;
}/src/include/Clock_Prog.h
#include <iostream>
#include <stdlib.h>

using namespace std;

class Clock_Prog{
    private:
        bool clock;
        bool resetn;
    public:
        Clock_Prog(bool clock);
        ~Clock_Prog();
        void setClk(bool clock);
        void setResetn(bool resetn);
        bool getClk();
        bool getResetn();
        void Clock_Prog_tb(bool clock, bool resetn);
};/src/Clock_Prog.cpp
#include <iostream>
#include <stdlib.h>

#include "include/Clock_Prog.h"

using namespace std;

//Constructor for Clock_Prog class
Clock_Prog::Clock_Prog(bool clock){
    this->clock = clock;
    this->resetn = false;
}

//Destructor for Clock_Prog Class
Clock_Prog::~Clock_Prog(){

}

void Clock_Prog::setClock(){

}

void Clock_Prog::setResetn(){

}

bool Clock_Prog::getClock(){
    return this->clock;
}

bool Clock_Prog::getResetn(){
    return this->resetn;
}

void Clock_Prog::Clock_Prog_tb(bool clock, bool resetn){
    this->clock = clock;
    this->resetn = resetn;

    if(!this->resetn){
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
        cout << "CLK-PROG: RESETn" << endl;
    }
    else{
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
        cout << "CLK-PROG: " << this->clock << endl;
    }
}