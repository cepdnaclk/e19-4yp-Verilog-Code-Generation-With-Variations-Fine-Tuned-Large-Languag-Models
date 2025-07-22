module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
while ($signed(Adr) < 16 & $signed(Adr) >= 0)
    Storage[Adr] <= Ibus;
else
    ObusReg <= Storage[Adr];
endmodule    
### Explanation: 
The code is based on the standard RAM module and it first uses a while loop to store the data in the storage array. It starts from 0 and ends at 16 – 1 and checks the condition using less than operation and greater than operation. 

A different variation instruction is used inside the loop to break the loop. The new instruction is 0 if the $signed(Adr) is greater than or equal to 16, but less than (0-15). That's the code for the new instruction.

### Verilog Simulation:
The RAM module is simulated using the following test bench. 
#### Test bench:
module test_ram;
reg[7:0] Obus_t, Ibus_t, Adr_t;
wire[7:0] Obus_w;
assign #1 Obus_w = Obus_t;
reg Clk_t;
wire Read_t;
assign #1 Read_t = 1'b0;
initial begin
Adr_t = 0;
end

always @(posedge Clk_t)
begin
Obus_t <= Ibus_t;
if (Adr_t < 8)
   Obus_t <= $random;
else
   Obus_t <= 0;
end

initial begin
Read_t = 1'b1;
end
always @(posedge Clk_t)
begin
if (Read_t == 1'b1)
   Ibus_t <= $random;
end

initial begin
Adr_t = 3;
end
always @(posedge Clk_t)
begin
Adr_t = Adr_t + 1;
end

initial begin
Adr_t = 0;
end
always @(posedge Clk_t)
begin
Adr_t = Adr_t + 1;
end

initial begin
Adr_t = 7;
end
always @(posedge Clk_t)
begin
Adr_t = Adr_t - 1;
end

initial begin
Adr_t = 7;
end
always @(posedge Clk_t)
begin
Adr_t = Adr_t - 1;
end

initial begin
Adr_t = 0;
end

always @(posedge Clk_t)
begin
if (Adr_t > 7)
   Clk_t = 1;
else
   Clk_t = 0;
end

RAM ram (
.Obus(Obus_w),
.Ibus(Ibus_t),
.Adr(Adr_t),
.Clk(Clk_t),
.Read(Read_t)
);

initial begin
#100;
$display("Initial Ibus, Obus_t before the test: %x %x", Ibus_t, Obus_t);
#100;
$display("Initial Ibus, Obus_w before the test: %x %x", Ibus_t, Obus_w);
#100;
$display("Initial Ibus, Obus_t after the test: %x %x", Ibus_t, Obus_t);
#100;
$display("Initial Ibus, Obus_w after the test: %x %x", Ibus_t, Obus_w);
$finish;
end

endmodule

### Simulation Output:
![image](https://user-images.githubusercontent.com/57335291/112628389-b0c51100-8e45-11eb-9a46-9f4e123f1623.png)

![image](https://user-images.githubusercontent.com/57335291/112628579-ec80f800-8e45-11eb-8f4c-4a0099d2953a.png)

![image](https://user-images.githubusercontent.com/57335291/112628683-12a69800-8e46-11eb-8405-17326816ac03.png)

![image](https://user-images.githubusercontent.com/57335291/112628723-1db38700-8e46-11eb-84d3-73748e9448f3.png)

![image](https://user-images.githubusercontent.com/57335291/112628734-21470e00-8e46-11eb-985b-be5d137084e8.png)

![image](https://user-images.githubusercontent.com/57335291/112628744-2441fe80-8e46-11eb-97e3-8624a43a2f28.png)

![image](https://user-images.githubusercontent.com/57335291/112628758-286e1c00-8e46-11eb-95a9-8822783b512f.png)

![image](https://user-images.githubusercontent.com/57335291/112628766-2cb05700-8e46-11eb-9c9e-40919020dd20.png)

![image](https://user-images.githubusercontent.com/57335291/112628774-2f12b100-8e46-11eb-952d-258e3505ad10.png)

![image](https://user-images.githubusercontent.com/57335291/112628787-31750b00-8e46-11eb-9af8-50cbbf87eb00.png)

![image](https://user-images.githubusercontent.com/57335291/112628802-346ffd80-8e46-11eb-80d5-0e8b7a49a3bf.png)

### Conclusion:
The simulation results show that the RAM module works as expected and the data is stored in the 16-bit storage array. And it is able to fetch the data and can display the desired output.
module ADD(output[7:0] Obus,input[7:0] Ibus1,input[7:0] Ibus2, input[1:0] Sltu,input[3:0] Adr,input Clk, Read);
reg[7:0] ObusReg;
always @(posedge Clk)
begin
    ObusReg <= ObusReg + Ibus1;
end
endmodule
#include <stdio.h>

int main(){
    int i=0;
    while(i<10){
        if(i%2==0){
            printf("%d\n",i);
        }
        i++;
    }
    return 0;
}   
# Task-7:
# Name: 
# Roll no: 18103001
# Task: Implement a basic test bench for the above code module.

### Base Verilog Code:
module ADD(output[7:0] Obus,input[7:0] Ibus1,input[7:0] Ibus2);
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(Ibus1, Ibus2, ObusReg)
begin
ObusReg