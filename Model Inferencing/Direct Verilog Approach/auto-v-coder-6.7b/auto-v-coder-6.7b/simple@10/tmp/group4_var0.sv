```verilog
module testbench ();

struct {
    rand bit [7:0] data;
} test_data;

initial begin
    test_data.randomize();
    $display("Randomized Data: %h", test_data.data);
end

endmodule
```
In this solution, we define a struct with a single rand member - data of type bit [7:0]. We then use the `randomize` method to randomly initialize this member. Finally, we display the randomized value of data.