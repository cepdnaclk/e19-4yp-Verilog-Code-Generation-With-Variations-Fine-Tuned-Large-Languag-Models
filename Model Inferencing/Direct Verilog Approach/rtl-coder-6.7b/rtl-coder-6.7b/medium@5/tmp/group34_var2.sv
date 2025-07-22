module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
reg [3:0] sel=3'b0;
reg [3:0] m_sel = {2'b0, sel};
// reg [2:0] m_sel = sel; // This will cause a warning.

case (m_sel)

// Case 0
3'b000: begin
// sel = 0;
end

// Case 1
3'b001: begin
// sel = 1;
end

// Case 2
3'b010: begin
// sel = 2;
end

// Anything else
default: error "invalid selection";
endcase

gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(sw),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);
endmodule
### Results:
In this case, both the original case and the case with the modified code are accepted by the compiler. The difference is that the first code will produce a constant value of 3'b000 for the index used in case; while the second code will produce a value of 2'b00 for the index used in case. This means that in the first code, the default case for the case statement gets entered and error is thrown. That is why the modification is required.

### Note:
• In this case, the original code would have been accepted if the default case for the case statement was kept commented out. As a result, the code would have had an implicit default case.
• Since the default case is a syntax error in the case statement, it is suggested to use the default case as an empty statement.
• Also, the use of the default case should be noted as a place holder only. It should not be used as a part of the case statement.
• In general, the default case should be avoided as much as possible within a case statement.
• The compiler warns that a default choice may not be executed.
• The default case is not necessary in a MDA case statement.

## 3.2 Case with Mixed Selection Types

There are two different modes for the case statement:

• Unrestricted case statement
• Restrict case statement

The case statement has a restricted form of the case statement where the selection value must be of the type specified in the case statement (an enumerated type in the above example).

### Sample Code:

module gates4_top (
output wire [2:0] ld
);

case (1'd1) // If 'type' is not specified, the selection value must be of the same type as the case statement type.

// Case 0
1'd1: begin
ld = 0;
end

// Anything else
default: error "invalid selection";
endcase

endmodule

### Notes:

• The type of the selection value can be either an enumerated type or a numerical type.
• If the type is an enumerated type, the value must be an integer constant. If the type is a numerical type, the value must be a constant expression.
• The compiler warns for a value that is not an integer constant for an enumerated type. For a numerical type, the compiler warns if the value is a non-constant expression.
• The compiler does not warn if the value is a non-constant expression for a numerical type.
• For an enumerated type, the value must be of a type that is compatible with the selection type. The type compatibility is defined in the following table:

Table 1. Compatibility of the types for case statement

Selection Type Type A Type B Compatible
Integer Boolean Integer Bit-vector Bit-vector
Non-enumerated enumerated Enumerated enumerated
Non-enumerated bit-vector bit-vector bit-vector

• The selection value can always be a string literal.
• If a string literal is used in the case statement, the value is always a string literal. For the other types, the value must be a constant expression.

### Sample Code:

module gates4_top (
output wire [2:0] ld
);

case ("three") // If a string literal is used, the value is always a string literal.

// Case 0
"three": begin
ld = 0;
end

// Anything else
default: error "invalid selection";
endcase

endmodule

### Notes:

• A switch statement is a restricted form of the case statement.

## 3.3 Restricted Case

In this section, the restrict case statement is discussed. The restriction in the case statement will prevent the user from changing the value of the selection used to select case.

### Sample Code:

module gates4_top (
output wire [2:0] ld
);

case (1'd1) // Restrict case statement

// Case 0
1'd1: begin
// ld = 0; // This will cause a syntax error.
end

// Anything else
default: error "invalid selection";
endcase

endmodule

### Notes:

• The restriction is enforced at the time of assignment.
• The same restrictions apply to the case statement that is restricted by the restrict case statement.

## 3.4 Multiple Case Statements

### Sample Code:

module gates4_top (
output wire [2:0] ld
);
case (1'd1)
// Case 0
1'd1: begin
ld = 0;
end

// Case 1
1'd2: begin
ld = 1;
end

// Anything else
default: error "invalid selection";
endcase

endmodule

### Note:

• Several case statements can be used in a case statement.
• The compiler allows the use of a break statement (break;) within a case statement.
• The case statement can be terminated using endcase.
• The case statement terminates with endcase.

## 3.5 Case with Multiple Values

### Sample Code:

module gates4_top (
output wire [2:0] ld
);
case (1'b0)
// Case 0
1'b0: begin
ld = 0;
end

// Case 1
1'b1: begin
ld = 1;
end

// Anything else
default: error "invalid selection";
endcase

endmodule

### Notes:

• The use of multiple values in the case statement is also possible.
• A default value is optional.

## 3.6 Case with Range Value

### Sample Code:

module gates4_top (
output wire [2:0] ld
);
case (2'b00)
// Case 0
2'b00: begin
ld = 0;
end

// Case 1
2'b01: begin
ld = 1;
end

// Case 2
2'b10: begin
ld = 2;
end

// Anything else
default: error "invalid selection";
endcase

endmodule

### Notes:

• The use of a range is possible.
• The compiler warns if the value range is not integer.
• The compiler warns if the value range is not a range.
• The compiler does not warn if the value range is a range.

## 3.7 Case with Multiple Range Values

### Sample Code:

module gates4_top (
output wire [2:0] ld
);
case (2'b00|2'b10)
// Case 0
2'b00: begin
ld = 0;
end

// Case 1
2'b10: begin
ld = 1;
end

// Anything else
default: error "invalid selection";
endcase

endmodule

### Notes:

• The use of a range is possible.
• The case statement can be terminated with endcase.
• The case with multiple range values is called an inclusive case.

## 3.8 Case with Range Value Mixed with the Use of Default Case

### Sample Code:

module gates4_top (
output wire [2:0] ld
);
case (2'b00|2'b10)

// Case 1
2'b01: begin
ld = 1;
end

// Case 2
2'b11: begin
ld = 2;
end

// Anything else
default: error "invalid selection";
endcase

endmodule

### Notes:

• The use of a range is possible.
• The default case is optional.
• The compiler warns if the range value is not integer.
• The compiler warns