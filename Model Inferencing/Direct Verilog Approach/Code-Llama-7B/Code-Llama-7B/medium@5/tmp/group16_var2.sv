module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if(s == 0)
y = a;
else
if(s == 1)
y = a;
else
if(s == 2)
y = a;
else
if(s == 3)
y = a;
else
if(s == 4)
y = a;
else
if(s == 5)
y = a;
else
if(s == 6)
y = a;
else
if(s == 7)
y = a;
else
if(s == 8)
y = a;
else
if(s == 9)
y = a;
else
if(s == 10)
y = a;
else
if(s == 11)
y = a;
else
if(s == 12)
y = a;
else
if(s == 13)
y = a;
else
if(s == 14)
y = a;
else
if(s == 15)
y = a;
else
if(s == 16)
y = a;
else
if(s == 17)
y = a;
else
if(s == 18)
y = a;
else
if(s == 19)
y = a;
else
if(s == 20)
y = a;
else
if(s == 21)
y = a;
else
if(s == 22)
y = a;
else
if(s == 23)
y = a;
else
y = b;
endmodule
### Pre-Simulation Screenshot:
![pre_simulation_21](https://user-images.githubusercontent.com/41778415/137782662-9d67747e-ce43-457e-a5b4-d06e48093ff1.png)
### Post-Simulation Screenshot:
![post_simulation_21](https://user-images.githubusercontent.com/41778415/137782651-26028aa6-61c6-4467-b79a-f3692419405e.png)
### Relevant Part of the Log:
```
# **
.....................................
Starting simulation with Xilinx Vivado Simulator Version 2017.4
2017-03-21 18:29:00 - Note: Found license file(s): 
C:/Users/chait/AppData/Roaming/Xilinx/Vivado/2017.4/settings64.lic,
C:/Users/chait/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado.lic
2017-03-21 18:29:00 - Note: Found user license file(s): 
C:/Users/chait/AppData/Roaming/Xilinx/Vivado/2017.4/settings64.lic,
C:/Users/chait/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado.lic
2017-03-21 18:29:00 - Note: Found user license file(s): 
C:/Users/chait/AppData/Roaming/Xilinx/Vivado/2017.4/settings64.lic,
C:/Users/chait/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado.lic
2017-03-21 18:29:00 - Note: Found user license file(s): 
C:/Users/chait/AppData/Roaming/Xilinx/Vivado/2017.4/settings64