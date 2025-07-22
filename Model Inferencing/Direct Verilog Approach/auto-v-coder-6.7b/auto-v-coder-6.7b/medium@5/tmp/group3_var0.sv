module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();

always @ (*)
begin
    fa0 <= fa0[3:0];    /* Part-select expression used inside operator range list */
    fa1 <= fa1[3:1];
    fa2[3:0] <= fa2[5:0];
    fa3[1:0] <= fa3[2:3];
end
endmodule
### Explanation:
This code demonstrates the use of part-select expressions in the always block. The part-select expressions `fa0[3:0]` and `fa1[3:1]` select specific bits within the range of the `fa0` and `fa1` signals. The `fa2[5:0]` and `fa3[2:3]` part-select expressions select specific bits within the range of the `fa2` and `fa3` signals. These part-select expressions are used in assign statements to assign specific bits of the signals.

Remember that Verilog is a hardware description language, and part-select expressions are used to select specific ranges of bits within a signal. This is a common operation in hardware design, particularly when designing complex combinational logic circuits.

The `always @ (*)` construct is a procedural block that evaluates every time a change in the inputs occur. This is a common construct in Verilog for describing combinational logic. In this case, each part-select expression is used in the inside operator range list of an assign statement. This is an example of how to use part-select expressions within a procedural block to select and manipulate specific bits within signals.