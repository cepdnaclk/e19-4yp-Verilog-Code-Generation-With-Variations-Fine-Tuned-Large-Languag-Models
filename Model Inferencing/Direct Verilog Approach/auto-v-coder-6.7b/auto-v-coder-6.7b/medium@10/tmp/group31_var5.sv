```verilog
module EventCtlPart (output logic xPart, yPart, input logic a, b, c);
logic [0:1] array [0:2][0:2][0:2];
logic [1:0] selected_index;
always_comb 
begin: PartList
    if(a)
        selected_index = 2'b01;
    else if(b)
        selected_index = 2'b10;
    else
        selected_index = 2'b00;
end

always_comb 
begin: PartList
    if(selected_index == 2'b01)
        xPart = array[1][0][1];
    else if(selected_index == 2'b10)
        xPart = array[2][1][2];
    else
        xPart = '0;
end

always_comb 
begin: PartList
    if(selected_index == 2'b01)
        yPart = array[2][2][2];
    else if(selected_index == 2'b10)
        yPart = array[1][1][1];
    else
        yPart = '1;
end

endmodule
```
This verilog code will assign values to xPart and yPart based on a, b, and c. If 'a' is 1, xPart will be assigned the value at array[1][0][1]. If 'b' is 1, xPart will be assigned the value at array[2][1][2]. If 'a' and 'b' are both 0, xPart will be assigned the value of 0. The similar logic is applied to assign values to yPart. 

Note: Replace the '0' and '1' in the assignments with the desired values or expressions based on your design requirements.

The above code uses an always_comb statement which is a non-blocking assignment and is used for combinational logic. The nested if statements are used to handle logic based on the value of 'a' and 'b'. The selected index variable is used to select the appropriate 3D array slice based on the conditions.

Lastly, remember that the values of a, b, and c are input