```verilog
module mealy(input Clock, input Resetn, input w, output z);
    input Clock, Resetn, w;
    output z;
    reg y, Y, z;
    parameter A = 0, B = 1;
    // FSM
    class FSM;
        integer a, b;

        initial a = 0;
        initial b = 0;
        always #(w or y) case (y)
            A:
                a = B;
                b = B;
                case (w)
                    false: z = 0;
                    true: z = 1;
                endcase
            B:
                a = A;
                b = B;
                case (w)
                    false: z = 0;
                    true: z = 1;
                endcase
        endcase

        always @(negedge Resetn or posedge Clock)
            if (Resetn) begin
                a <= 0;
                b <= 0;
            end else begin
                a <= a;
                b <= b;
            end
    endclass

    FSM fsm;

    initial begin
        if (Resetn) begin
            fsm = new;
        end else begin
            fsm = new;
            fsm.fsm(1'b1, 1'b1);
        end
    end
endmodule
```

## HDL Coding Conventions Checklist

### Checklist

1. **Naming Conventions:**
   - Variable or Signal names should be named in **all** lowercase with underscores separating words.
   - Module names should be named in **all** uppercase with underscores separating words.
   - Verilog/SV file name should be named exactly the same as module name.
2. **Naming Conventions for Class:**
   - Class names should be named in **all** uppercase with underscores separating words.
3. **Naming Conventions for Parameter:**
   - Parameter names should be named in **all** lowercase with underscores separating words.
4. **Naming Conventions for Port:**
   - Port names should be named in **all** lowercase with underscores separating words.
5. **Naming Conventions for Array:**
   - Array names should be named in **all** lowercase with underscores separating words.
6. **Module Port Declarations:**
   - All module input/output ports **must** be declared with their directions and types.
7. **Array Element Indexing:**
   - Ports, arrays, or signals should be indexed via the `[]` operator.
8. **Constant Value Assignment:**
   - Constant values **must** be assigned via `=` with no indentation.
9. **Array or Signal Initialization:**
   - Arrays or signals **must** be initialized with `=` with no indentation.
10. **Initial Assignment of Port, Array, or Signal:**
    - Ports, arrays, or signals **must** be initialized with assignment statements with a level of indentation of 2 spaces.
11. **Always Block:**
    - Always blocks **must** be indented with 2 spaces.
12. **Port to Signals:**
    - Always block inputs **must** be converted to their respective signal types.
13. **Function Definitions:**
    - Function definitions **must** be placed on the same line as the `function` keyword.
    - Parameters **must** be placed on the line following the `function` keyword.
    - Function body **must** be on the line following the parameters.
14. **Always Block Statements:**
    - Always block statements **must** be placed on the same line as the `always` or `initial` keywords.
    - Event expressions **should** be placed on the line following the `always` or `initial` keywords.
15. **Always Block Ports:**
    - Always block ports **must** be indented with 2 spaces.
16. **Always Block Initializations:**
    - Initializations **must** be indented with 2 spaces.
17. **Always Block Control Statements:**
    - Always block control statements **must** be placed on the same line as the `case` keyword.
    - Case selector expressions **must** be placed on the line following the `case` keyword.
    - Case body statements **must** be placed on the line following the selector expression.
18. **Case Statement:**
    - Case statement bodies **must** be indented with 2 spaces.
19. **Case Statement Selector Expressions:**
    - Case selector expressions **must** be indented with 2 spaces.
20. **Case Statement Statements:**
    - Case statements **must** be indented with 4 spaces.
21. **Function Calls:**
    - Function calls **must** be indented with 4 spaces.
22. **Function Call Arguments:**
    - Function call arguments **must** be indented with 4 spaces.
23. **Module Instantiations:**
    - Module instantiations **must** be placed on the same line as the `module` keyword.
    - Instantiation argument expressions **must** be placed on the line following the `module` keyword.
24. **Parameter Assignments:**
    - Parameter assignments **must** be placed on the same line as the `parameter` keyword.
    - Parameter expressions **must** be placed on the line following the `parameter` keyword.
25. **Generate Block:**
    - Generate blocks **must** be placed on the same line as the `generate` keyword.
    - Generate block end keyword **must** be placed on the line following the `generate` keyword.
26. **Generate Block Instance:**
    - Generate block instances **must** be placed on the same line as the `generate` keyword.
    - Generate block instance end keyword **must** be placed on the line following the `generate` keyword.
27. **Generate Block Instance Ports:**
    - Generate block instance port names **must** be placed on the same line as the `generate` keyword.
    - Generate block instance port expressions **must** be placed on the line following the `generate` keyword.
28. **Generate Block Instance Port Expressions:**
    - Generate block instance port expressions **must** be indented with 4 spaces.
    - Generate block instance port expressions **should** be on the same line as the port type.
    - Generate block instance port expressions **must** be on a separate line if the port type is multi-line.
29. **Generate Case statements:**
    - Generate case statements **must** be placed on the same line as the `case` keyword.
    - Generate case selector expressions **must** be placed on the line following the `case` keyword.
    - Generate case body statements **must** be placed on the line following the selector expression.
30. **Generate Case Statements:**
    - Generate case statements **must** be indented with 4 spaces.
31. **Generate Case Selector Expressions:**
    - Generate case selector expressions **must** be indented with 4 spaces.
32. **Generate Case Statements:**
    - Generate case statements **must** be indented with 4 spaces.
33. **Generate Block End:**
    - Generate block end **must** be placed on the same line as the `endgenerate` keyword.
34. **Always Block End:**
    - Always block end **must** be placed on the same line as the `end` keyword.
35. **Always Block End:**
    - Always block end **must** be placed on the same line as the `end` keyword.
36. **Class Definitions:**
    - Class definitions **must** be placed on the same line as the `class` keyword.
    - Class declaration end keyword **must** be placed on the line following the `class` keyword.
37. **Class Block:**
    - Class blocks **must** be placed on the same line as the `class` keyword.
    - Class block end keyword **must** be placed on the line following the `class` keyword.
38. **Class Initializations:**
    - Class initializations **must** be placed on the same line as the `class` keyword.
    - Class initialization body statements **must** be placed on the line following the `class` keyword.
39. **Class Initializations:**
    - Class initializations **must** be indented with 4 spaces.
40. **Class Control Statements:**
    - Class control statements **must** be placed on the same line as the `class` keyword.
    - Class selector expressions **must** be placed on the line following the `class` keyword.
    - Class body statements **must** be placed on the line following the selector expression.
41. **Class Control Statements:**
    - Class control statements **must** be indented with 4 spaces.
42. **Class Selector Expressions:**
    - Class selector expressions **must** be indented with 4 spaces.
43. **Class Statements:**
    - Class statements **must** be placed on the same line as the `class` keyword.
    - Class statements **must** be indented with 4 spaces.
44. **Class Statements:**
    - Class statements **must** be indented with 4 spaces.
45. **Class End:**
    - Class end **must** be placed on the same line as the `endclass` keyword.
46. **Class End:**
    - Class end **must** be placed on the same line as the `endclass` keyword.
47. **Function Definitions:**
    - Function definitions **must** be placed on