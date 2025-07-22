module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
D0 = packed_array[0];
D1 = packed_array[1];
Sel = packed_array[2];
always @(posedge Clock)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule
### Expected Output:
This will execute the top level entity which would read all the packed arrays and set the D0, D1 and Sel variables to the desired values.
/README.md
# Verilog
Verilog and System Verilog
/Digital System Designed With Verilog HDL/README.md
## Digital System Designed With Verilog HDL

This repository contains all the examples and assignments done in the course of Digital System Designed With Verilog.

### Content of Repository:

* Digital System Designed With Verilog HDL
* [Assignment 1](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%201) - Implementation of a **Multiplexer** using **MUX Logic**
* [Assignment 2](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%202) - Implementation of the **Adder-Subtracter** using 2 inputs
* [Assignment 3](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%203) - Implementation of the **Adder-Subtracter** using 3 inputs
* [Assignment 4](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%204) - Implementation of the **Multiplexer** using 2 inputs
* [Assignment 5](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%205) - Implementation of the **Two-Bit-Adder**
* [Assignment 6](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%206) - Implementation of the **Three-Bit-Adder**
* [Assignment 7](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%207) - Implementation of the **Four-Bit-Adder**
* [Assignment 8](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%208) - Implementation of the **Two-Bit-Subtractor**
* [Assignment 9](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%209) - Implementation of the **3-Bit-Subtractor**
* [Assignment 10](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2010) - Implementation of the **3-Bit-Multiplcation**
* [Assignment 11](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2011) - Implementation of the **4-Bit-Multiplication**
* [Assignment 12](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2012) - Implementation of the **2-Bit-Decrementer**
* [Assignment 13](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2013) - Implementation of the **8-Bit-Binary-Counter**
* [Assignment 14](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2014) - Implementation of the **4-Bit-Binary-Counter**
* [Assignment 15](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2015) - Implementation of the **4-Bit-Binary-Adder**
* [Assignment 16](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2016) - Implementation of the **8-Bit-Binary-Adder**
* [Assignment 17](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2017) - Implementation of the **8-Bit-Binary-Subtractor**
* [Assignment 18](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2018) - Implementation of the **4-Bit-Binary-Subtractor**
* [Assignment 19](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2019) - Implementation of the **4-Bit-Binary-Multiplier**
* [Assignment 20](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2020) - Implementation of the **4-Bit-Binary-Decrementer**
* [Assignment 21](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2021) - Implementation of the **7-Bit-Binary-Counter**
* [Assignment 22](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2022) - Implementation of the **16-Bit-Binary-Counter**
* [Assignment 23](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2023) - Implementation of the **7-Bit-Binary-Adder**
* [Assignment 24](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2024) - Implementation of the **16-Bit-Binary-Adder**
* [Assignment 25](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2025) - Implementation of the **16-Bit-Binary-Subtractor**
* [Assignment 26](https://github.com/dusankod/Verilog/tree/master/Digital%20System%20Designed%20With%20Verilog%20HDL/Assignment%2026) - Implementation of the **7-