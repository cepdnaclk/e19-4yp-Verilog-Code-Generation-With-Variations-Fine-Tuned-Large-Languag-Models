module t_Clock_Prog ();
wire clock;
wire [1:0] Resetn_Type = 1b0;
wire Resetn;

initial #100 $finish;
Clock_Prog M1 (clk, Resetn, Resetn_Type);
endmodule

### Expected Results:
1. Input wire enum assignment to default type is legal.

### What to expect?
1. Input wire enum assignment to default type is legal.

### What did you see?
1. Input wire enum assignment to default type passes verification test.

##### Summary:
Enum assignment to defaulted type
##### Analysis:
Enum types are defined in the way enum Type_1 : {type_1, type_2}; where type_1 and type_2 are defined as enums themselves. In this case, it is a legal enum assignment of enum to default type.
##### Reason:
enum assignment is of enum to default type is legal.
##### Remedy:
None.
### Reference:
None.

## T25: enum of non-default type can be assigned to default type
### Base Ver