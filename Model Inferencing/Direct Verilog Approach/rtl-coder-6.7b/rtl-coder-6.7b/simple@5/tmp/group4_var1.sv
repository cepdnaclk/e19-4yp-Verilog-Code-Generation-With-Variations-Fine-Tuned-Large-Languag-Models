struct Data_to_Test {
 rand bit [7:0] value;
};

module testbench ();
generate
Data_to_Test data_test;

struct {
    rand bit [7:0] value;
} data;

initial
begin

data_test = new();

data_test.value = 42;

$display("Value: 0x%h", data_test.value);

data_test.randomize();

$display("Randomized Value: 0x%h", data_test.value);

end
endgenerate

endmodule