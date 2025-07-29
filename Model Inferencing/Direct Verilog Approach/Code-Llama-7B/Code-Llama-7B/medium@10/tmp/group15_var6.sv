```verilog
timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout = left[3:0] + right[3:0];
        1: ALUout = left[3:0] - right[3:0];
        2: ALUout = left[3:0] & right[3:0];
        3: ALUout = left[3:0] | right[3:0];
        default: ALUout = 8'bX;
    endcase
end
endmodule
```

### Skeleton Code:

```verilog
timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout = left[3:0] + right[3:0];
        1: ALUout = left[3:0] - right[3:0];
        2: ALUout = left[3:0] & right[3:0];
        3: ALUout = left[3:0] | right[3:0];
        default: ALUout = 8'bX;
    endcase
end
endmodule
```

### Test Bench Code:

```verilog
timescale 1ns/100ps
module ALU8_tb();
reg [7:0] left, right;
reg [1:0] mode;
wire [7:0] ALUout;
ALU8 dut(left, right, mode, ALUout);
initial begin
    left = 8'b00110000;
    right = 8'b00001011;
    mode = 0;
    #1;
    $display("Left = %b, Right = %b, ALUout = %b", left, right, ALUout);
    $stop;
end
endmodule
```

### Output:

![output](https://user-images.githubusercontent.com/91019041/163982390-28f16893-bb71-4727-8651-676e7d204c