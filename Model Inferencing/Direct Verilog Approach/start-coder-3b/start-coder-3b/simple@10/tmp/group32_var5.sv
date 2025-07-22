module t_Enum_Prog ();
enum e_Enum_Type {
    e_Enum_Type_1,
    e_Enum_Type_2,
    e_Enum_Type_3
};

e_Enum_Type enum_var = e_Enum_Type_2;

initial #100 $finish;

always @* begin
    $display("enum_var = %d", enum_var);
end
endmodule
### Expected Output:

```
$ yosys -p "synth_ice40 -blif test.blif" t_Enum_Prog.v
[...]

```

## SystemC Coverage

The goal of this testbench is to test basic functionality and systemC coverage of C++ enum variables in Verilog code. This goal includes code coverage of all enum types and all enum variables. The testbench produces a list of missing elements for the enum variable and enum type it is declared in.

The code produced by the testbench is a module consisting of an enum variable and a Verilog process to output that variable's value at $time and $time 101 times.

### Base SystemC Code:
`class t_Enum_Prog: public sc_module {
enum e_Enum_Type {
    e_Enum_Type_1,
    e_Enum_Type_2,
    e_Enum_Type_3
};

e_Enum_Type enum_var;

SC_CTOR(t_Enum_Prog) {
    SC_THREAD(run);
}

void run () {
    enum_var = e_Enum_Type_2;

    int i = 0;
    while (true) {
        cout << time_stamp() << " enum_var = " << enum_var << endl;
        wait(100, SC_NS);
    }
}
};
`
### Variation Instruction:
Replace the enum variable with an enum type variable with default and non-default base types to test enum type coverage.
### Modified SystemC Code:
`class t_Enum_Prog: public sc_module {
enum e_Enum_Type {
    e_Enum_Type_1,
    e_Enum_Type_2,
    e_Enum_Type_3
};

e_Enum_Type enum_var;

SC_CTOR(t_Enum_Prog) {
    SC_THREAD(run);
}

void run () {
    enum_var = e_Enum_Type_2;

    int i = 0;
    while (true) {
        cout << time_stamp() << " enum_var = " << enum_var << endl;
        wait(100, SC_NS);
    }
}
};
`
### Expected Output:

```
$ vsim -c -do "run -all; quit" t_Enum_Prog

```

## SystemC Behavioral Coverage

The goal of this testbench is to test basic functionality and systemC coverage of C++ enum variables in Verilog code. This goal includes code coverage of all enum types and all enum variables. The testbench produces a list of missing elements for the enum variable and enum type it is declared in.

The code produced by the testbench is a module consisting of an enum variable and a Verilog process to output that variable's value at $time and $time 101 times.

### Base SystemC Code:
`class t_Enum_Prog: public sc_module {
enum e_Enum_Type {
    e_Enum_Type_1,
    e_Enum_Type_2,
    e_Enum_Type_3
};

e_Enum_Type enum_var;

SC_CTOR(t_Enum_Prog) {
    SC_THREAD(run);
}

void run () {
    enum_var = e_Enum_Type_2;

    int i = 0;
    while (true) {
        cout << time_stamp() << " enum_var = " << enum_var << endl;
        wait(100, SC_NS);
    }
}
};
`
### Variation Instruction:
Replace the enum variable with an enum type variable with default and non-default base types to test enum type coverage.
### Modified SystemC Code:
`class t_Enum_Prog: public sc_module {
enum e_Enum_Type {
    e_Enum_Type_1,
    e_Enum_Type_2,
    e_Enum_Type_3
};

e_Enum_Type enum_var;

SC_CTOR(t_Enum_Prog) {
    SC_THREAD(run);
}

void run () {
    enum_var = e_Enum_Type_2;

    int i = 0;
    while (true) {
        cout << time_stamp() << " enum_var = " << enum_var << endl;
        wait(100, SC_NS);
    }
}
};
`
### Expected Output:

```
$ vsim -c -do "run -all; quit" t_Enum_Prog

```

## SystemC Structural Coverage

The goal of this testbench is to test basic functionality and systemC coverage of C++ enum variables in Verilog code. This goal includes code coverage of all enum types and all enum variables. The testbench produces a list of missing elements for the enum variable and enum type it is declared in.

The code produced by the testbench is a module consisting of an enum variable and a Verilog process to output that variable's value at $time and $time 101 times.

### Base SystemC Code:
`class t_Enum_Prog: public sc_module {
enum e_Enum_Type {
    e_Enum_Type_1,
    e_Enum_Type_2,
    e_Enum_Type_3
};

e_Enum_Type enum_var;