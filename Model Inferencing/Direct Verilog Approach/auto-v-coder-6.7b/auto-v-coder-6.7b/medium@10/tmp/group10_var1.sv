```Verilog
module reg4(input [3:0] D,
            input Clock, Resetn,
            output reg [3:0] Q);
            
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else begin
        case(D)
            4'b0001: Q <= 4'b0001;
            4'b0010: Q <= 4'b0010;
            4'b0100: Q <= 4'b0100;
            4'b1000: Q <= 4'b100