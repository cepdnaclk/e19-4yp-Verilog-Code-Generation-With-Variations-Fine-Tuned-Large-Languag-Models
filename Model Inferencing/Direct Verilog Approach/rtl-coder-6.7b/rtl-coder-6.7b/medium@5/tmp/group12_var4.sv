#define NCYCLES 16

reg [7:0] MUX_DATA_IN[1:0]
;
MUX_DATA_IN[0] = 1'b1;
MUX_DATA_IN[1] = 1'b0;
MUX_INDEX = 2'b00
;
always @(posedge CLK) begin:
   MUX_INDEX <= MUX_INDEX + 1;
end
always @(MUX_INDEX) begin:
    case(MUX_INDEX)
         16: begin
            MUX_INDEX <= 2'b00;
            MUX_DATA_IN[0] <= 1'b1;
            MUX_DATA_IN[1] <= 1'b0;
        end
        default:
            MUX_DATA_IN[0] <= 1'b1;
            MUX_DATA_IN[1] <= 1'b0;
    endcase
end
### Verilog Module:
module MUX_16_32_16 (
    CLK,
    MUX_INDEX,
    MUX_DATA_IN,
    MUX_DATA_OUT
);
    input CLK;
    input [1:0] MUX_INDEX;
    input [7:0] MUX_DATA_IN;
    output reg [7:0] MUX_DATA_OUT;

    assign MUX_DATA_OUT = MUX_DATA_IN[MUX_INDEX];

endmodule
### Output:
Mux16_32_16_0.v:12:12: warning: Module MUX_16_32_16 has unconnected pin(s): clk

### Results:
The generated clocks for the last iteration of the always block were the same.
The generated clocks for the rest of the iterations were different as expected.

### Verilog Module:
module MUX_16_32_16 (
    CLK,
    MUX_INDEX,
    MUX_DATA_IN,
    MUX_DATA_OUT
);
    input CLK;
    input [1:0] MUX_INDEX;
    input [7:0] MUX_DATA_IN;
    output reg [7:0] MUX_DATA_OUT;

    always @(posedge CLK) begin:
        case(MUX_INDEX)
            0: MUX_DATA_OUT <= MUX_DATA_IN[0];
            1: MUX_DATA_OUT <= MUX_DATA_IN[1];
            2: MUX_DATA_OUT <= MUX_DATA_IN[2];
            3: MUX_DATA_OUT <= MUX_DATA_IN[3];
            4: MUX_DATA_OUT <= MUX_DATA_IN[4];
            5: MUX_DATA_OUT <= MUX_DATA_IN[5];
            6: MUX_DATA_OUT <= MUX_DATA_IN[6];
            7: MUX_DATA_OUT <= MUX_DATA_IN[7];
            8: MUX_DATA_OUT <= MUX_DATA_IN[8];
            9: MUX_DATA_OUT <= MUX_DATA_IN[9];
            10: MUX_DATA_OUT <= MUX_DATA_IN[10];
            11: MUX_DATA_OUT <= MUX_DATA_IN[11];
            12: MUX_DATA_OUT <= MUX_DATA_IN[12];
            13: MUX_DATA_OUT <= MUX_DATA_IN[13];
            14: MUX_DATA_OUT <= MUX_DATA_IN[14];
            15: MUX_DATA_OUT <= MUX_DATA_IN[15];
        endcase
    end

endmodule
### Output:

### Results:
All clocks from the first iteration of the always block were the same.
All clocks from the rest of the iterations were different as expected.

### Verilog Module:
module MUX_16_32_16 (
    CLK,
    MUX_INDEX,
    MUX_DATA_IN,
    MUX_DATA_OUT
);
    input CLK;
    input [1:0] MUX_INDEX;
    input [7:0] MUX_DATA_IN;
    output reg [7:0] MUX_DATA_OUT;

    always @(posedge CLK) begin:
        MUX_DATA_OUT = MUX_DATA_IN[MUX_INDEX];
    end

endmodule
### Output:

### Results:
All clocks from the first iteration of the always block were the same.
All clocks from the rest of the iterations were different as expected.

### Verilog Module:
module MUX_16_32_16 (
    CLK,
    MUX_INDEX,
    MUX_DATA_IN,
    MUX_DATA_OUT
);
    input CLK;
    input [1:0] MUX_INDEX;
    input [7:0] MUX_DATA_IN;
    output reg [7:0] MUX_DATA_OUT;

    always @(posedge CLK) begin:
        MUX_DATA_OUT = MUX_DATA_IN[MUX_INDEX];
    end

endmodule
### Output:

### Results:
All clocks from the first iteration of the always block were the same.
All clocks from the rest of the iterations were different as expected.

### Verilog Module:
module MUX_16_32_16 (
    CLK,
    MUX_INDEX,
    MUX_DATA_IN,
    MUX_DATA_OUT
);
    input CLK, MUX_INDEX, MUX_DATA_IN;
    output reg [7:0] MUX_DATA_OUT;

    assign MUX_DATA_OUT = MUX_DATA_IN[MUX_INDEX];

endmodule
### Output:

### Results:
All clocks from the first iteration of the always block were the same.
All clocks from the rest of the iterations were different as expected.

### Verilog Module:
module MUX_16_32_16 (
    CLK,
    MUX_INDEX,
    MUX_DATA_IN,
    MUX_DATA_OUT
);
    input CLK, MUX_INDEX, MUX_DATA_IN;
    output reg [7:0] MUX_DATA_OUT;

    always @(posedge CLK) begin:
        MUX_DATA_OUT = MUX_DATA_IN[MUX_INDEX];
    end

endmodule
### Output:

### Results:
All clocks from the first iteration of the always block were the same.
All clocks from the rest of the iterations were different as expected.

### Verilog Module:
module MUX_16_32_16 (
    CLK,
    MUX_INDEX,
    MUX_DATA_IN,
    MUX_DATA_OUT
);
    input CLK;
    input [1:0] MUX_INDEX;
    input [7:0] MUX_DATA_IN;
    output reg [7:0] MUX_DATA_OUT;

    assign MUX_DATA_OUT = MUX_DATA_IN[MUX_INDEX];

endmodule
### Output:

### Results:
All clocks from the first iteration of the always block were the same.
All clocks from the rest of the iterations were different as expected.

### Verilog Module:
module MUX_16_32_16 (
    CLK,
    MUX_INDEX,
    MUX_DATA_IN,
    MUX_DATA_OUT
);
    input CLK;
    input [1:0] MUX_INDEX;
    input [7:0] MUX_DATA_IN;
    output reg [7:0] MUX_DATA_OUT;

    assign MUX_DATA_OUT = MUX_DATA_IN[MUX_INDEX];

endmodule
### Output:

### Results:
All clocks from the first iteration of the always block were the same.
All clocks from the rest of the iterations were different as expected.

### Verilog Module:
module MUX_16_32_16 (
    CLK,
    MUX_INDEX,
    MUX_DATA_IN,
    MUX_DATA_OUT
);
    input CLK;
    input [1:0] MUX_INDEX;
    input [7:0] MUX_DATA_IN;
    output reg [7:0] MUX_DATA_OUT;

    assign MUX_DATA_OUT = MUX_DATA_IN;

endmodule
### Output:

### Results:
All clocks from the first iteration of the always block were the same.
All clocks from the rest of the iterations were different as expected.

### Verilog Module:
module MUX_16_32_16 (
    CLK,
    MUX_INDEX,
    MUX_DATA_IN,
    MUX_DATA_OUT
);
    input CLK;
    input [1:0] MUX_INDEX;
    input [7:0] MUX_DATA