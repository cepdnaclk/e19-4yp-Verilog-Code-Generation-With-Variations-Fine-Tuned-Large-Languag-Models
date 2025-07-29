```verilog
module wire_assign( 
    input wire in,
    output reg [7:0] out
);
    reg [7:0] clock[*];
    assign out = clock[in];
endmodule
```
### Simulation:
```
run 100
```
![simulation](http://i.imgur.com/JQ2X0mP.png)

### Notes:
As long as the wildcard operator is in the first index position, the resulting expression is equivalent to a traditional associative array.  Wildcard indexing was added to provide a way to iterate over an associative array in a for-loop.

### Tips:
Wildcard indexing is only supported when the associative array is the first index of an expression.  This is to provide flexibility in iterating over associative arrays in a for-loop, as shown below:
```verilog
for( int i = 0; i < 2; i++ ) begin
    // i is assigned the values 0 and 1
    assign out[i] = clock[i];
end
```
In the for-loop above, associative arrays are iterated over by the use of the inside operator.
### Key Points:
The inside operator returns true if the provided expression is an associative array.  If the expression contains an associative array that is not the first index, the inside operator will return false.

The inside operator can be used in conjunction with the inside_q operator to determine if a value is inside an associative array:
```verilog
reg [7:0] clock[*];
reg [7:0] out[*];
reg [7:0] out_q[*];

logic signed [7:0] j;

always @(posedge clock[0]) begin
    for( int i=0; i<in.size(); i++ ) begin
        if( inside( out_q, in[i] ) ) begin
            j = inside_q( out, in[i] );
            // j is true if in[i] is inside out, and is false otherwise
        end
    end
end
```
When the inside operator is used in a procedural block, the associative array must contain a