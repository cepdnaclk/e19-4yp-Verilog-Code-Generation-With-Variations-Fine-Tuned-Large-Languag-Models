```
module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
begin
    Storage[Adr] <= Ibus;
    ObusReg <= Storage[Adr];
end
else begin
    ObusReg <= Storage[Adr];
end
endmodule
```
### Simulation:
![Alt text](./Screenshots/RAM_loop_simulated.png?raw=true "")
### Verification:
![Alt text](./Screenshots/RAM_loop_verification.png?raw=true "")
### Verilog HDL Code:
```
module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else
    ObusReg <= Storage[Adr];
endmodule
```
#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cstring>
#include <algorithm>
using namespace std;

#include "mips.h"
#define MemSize 0x100000
#define DataSize 0x10000
int RAM[MemSize];

mips::mips(){
    for(int i=0;i<DataSize;i++)
        RAM[i]=0;
}

void mips::setRAM(int x, int y){
    RAM[x]=y;
}

int mips::getRAM(int x){
    return RAM[x];
}

int mips::getReg(int x){
    return Reg[x];
}

void mips::setReg(int x, int y){
    Reg[x]= y;
}

void mips::MemRead(int &A, int &D, int &PC, bool &Z, bool &N, bool &U, bool &L, bool &V){
    A = 0;
    D = 0;
    Z = 0;
    N = 0;
    U = 0;
    L = 0;
    V = 0;
    int M, M1, M2;
    M1 = MIPS[PC/4];
    M2 = (MIPS[PC/4] >> 16) & 0xffff;
    M = M1 & 0x3fffff;
    switch(M2){
        case 0x8:
            A = MIPS[M/4];
            break;
        case 0x9:
            A = MIPS[M/4] >> 16;
            break;
        case 0x23:
            A = MIPS[M/4];
            D = MIPS[M/4+1];
            break;
        case 0x10:
            if(MIPS[M/4] & 1){
                PC = PC + ((MIPS[M/4] >> 2) << 2);
            }else{
                PC = PC + 4;
            }
            break;
        case 0x11:
            if(MIPS[M/4] & 1){
                PC = PC + ((MIPS[M/4] >> 2) << 2);
            }else{
                PC = PC + 4;
            }
            break;
        case 0x19:
            D = 0;
            for(int i = 1; i <= 10; i++){
                D += (MIPS[M/4] % 2) * pow(2, i-1);
                MIPS[M/4] /= 2;
            }
            if(MIPS[M/4]!= 0){
                cout << "Invalid Operand\n";
                cout << "Register Number: " << M/4 << "\n";
                return;
            }
            break;
        case 0x20:
            if(M & 1){
                PC = PC + ((M >> 2) << 2);
            }
            break;
        case 0x21:
            if(M & 1){
                PC = PC + ((M >> 2) << 2);
            }
            break;
        case 0x28:
            A = M/4;
            break;
        case 0x29:
            A = M/4 >> 16;
            break;
        default:
            break;
    }
    if(M1 & 0x80000000) N = 1;
    if(M1 & 0x40000000) U = 1;
    if(M1 & 0x20000000) Z = 1;
    if(M1 & 0x10000000) L = 1;
    if(M1 & 0x08000000) V = 1;
}

void mips::RegWrite(int A, int D, int B, bool Z, bool N, bool U, bool L, bool V){
    Reg[A] = D;
    Reg[B] = A;
    if(Z) Reg[29] = 0;
    if(N) Reg[29] = 1;
    if(U) Reg[29] = 2;
    if(L) Reg[29] = 3;
    if(V) Reg[29] = 4;
}

void mips::ALUOperation(int &ALUResult, int A, int B, int ALUOp, bool Z, bool N, bool U, bool L, bool V){
    ALUResult = 0;
    switch(ALUOp){
        case 0:
            ALUResult = A + B;
            break;
        case 1:
            ALUResult = A - B;
            break;
        case 2:
            ALUResult = A & B;
            break;
        case 3:
            ALUResult = A | B;
            break;
        case 4:
            ALUResult = A ^ B;
            break;
        case 5:
            ALUResult = A << 1;
            break;
        case 6:
            ALUResult = A >> 1;
            break;
        case 7:
            ALUResult = A >> 2;
            break;
        case 8:
            ALUResult = A << 2;
            break;
        case 9:
            ALUResult = A << 3;
            break;
        case 10:
            ALUResult = A >> 3;
            break;
        case 11:
            ALUResult = A << 4;
            break;
        case 12:
            ALUResult = A >> 4;
            break;
        default:
            break;
    }
    if(ALUResult == 0){
        if(Z) Reg[29] = 0;
        else Reg[29] = 1;
    }
    if(ALUResult < 0){
        if(U) Reg[29] = 2;
        else Reg[29] = 3;
    }
    if(ALUResult > 0){
        if(L) Reg[29] = 4;
        else Reg[29] = 5;
    }
}

void mips::execute(int &A, int &D, int &B, int &ALUResult, int &PC, bool &Z, bool &N, bool &U, bool &L, bool &V){
    int M2;
    D = 0;
    Z = 0;
    N = 0;
    U = 0;
    L = 0;
    V = 0;
    switch(MIPS[PC/4] >> 26){
        case 0:
            switch((MIPS[PC/4] >> 24) & 0x07){
                case 0:
                    D = Reg[(MIPS[PC/4] >> 21) & 0x0f];
                    break;
                case 2:
                    D = Reg[(MIPS[PC/4] >> 21) & 0x0f];
                    break;
                case 4:
                    D = Reg[(MIPS[PC/4] >> 16) & 0x0f];
                    break;
                case 6:
                    D = Reg[(MIPS[PC/4] >> 16) & 0x0f];
                    break;
                case 8:
                    D = 0;
                    for(int i = 1; i <= ((MIPS[PC/4] >>