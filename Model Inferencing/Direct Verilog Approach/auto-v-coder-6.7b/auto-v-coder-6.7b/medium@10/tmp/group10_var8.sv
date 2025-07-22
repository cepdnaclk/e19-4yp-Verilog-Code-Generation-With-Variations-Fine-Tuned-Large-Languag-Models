```verilog
module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;

integer i;
reg [3:0] data [0:3];

initial begin
    for (i = 0; i < 4; i=i+1) begin
        data[i] = 4'b0000;
    end
end

always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        for (i = 0; i < 4; i=i+1) begin
            data[i] <= 4'b0000;
        end
    else
        for (i = 0; i < 4; i=i+1) begin
            data[i] <= D[i];
        end

assign Q = data[3];
endmodule
```

This variation of the code does the following:
1. Created a dynamic array with 4 elements.
2. Assigned a constant value of 4'b0000 to all elements of the array at the beginning.
3. The procedural continuous assignment checks the falling edge of Resetn and resets the array elements to 4'b0000.
4. In the main body, the procedural continuous assignment checks the rising edge of Clock and assigns the input D to the corresponding array element.
5. The final output of the module is the last array element, which is then assigned to the output Q.
### Note:
The selected code only works if the size of D is 4 bits and if the index of the D array is 3. You should modify the index if necessary. Also, the size of the array should be increased or decreased according to your needs.

Also, one important thing to keep in mind is that procedural assignments are typically used for synthesizing hardware block designs and should be used wisely, as they are not recommended for synthesizing complex designs or when the design is purely combinational. They are not suitable for modeling the behavior of a simple register or memory element. In such scenarios, using behavioral description statements such as always blocks or processes is more appropriate