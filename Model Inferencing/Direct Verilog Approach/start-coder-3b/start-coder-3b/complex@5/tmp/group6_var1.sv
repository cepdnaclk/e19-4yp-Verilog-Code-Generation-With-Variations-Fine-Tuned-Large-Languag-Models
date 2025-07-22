```
##include <systemc.h>
SC_MODULE(mux4to1) {
    sc_in<bool> w0, w1, w2, w3, S;
    sc_out<bool> f;
    bool inside[4] = {true, false, true, false};
    SC_CTOR(mux4to1) {
      SC_METHOD(compute);
      sensitive << w0 << w1 << w2 << w3 << S;
    }
    void compute() {
      f.write((inside[3 & S.read()] << 3) |
              (inside[2 & S.read()] << 2) |
              (inside[1 & S.read()] << 1) |
              (inside[0 & S.read()] << 0));
    }
};
```
/Lab2/README.md
# VIPER Lab 2

## Instructions

1. Create a Viper project for the `counter` described in the previous lab.
2. Add an adder module, connecting `count` and `inc` to the output of `adder`.  You can use `reg`s to implement `adder`.
3. Add an adder module, connecting `inc` to the output of `adder`.  Now connect the output of `adder` to the `count` input of the counter.
4. Use the Viper debugger to print the value of `count` when the internal `clk` is toggled.

## Useful Links

* [Lab 2 Slides](https://drive.google.com/file/d/15bQ4r623e5k5c2sU0O0xL7b6a436kV1o/view?usp=sharing)
* [Adder Module Instructions](https://github.com/ucsd-cse120-wi20/labs/tree/master/Lab1)
/Lab3/counter.cpp
#include <systemc.h>

SC_MODULE(counter) {
  sc_in_clk clk;
  sc_in<bool> reset;
  sc_out<sc_uint<8>> count;
  sc_uint<8> counter;
  sc_uint<8> increment;

  // Initialize values of variables
  SC_CTOR(counter) {
    counter = 0;
    increment = 1;
    SC_METHOD(compute);
    sensitive << clk.pos();
    sensitive << reset;
  }

  void compute() {
    // Check if reset is high
    if (reset.read() == 1) {
      counter = 0;
    } else {
      if (counter == 255) {
        increment = 1;
      } else if (counter == 0) {
        increment = -1;
      }
      counter += increment;
    }
    count.write(counter);
  }
};
/Lab4/README.md
# Lab 4: Simple CPU

## Instruction

1. Create a Viper project for the counter described in previous lab.
2. Place a 4-bit register, connect its output to the `f` of `mux4to1` in the counter, and connect its input to the input of the first mux.
3. Create a new module, `cpu`, that loads a 4-bit instruction and stores it in `register0`.
4. Create another module, `cpu_mem`, that loads `register0` and writes it to `register1`.
5. Create another module, `cpu_alu`, that loads `register0` and `register1` and writes the sum to `register0`.
6. Connect `register0` to the input of `counter`.

## Useful Links

* [Lab 4 Slides](https://docs.google.com/presentation/d/1iJ_2kK-bQ8z3v6a53zG07c34z410a23m/edit#slide=id.p1)
* [Multiplexer Module Instructions](https://github.com/ucsd-cse120-wi20/labs/tree/master/Lab1)
/Lab5/README.md
# Lab 5: CPU

## Instruction

1. Create a Viper project for the counter described in previous lab.
2. Use [this](https://github.com/ucsd-cse120-wi20/labs/blob/master/Lab5/cpu.cpp) CPU code.
3. Add a multiplexer and adder module that loads instructions from `register0` and connects them to the 6-bit and 4-bit inputs of `adder`.
4. Connect the output of `adder` to the input of the first mux.

## Useful Links

* [Lab 4 Slides](https://docs.google.com/presentation/d/1iJ_2kK-bQ8z3v6a53zG07c34z410a23m/edit#slide=id.p1)
* [Multiplexer Module Instructions](https://github.com/ucsd-cse120-wi20/labs/tree/master/Lab1)
/Lab1/README.md
# VIPER Lab 1

## Instructions
1. Create a Viper project for the `counter` described in class.
2. Verify that `counter` is correct by using the Viper debugger.

## Useful Links
* [Lab 1 Slides](https://drive.google.com/file/d/1p3k254k16r7t456c_L97o1R9c6z057dD/view?usp=sharing)
* [Counter Module Instructions](https://github.com/ucsd-cse120-wi20/labs/tree/master/Lab1)
/Lab3/README.md
# VIPER Lab 3

## Instructions

1. Create a Viper project for the `counter` described in class.
2. Add a register module, connect the `count` output of the counter to the input of `register`, and connect the `reset` input of the counter to the reset input of `register`.

## Useful Links

* [Lab 3 Slides](https://drive.google.com/file/d/1zG8z4sJ6y69g8k36k17v3h80U2c32c33/view?usp=sharing)
* [Counter Module Instructions](https://github.com/ucsd-cse120-wi20/labs/tree/master/Lab1)
/README.md
# VIPER Labs

This repository contains the VIPER labs for Winter 2020.

## Instructions

Make sure to use the correct Viper version.  The Viper compiler can be downloaded [here](https://www.veripool.org/downloads/verilator/verilator-4.012.tgz) and the latest documentation can be found [here](https://www.veripool.org/docs/verilator/latest).

## Viper Version

The latest version of Viper is 4.012.

You can check if your version is the latest version by running `verilator --version`.

## Windows

If you are using Windows, install `mingw32`.

## macOS

If you are using macOS, we recommend installing the `pkg` version.

Run the following command in a terminal to install Viper:

```
brew install --HEAD verilator
```

## Using Sublime / TextEditor

If you are using Sublime Text Editor, you can use `ctrl + shift + p` to open the command palette. From there, select "Install Package" and search for "verilator". 

## Useful Links

* [Lab 1 Slides](https://drive.google.com/file/d/1p3k254k16r7t456c_L97o1R9c6z057dD/view?usp=sharing)
* [Lab 2 Slides](https://drive.google.com/file/d/15bQ4r623e5k5c2sU0O0xL7b6a436kV1o/view?usp=sharing)
* [Lab 3 Slides](https://drive.google.com/file/d/1zG8z4sJ6y69g8k36k17v3h80U2c32c33/view?usp=sharing)
* [Lab 4 Slides](https://docs.google.com/presentation/d/1iJ_2kK-bQ8z3v6a53zG07c34z410a23m/edit#slide=id.p1)
* [Lab 5 Slides](https://docs.google.com/presentation/d/1d9