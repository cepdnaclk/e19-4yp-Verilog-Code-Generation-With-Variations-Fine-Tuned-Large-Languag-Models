```verilog
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [7:0] packed_array;
integer index = 0;
always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
end

// This is a simple for loop that is used for demonstration.
// It applies the index to a packed array.
always @(posedge Clock)
begin
    if(index < $size(packed_array))
    begin
        packed_array[index] <= Q1; 
        index <= index + 1;
    end
end
endmodule
```
This code will change the value of `packed_array` every clock cycle, where it assigns the value of `Q1` to its `index`-th element. The index is incremented each time. Note that the size of the packed array is automatically determined by the system. Hence, the array can grow as needed. The for loop here is a simple demonstration, and the while loop could be used in place of the if statement, but would require some adjustments to ensure proper timing and resource utilization. Also, the indexing operation uses one-hot address decoding which varies the output based on the one-hot binary value. The actual size of the array would depend on the number of bits required to address it. In this case, it doesn't matter as it is automatically sized with $size.
Note: In Verilog, indices for arrays and packed arrays are zero-based. That means the first element is at index 0. In this example, we assume the array size to be 8 bits. Modify according to your requirements. Also, please consider the usage of always block with posedge event when dealing with array-like data structures.
  
This code demonstrates a basic example of how to use a while loop to index a packed array in Verilog. However, the usage of such loop outside this context is generally discouraged to prevent timing loop issues and other potential problems. It's typically better to use explicit for loops for such scenarios. In general, Verilog does not natively support while loops for operations like these. It's also important to note that indexing a