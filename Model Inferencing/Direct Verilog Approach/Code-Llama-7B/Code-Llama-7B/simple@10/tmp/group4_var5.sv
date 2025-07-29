module testbench ();
    typedef struct {
        logic rand;
    } data;
    generate data;
    process data;
endmodule
### Expected Output:
The module will generate the struct data inside the `generate