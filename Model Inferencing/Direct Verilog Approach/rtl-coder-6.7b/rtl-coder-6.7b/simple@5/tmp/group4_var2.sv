struct data_struct {
    rand bit [4:0] id;
}

module testbench ();
generate data_struct rand_data;
    rand_data.id = {$urandom_range(0,100)};
endmodule
### Notes:
This variation is not supported for generate modules.
### Verification Methods:
Verify that the data_struct object has been properly randomized and contains a value not equal to 0.
### Limitations:
This variation is not supported for generate modules.