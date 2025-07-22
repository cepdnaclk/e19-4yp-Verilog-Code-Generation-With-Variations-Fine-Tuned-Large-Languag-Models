```verilog
module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
    output [3: 0] Data_Out;
    output MSB_Out, LSB_Out;
    input [3: 0] Data_In;
    input MSB_In, LSB_In;
    reg [3: 0] Data_Out; // 10-12-2004
    input s1, s0, clk, rst;
    wire [1:0] shift_control;
    assign shift_control = {s1, s0};
    assign MSB_Out = Data_Out[3];
    assign LSB_Out = Data_Out[0];
    always @ (posedge clk) begin
        if (rst) Data_Out <= 0;
        else
            case (shift_control)
                2'b00: Data_Out <= Data_Out; // Idle
                2'b01: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
                2'b10: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
                2'b11: Data_Out <= Data_In; // Parallel Load
            endcase
    end
endmodule
```
This modified code encapsulates the control signals into a packed array called `shift_control` and use this array as a case statement.

### Test Plan:

Verify initial reset
Verify idle
Verify shift right
Verify shift left
Verify parallel load
Verify reset-on-the-fly

The test plan should be exactly the same as the initial one, with slight modifications to fit the new Verilog code logic.

### Modified Clock Generator Code for 10-bit clock:
```verilog
module Clock_Gen(clk);
    output reg clk;
    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end
end