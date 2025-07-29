module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else
    ObusReg <= Storage[Adr];
endmodule

module main (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
wire [7:0] a,b,c,d,e,f,g,h,i;
RAM ram1(a,b,4'd0,Clk,1'b0);
RAM ram2(c,d,4'd1,Clk,1'b0);
RAM ram3(e,f,4'd2,Clk,1'b0);
RAM ram4(g,h,4'd3,Clk,1'b0);
RAM ram5(i,Ibus,Adr,Clk,1'b1);
assign Obus=a;
endmodule
```

In the simulation result, there is no error.

### Result

![image](https://github.com/Xilinx/SysGen/raw/2017.2/HLS/docs/Vivado/Vivado_HLS_Tutorial/Systolic_Array/results/vivado-hls.png)

**This example is from:**

[https://github.com/Xilinx/SysGen/tree/2017.2/HLS/docs/Vivado/Vivado_HLS_Tutorial/Systolic_Array](https://github.com/Xilinx/SysGen/tree/2017.2/HLS/docs/Vivado/Vivado_HLS_Tutorial/Systolic_Array)

# Verilog to RTL tutorial:

### 1. Get the IP

There are two ways to get the IP, you can use vivado or vivado_hls.

### 2. Run the application

To run the application, just double click the IP or use the following command:

```tcl
% source./runme.tcl
```

### 3. Compile the RTL

```tcl
% cd..
% cd fft/prj/FFT_prj/solution
% cd impl_1
% vlog -work work../../src/main.v
% vlog -work work../../src/ram.v
% vlog -work work../../src/fft_top.v
% vlog -work work../../src/fft_top_tb.v
% vsim fft_top_tb -c -do "run -all; exit" -lxt2
% cd../../..
```

### 4. Simulate the RTL

```tcl
% cd sim/rtl/fft
% simv -c -do "run -all; exit" -lxt2
```

### 5. Generate the bitstream

```tcl
% cd../../../../prj/FFT_prj/solution
% cd impl_1
% export_design -rtl verilog -format ip_catalog -flow impl
% exit
```

### 6. Create the xo

```tcl
% cd../../..
% cd prj
% vivado
```

You will enter vivado editor, then create a new project.

![image](https://github.com/Xilinx/SysGen/raw/2017.2/HLS/docs/Vivado/Vivado_HLS_Tutorial/sim-rtl/img/vivado.png)

### 7. Load the IP

![image](https://github.com/Xilinx/SysGen/raw/2017.2/HLS/docs/Vivado/Vivado_HLS_Tutorial/sim-rtl/img/vivado-1.png)

### 8. Create the xo

![