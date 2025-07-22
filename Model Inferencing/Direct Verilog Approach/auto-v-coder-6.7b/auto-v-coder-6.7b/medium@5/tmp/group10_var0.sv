module reg4(D, Clock, Resetn, Q, index);
input [3:0] D;
input Clock, Resetn;
input [1:0] index;
output [3:0] Q;
reg [3:0] Q;
wire [3:0] arrayQ[2:0];

always @(*)
begin
    arrayQ[0] = 4'b0000;
    arrayQ[1] = 4'b0001;
    arrayQ[2] = 4'b0010;
end

always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= arrayQ[index];
endmodule

In this modification, the value of the D register is not used. Instead, you have an array of 4-bit registers (arrayQ) that are populated in the combinatorial process block. Based on the input index, the corresponding value in the arrayQ is assigned to the output Q. The procedural continuous assignment is used to set the values for the array. The index is a value that is used to select the corresponding position in the array. This is a variable input so you can change the index to select different array values. 

Note that this is a slightly more complex version that gives you more flexibility and control over how the register values can change over time. In this case, you have 3 registers, you can directly select 0 (4'b0000), 1 (4'b0001), or 2 (4'b0010). You can modify this code to control the array selection more flexibly. Also, the index input is a 2-bit value, so you can select from 0 to 3 different values in the array, each corresponding to a different register value. 

In summary, the modified code adds a procedural continuous assignment block to populate an array, and then selects the value at the corresponding index using a combinatorial process block. This allows the values in the array to change dynamically over time, and gives you more control over how the output changes based on the index.