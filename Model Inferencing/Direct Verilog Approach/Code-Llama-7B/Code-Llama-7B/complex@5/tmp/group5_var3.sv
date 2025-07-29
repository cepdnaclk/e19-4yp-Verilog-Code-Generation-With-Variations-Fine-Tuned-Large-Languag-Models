module mealy(Clock, Resetn, w, z);
input Clock, Resetn, w;
output z;
reg y, Y, z;
parameter A = 0, B = 1;
always @(w or y)
    case (y)
        A: if (w)
            begin
                z = 0;
                Y = B;
            end
        else
            begin
                z = 0;
                Y = A;
            end
        B: if (w)
            begin
                z = 1;
                Y = B;
            end
        else
            begin
                z = 0;
                Y = A;
            end
    endcase
always @(negedge Resetn or posedge Clock)
    if (Resetn == 0) y <= A;
    else y <= Y;
endmodule
class mealy_state;
    localparam N = 2;
    logic [N-1:0] w;
    always @(w)
    begin
        logic [N-2:0] w_n;
        inside {w[1:N-1], w[0]} begin
            A : w_n = '0;
            B : w_n = '0;
            default : w_n = '0;
        end
        w = w_n;
    end
endclass
module top;
    mealy_state mealy_inst;
    mealy uut(.Clock,.Resetn,.w(mealy_inst.w),.z);
endmodule
### Original TestBench Code:
module mealy_tb;
reg clock, resetn;
reg w;
wire z;
mealy mr (.Clock(clock),.Resetn(resetn),.w(w),.z(z));
localparam T = 100;
initial
    begin
        resetn = 0;
        #T resetn = 1;
        #T w = 0;
        #T w = 1;
        #T w = 0;
        #T w = 1;
        #T $finish;
end
always #10 clock = ~clock;
endmodule
### Variation TestBench Code:
module mealy_tb;
reg clock, resetn;
reg w;
wire z;
mealy_state mealy_inst;
mealy u