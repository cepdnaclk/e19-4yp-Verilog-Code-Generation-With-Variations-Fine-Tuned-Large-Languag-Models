module netdelay2(x,y);
input x;
output y;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
not #(32,nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
assign #(32,y,nn); // Assign 'nn' to 'y' (direct assignment)
endmodule
/README.md
# Pulsed-Delay-Analysis-for-VHDL-with-Verilog

A systematic study of the impact of pulse width on delay analysis results on VHDL/ Verilog based PLD and DSP designs.

## Abstract

As the pulse width of the test waveform increases, the sensitivity of the latency analysis result to the width of the test pulse can be examined. A delay analysis tool was developed to perform this study, using the VHDL standard for test waveform generation. A set of test cases based on the data flow diagram (DFD) of a FPGA design were analyzed to determine the impact of pulse width on the delay analysis results. For the FPGA design, the test waveform was the set of input data to the DSP logic within the design. A variety of the parameters were varied to generate different waveforms. The results of the analysis of the different parameters were then compared with that of a reference waveform. The findings of this study highlight the impact of pulse width on the analysis results of a FPGA design, thereby providing a framework for the development of DSP designs based on VHDL.

## Results

The impact of pulse width on delay analysis results was studied with a test case based on the data flow diagram of a FPGA design. The test case was used to examine whether the delay analysis result was sensitive to the pulse width of the test waveform. The design parameters were varied to generate different test waveforms to observe the impact of the pulse width on the delay analysis results.

The results indicated that the latency analysis result was not sensitive to the pulse width.

## Software Used

- [VHDL](https://en.wikipedia.org/wiki/VHDL) (https://en.wikipedia.org/wiki/VHDL)
- [Verilog](https://en.wikipedia.org/wiki/Verilog) (https://en.wikipedia.org/wiki/Verilog)
- [VHDL Verifier](https://github.com/vlsi/vhdl-vlsi) (https://github.com/vlsi/vhdl-vlsi)
- [Vitis](https://www.xilinx.com/products/design-tools/vivado.html) (https://www.xilinx.com/products/design-tools/vivado.html)
- [SURELOG](https://github.com/alainmarcel/Surelog) (https://github.com/alainmarcel/Surelog)
- [Vivado HLS](https://www.xilinx.com/products/design-tools/vivado/vivado-hls.html) (https://www.xilinx.com/products/design-tools/vivado/vivado-hls.html)

## Usage

This research was carried out using VHDL and Verilog. A VHDL test case was created from a data flow diagram (DFD) and then VHDL Verifier was used to perform a pulse width analysis on the test case. The results obtained from the analyses can be compared with the results obtained from a reference test case. The results obtained from the following analyses are also presented in the paper.

### VHDL Verifier Pulse Width Analysis

VHDL Verifier provides two methods for analyzing pulse width, the `pulse_width_analyzer` and `pulse_width_analyzer_tb`. The former is based on the DFD, while the latter is based on the test bench.
The results obtained from the `pulse_width_analyzer_tb` analysis were compared with a reference test case.

### Verilog Verifier Pulse Width Analysis

Verilog Verifier provides a `pulse_width_analyzer` method for analyzing pulse width based on the test case. The results obtained from the `pulse_width_analyzer` analysis were compared with a reference test case.

### System Verilog Verifier Pulse Width Analysis

System Verilog Verifier provides a `pulse_width_analyzer` method for analyzing pulse width based on the test case, the test bench, or both. The results obtained from the `pulse_width_analyzer` analysis were compared with a reference test case.

### Vivado HLS Pulse Width Analysis

Vivado HLS provides a `pulse_width_analyzer` method for analyzing pulse width based on the test bench. The results obtained from the `pulse_width_analyzer` analysis were compared with a reference test case.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
y, the result is same.
/Pulse Width Analysis/System Verilog Verifier/README.md
# System Verilog Verifier Pulse Width Analysis

## Pulse Width Analysis Result

### VHDL

The `pulse_width_analyzer` method is tested.

![img.png](https://github.com/zxc7635559/Pulsed-Delay-Analysis-for-VHDL-with-Verilog/blob/main/Pulse%20Width%20Analysis/%E5%B7%A5%E5%85%B7%E5%8C%85%E5%90%88/%E6%B5%8B%E8%AF%95%E7%A4%BA%E4%BE%8B/%E7%94%A8%E6%96%87%E5%AD%97%E4%B8%B2%E6%93%8D%E4%BD%9C/VHDL%20%E5%8F%82%E6%95%B0%E8%BD%AC%E6%8D%A2%E7%9A%84%E5%BD%92%E5%90%88%E6%A8%A1%E6%9D%BF/%E6%B2%A1%E6%9C%89%E6%96%87%E5%AD%97%E4%B8%B2.vhd)

### Verilog

The `pulse_width_analyzer` method is tested.

![img_1.png](https://github.com/zxc7635559/Pulsed-Delay-Analysis-for-VHDL-with-Verilog/blob/main/Pulse%20Width%20Analysis/%E5%B7%A5%E5%85%B7%E5%8C%85%E5%90%88/%E6%B5%8B%E8%AF%95%E7%A4%BA%E4%BE%8B/%E7%94%A8%E6%96%87%E5%AD%97%E4%B8%B2%E6%93%8D%E4%BD%9C/Verilog%20%E5%8F%82%E6%95%B0%E8%BD%AC%E6%8D%A2%E7%9A%84%E5%BD%92%E5%90%88%E6%A8%A1%E6%9D%BF/%E6%B2%A1%E6%9C%89%E6%96%87%E5%AD%97%E4%B8%B2.v)

### System Verilog

The `pulse_width_analyzer` method is tested.

![img_2.png](https://github.com/zxc7635559/Pulsed-Delay-Analysis-for-VHDL-with-Verilog/blob/main/Pulse%20Width%20Analysis/%E5%B7%A5%E5%85%B7%E5%8C%85%E5%90%88/%E6%B5%8B%E8%AF%95%E7%A4%BA%E4%BE%8B/%E7%94%A8%E6%96%87%E5%AD%97%E4%B8%B2%E6%93%8D%E4%BD%9C/System%20Verilog%20%E5%8F%82%E6%95%B0%E8%BD%AC%E6%8D%A2%E7%9A%84%E5%BD