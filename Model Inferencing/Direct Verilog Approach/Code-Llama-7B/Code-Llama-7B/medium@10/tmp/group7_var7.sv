```verilog
module test(out, in_array);
wire out;
wire out_1;
wire out_2;
wire out_3;
wire[3:0] in_array;
// Drive wire 'out' from two buffers with specified output strengths
buf(pull1, weak0) g1(out, in_array[0]); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(out_1, in_array[1]); // Drives pull '1', weak '0'
buf(pull1, weak0) g3(out_2, in_array[2]); // Drives pull '1', weak '0'
buf(pull1, weak0) g4(out_3, in_array[3]); // Drives pull '1', weak '0'
```
### Simulation:

```sh
>> vsim test
>> add wave -position insertpoint  /test/*
>> force -freeze sim:/test/in_array 4'b0110
>> run 1ms
>> exit
```
![](https://github.com/jia-sy/Basic_Vivado_Tutorial_Qsys/blob/main/images/8.png)

### Problem:

If we run this simulation, what value is 'out'?
### Variation Instruction:
Change the 'force' statement to drive a 4'b0010 or a 4'b0100 or a 4'b1000.
### Simulation:

```sh
>> vsim test
>> add wave -position insertpoint  /test/*
>> force -freeze sim:/test/in_array 4'b0010
>> run 1ms
>> exit
```
![](https://github.com/jia-sy/Basic_Vivado_Tutorial_Qsys/blob/main/images/9.png)

### Problem:

If we run this simulation, what value is 'out'?
### Variation Instruction:
Change the 'force' statement to drive a 4'b0001 or a 4'b1001 or a 4'b1010.
### Simulation:

```sh
>> vsim test
>> add wave -position insertpoint  /test/*
>> force -freeze sim:/test/in_array 4'b0001
>> run 1ms
>> exit
```
![](https://github.com/jia-sy/Basic_Vivado_Tutorial_Qsys/blob/main/images/10.png)

### Problem:

If we run this simulation, what value is 'out'?
### Variation Instruction:
Change the 'force' statement to drive a 3'b011 or 3'b101 or 3'b110 or 3'b111.
### Simulation:

```sh
>> vsim test
>> add wave -position insertpoint  /test/*
>> force -freeze sim:/test/in_array 3'b011
>> run 1ms
>> exit
```
![](https://github.com/jia-sy/Basic_Vivado_Tutorial_Qsys/blob/main/images/11.png)

### Problem:

If we run this simulation, what value is 'out'?
### Variation Instruction:
Change the 'force' statement to drive a 4'b0111 or a 4'b1111 or a 4'b0000 or a 4'b1101.
### Simulation:

```sh
>> vsim test
>> add wave -position insertpoint  /test/*
>> force -freeze sim:/test/in_array 4'b0111
>> run 1ms
>> exit
```
![](https://github.com/jia-sy/Basic_Vivado_Tutorial_Qsys/blob/main/images/12.png)

### Problem:

If we run this simulation, what value is 'out'?
### Variation Instruction:
Change the 'force' statement to drive a 3'b011 or 3'b000 or 3'