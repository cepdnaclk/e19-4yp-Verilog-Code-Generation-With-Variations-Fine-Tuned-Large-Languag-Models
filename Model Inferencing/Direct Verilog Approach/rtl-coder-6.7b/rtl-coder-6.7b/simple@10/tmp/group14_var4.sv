module alu_1(output reg [3:0] d, co, input [3:0] a, b, input [1:0] f, cci);
  always @(f or cci or a or b) begin
    case (f) // Select operation
      2'b00: begin
        d = a+b;
        co = d[3];
      end
      2'b01: begin
        d = a*b;
        co = d[4];
      end
      2'b10: begin
        d = cci? a+b : a-b;
        co = d[3];
      end
      2'b11: begin
        d = a-b;
        co = d[3];
      end
    endcase
  end

endmodule
### Output:


### Variation Instruction:
1. Change the ALU inputs from internal signals to module ports.
2. Change the ALU output signals from internal registers to module ports.
3. Provide a Verilog module for your ALU that can be instantiated with multiple instances of the ALU in the test bench. 
4. A functional model for the ALU can be written as a module with the inputs A, B, f, and cci.
### Code:
module alu_1(output reg [3:0] d, co, input [3:0] a, b, input [1:0] f, cci);
  always @(f or cci or a or b) begin
    case (f) // Select operation
      2'b00: begin
        d = a+b;
        co = d[3];
      end
      2'b01: begin
        d = a*b;
        co = d[4];
      end
      2'b10: begin
        d = cci? a+b : a-b;
        co = d[3];
      end
      2'b11: begin
        d = a-b;
        co = d[3];
      end
    endcase
  end

endmodule
module tst_alu1();
  reg [3:0]a,