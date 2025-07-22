```verilog
module reg4(D, Clock, Resetn, Q, Sel, Q_Sel);
input [3:0] D;
input Clock, Resetn, Sel;
output reg [3:0] Q;
output reg [3:0] Q_Sel;
reg [3:0] Q_Array [0:7];
integer i;
always @(*) begin
    for(i=0; i<=7; i=i+1) begin
        if(Sel == i) Q_Array[i] <= D;
    end
end
always @(posedge Clock or negedge Resetn) begin
    if(Resetn == 0) begin
        Q <= 4'b0000;
        Q_Sel <= 4'b0000;
    end else begin
        Q <= D;
        Q_Sel <= Q_Array[Sel];
    end
end
endmodule
```
In this modified code, a 2D array (Q_Array) is declared to store the values. The procedural continuous assignment is used to update values in the array based on the Select line (Sel). When the Resetn line is asserted, both the Q and Q_Sel lines are cleared. Otherwise, the Q line is updated to D, and the Q_Sel line is updated to the value in the array corresponding to the Select line. The Select line is used to select which index of the array should be updated.

Note: This code is intended for educational purposes and not a final solution for a real-world design. The use of procedural continuous assignments in a real-world design should be avoided due to the potential confusion and complexity that it can introduce.

Also note: The code does not include a mechanism to prevent an index conflict from occurring. If you're using an index to select between multiple values and you want to update all but one of these values, you will need a different mechanism which is beyond the scope of this example. 

For instance, one option might be to use a priority encoding to select one of the inputs. This would require that you know the order of the inputs, which would then be dependent on the order of your data elements.

This code is based on the assumption that the D inputs are constant