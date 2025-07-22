```verilog
module Johnson_Counter (count, enable, clock, reset);
    output [3: 0] count;
    input enable;
    input clock, reset;
    reg [3: 0] count;

    wire [3: 0] static_count [15:0];

    genvar i;
    generate
        for (i = 0; i < 16; i++) begin
            assign static_count[i] = i;
        end
    endgenerate

    always @ (posedge clock, posedge reset) begin
        if (reset == 1'b1)
            count <= 4'b0;
        else if (enable == 1'b1) begin
            case (count)
                4'b0000,
                4'b0001,
                4'b0011,
                4'b0111,
                4'b0110,
                4'b0100,
                4'b0000: 
                    count <= static_count[i + 1];
                default: count <= 4'b0;
            endcase
        end
    end
endmodule

module t_Johnson_Counter ();
    wire [3: 0] count;
    reg enable;
    reg clock, reset;
    Johnson_Counter M0 (count, enable, clock, reset);
    initial #500 $finish;
    initial begin clock = 0; forever #5 clock = ~clock; end
    initial fork
        begin
            reset <= 1; enable <= 0;
            #10
            reset <= 0; enable <= 1;
            #20
            $finish;
        end
    join
endmodule
```

This code generates a Johnson counter. The `static_count` static array is used to hold the expected output values. The generate block is used to create an array with values from 0 to 15. The `enable` signal is used to enable counting, and the `reset` signal is used to reset the counter to 0. The `count` output is the current value of the Johnson counter. The `t_Johnson_Counter` testbench is used to test the