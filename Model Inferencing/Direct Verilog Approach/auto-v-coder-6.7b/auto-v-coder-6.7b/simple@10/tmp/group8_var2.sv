```verilog
module IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out );

logic [1:0] A [0:3]; // 2-bit packed elements, 4 elements in 1D array

always @( posedge clk )
if ( load )
begin
    A[0] <= data_in[7:6];
    A[1] <= data_in[5:4];
    A[2] <= data_in[3:2];
    A[3] <= data_in[1:0];
end
endmodule
```
In the above code, the 8-bit instruction (data_in) is split into 4 two-bit segments, each packed in a different element of the 1D array A. When load is high, these values are loaded into A on the posedge of the clock.

Note: The packed array A is not being manipulated in the code provided. This is just a demonstration of how the inputs could be represented in the module. In practice, if logic is needed to operate on the packed elements of the array, additional logic would be required.!