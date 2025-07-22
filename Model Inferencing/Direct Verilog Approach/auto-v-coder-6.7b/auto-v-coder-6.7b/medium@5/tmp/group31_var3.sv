```verilog
module EventCtlPart (output xPart, yPart, input a, b, c, input [1:0] range, input range_data [1:0][1:0][1:0]);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b, c)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
end

if (range_data[range[0]][range[1]][range[2]])
begin: InclusionList
    // Add your code here
end
endmodule
```
In the above code, we added nested if with a 3D array slice selected by variable to check range inclusion. The 3D array 'range_data' should be a 3D array variable that is provided or calculated in outside of the Verilog code (like a Python/C++ test code). Please bear in mind that this is a fairly advanced use of Verilog. 

Note that `range_data` should be initialized with valid data before this nested if block is executed.

Also, make sure that the number of dimensions of `range_data` matches with what is passed in `range`.

If you are calling or simulating this code, ensure that 'range' value that is passing to the module corresponds to the dimensions of 'range_data'. 

This is just an example and can be used accordingly based on the actual requirement of the design.

Lastly, Verilog doesn't guarantee to execute the nested if only when a specific range of values of 'range' is valid. It is only guaranteed within the `PartList` block. For outside if blocks, the behavior is undefined. So, please follow the design guidelines and rules in your compiler or code style guide to avoid such issues. 

Note: You need to declare `range` as an input in your module declaration to be able to pass it to the module. 

Verilog is a complex language and any errors/misunderstandings in your code can lead to unexpected behavior. If you're not sure about something, consult with a Verilog expert or refer to Verilog documentation often. It is also recommended to use a Verilog l