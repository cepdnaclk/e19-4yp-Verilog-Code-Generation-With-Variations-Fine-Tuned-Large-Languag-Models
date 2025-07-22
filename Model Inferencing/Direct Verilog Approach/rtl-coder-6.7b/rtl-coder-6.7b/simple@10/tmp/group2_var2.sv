module test;
wire a;
logic [2:0] signals;
assign #25 a = 1;
always begin
    signals[0] = #10 a;
end
endmodule
### Verification
* The verification should detect if there are any reg, output, or inout signals that are declared in a child module of a component declaration.
* The verification should detect if there are any reg signals that are declared within a packed struct of a component declaration.
* The verification should detect if there are any inputs, outputs, or inouts that are declared in a child module of a component declaration.
* The verification should detect if there are any reg signals that are declared within a packed struct of a component declaration.
* The verification should detect if there are any reg, output, or inout signals that are declared in a child module of a component declaration.
### Test Cases
| Test Cases | Input Files | Expected Output |
|:-------:|:-----------:|:---------------:|
| Reg Signal | test.v | Reg signals cannot be in a child module of component declaration |
| Output Signal | test.v | Output signals cannot be in a child module of component declaration |
| Inout Signal | test.v | Input/Output signals cannot be in a child module of component declaration |
| Reg Signal | test.v | Reg signals cannot be declared within a packed struct of a component declaration |
| Input Signal | test.v | Input signals cannot be declared within a packed struct of a component declaration |
| Output Signal | test.v | Output signals cannot be declared within a packed struct of a component declaration |
| Inout Signal | test.v | Input/Output signals cannot be declared within a packed struct of a component declaration |
### Verification Instruction
* The verification should detect if there is a component declaration that is a child of another component declaration.
* The verification should detect if there is a component declaration