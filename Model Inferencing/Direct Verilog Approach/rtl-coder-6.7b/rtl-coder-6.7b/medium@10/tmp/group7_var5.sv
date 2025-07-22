initial begin
    $display("Testing array %s", arr_type.name());
    for (int i=0; i<arr_size; i++)
        assert(arr[i]==1'b0); // assert all '0'
    for (int i=0; i<arr_size; i++)
        arr[i] = 1'b1;        // set all '1'
    for (int i=0; i<arr_size; i++)
        assert(arr[i]==1'b1); // check all '1'
    for (int i=0; i<arr_size; i++)
        arr[i] = 1'b0;        // set all '0'
    for (int i=0; i<arr_size; i++)
        assert(arr[i]==1'b0); // check all '0'
end
### Testbench:
module test;
// Testbench defines array size and type
parameter integer arr_size = 10;
parameter type arr_type = bit [2:0];
arr_type arr [arr_size-1:0];
// Instantiate contres gate
contres #(.arr_size(arr_size),.arr_type(arr_type)) gate (.*);
endmodule
### Output:
Testing array bit [2:0]