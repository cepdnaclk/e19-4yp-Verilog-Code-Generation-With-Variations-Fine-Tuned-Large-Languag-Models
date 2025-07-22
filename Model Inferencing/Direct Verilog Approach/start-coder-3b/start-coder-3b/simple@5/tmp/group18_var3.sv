%File:../src/test_enum.v
```
module mul_aa(ao,ai,aj); // 6-bit multiplier
  output ao; input ai, aj; 
  wire [5:0] ao, ai, aj; 
  assign ao = ai * aj;
endmodule
```
### Simulation Results:
```
> vvp -N mul_aa.vvp 
[info] Reading from'mul_aa.v'.
[info] Parsing'mul_aa.v'.
[info] Compiling'mul_aa.v'.
[info] Executing'mul_aa.v' with 4 threads.
[info] Simulation begins at 2019-03-14 07:22:06.598188.
[info] Simulation ends at 2019-03-14 07:22:06.613038.
[info] A sample of simulation data is written to '/home/yucca/Verilator/verilator-3.879/t/test_enum/mul_aa.vvp.sim'
[info] The simulation took 148 us to simulate 1000000 cycles.
[info] Final result is 0000000000000000.
```
### Simulation Result Analysis:
```
* Note that the result shows some randomness in the simulation output.
* This is because the delay value 2 is used in the not gate.
* Therefore, although the input values of the not gate are the same, the output values may be different.
* In general, it is better to use random values for the input ports instead of fixed values to verify the functionality of the circuit.
```
----
## Verilator Options
### Verilator Options: -Mdir: Verificates the circuit in the directory, and uses the options in the file to simulate it.
```
> make -j
[  4%] Built target sim
[2135/2135] Generating../test/test_enum.v
make[1]: Entering directory '/home/yucca/Verilator/verilator-3.879/t'
[100%] Built target test_enum-verilog
make[1]: Leaving directory '/home/yucca/Verilator/verilator-3.879/t'
[  1%] Built target test_enum-tests
[  3%] Built target test_enum-tb
[ 14%] Built target test_enum-tb-vvp
[ 17%] Built target test_enum-tb-vcd
[ 20%] Built target test_enum-bin2c
[ 22%] Built target test_enum-moc
[ 23%] Built target test_enum-moc_tb
[ 24%] Built target test_enum-moc_tb_vcd
[ 25%] Built target test_enum-moc_tb_vvp
[ 32%] Built target test_enum-vcd2html
[ 50%] Built target test_enum-moc_tb_vcd
[ 64%] Built target test_enum-vcd2v
[ 67%] Built target test_enum-moc_tb_vcd
[ 80%] Built target test_enum-bin2v
[ 85%] Built target test_enum-bin2v
[100%] Built target test_enum-vvp
make: Leaving directory '/home/yucca/Verilator/verilator-3.879/t'
>./test_enum.bin2v
VCD2V: reading../test/test_enum-tb.vcd
VCD2V: input=31-0 59-32 62-60
VCD2V: no VCD header found
VCD2V: writing to../test/test_enum-tb.v
>./test_enum.bin2v >>../test/test_enum.v
>./test_enum.bin2c
VCD2C: reading../test/test_enum-tb.vcd
VCD2C: input=31-0 59-32 62-60
VCD2C: no VCD header found
VCD2C: writing to../test/test_enum_tb.cpp
VCD2C: reading../test/test_enum-tb.vcd
VCD2C: input=31-0 59-32 62-60
VCD2C: no VCD header found
VCD2C: writing to../test/test_enum_tb.h
```
----
## Verilator: -Mdir: Verificates the circuit in the directory, and uses the options in the file to simulate it.
```
> make -j
[  4%] Built target sim
[2135/2135] Generating../test/test_enum.v
make[1]: Entering directory '/home/yucca/Verilator/verilator-3.879/t'
[100%] Built target test_enum-verilog
make[1]: Leaving directory '/home/yucca/Verilator/verilator-3.879/t'
[  1%] Built target test_enum-tests
[  3%] Built target test_enum-tb
[ 14%] Built target test_enum-tb-vvp
[ 17%] Built target test_enum-tb-vcd
[ 20%] Built target test_enum-bin2c
[ 22%] Built target test_enum-moc
[ 23%] Built target test_enum-moc_tb
[ 24%] Built target test_enum-moc_tb_vcd
[ 25%] Built target test_enum-moc_tb_vvp
[ 32%] Built target test_enum-vcd2html
[ 50%] Built target test_enum-moc_tb_vcd
[ 64%] Built target test_enum-vcd2v
[ 67%] Built target test_enum-moc_tb_vcd
[ 80%] Built target test_enum-bin2v
[ 85%] Built target test_enum-bin2v
[100%] Built target test