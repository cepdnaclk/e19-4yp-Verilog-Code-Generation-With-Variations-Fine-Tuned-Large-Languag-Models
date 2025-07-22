```verilog
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout = left + right;
        1: ALUout = left - right;
        2: ALUout = left & right;
        3: ALUout = left | right;
        default: ALUout = 8'bX;
    endcase
end
endmodule
```
The difference is that the modified code uses an always_comb block instead of an always @(left, right, mode) block. The always_comb block will only execute when inputs change, which results in more optimization for synthesis. It's useful when the output of the module is not supposed to change based on the input within every time unit. It helps in reducing simulation time and synthesis optimization. This is a more Verilog-2001 way of coding, but it's still synthesizable in earlier versions of Verilog. 

Note: Always_comb and always_latch attributes are introduced in IEEE 1364-2005 standard, and they are used to explicitly specify the timing and area constraints for combinational and latch elements, respectively. They are not synthesizable in Verilog-95. 

In this case, there are no combinational loops, thus it's not worth spending extra resource on these attributes. Always_comb has the advantage of being synthesizable in earlier standards.

In general, you may want to use always_comb for combinational logic, where you're expecting the output to change based on the input, and you're OK with synthesis tools making assumptions about how the logic is implemented. Otherwise, use always_latch for sequential logic (like latch or flip-flop) where the state of the logic depends on the input and the previous state. In this case, the timing constraints are more important because the state can change in the middle of the clock cycle.

In short, always_comb should be used for combinational logic, and always_latch should be used for sequential logic where the state can change in the middle of the clock cycle. 

Always_comb and always_latch are less useful in most cases