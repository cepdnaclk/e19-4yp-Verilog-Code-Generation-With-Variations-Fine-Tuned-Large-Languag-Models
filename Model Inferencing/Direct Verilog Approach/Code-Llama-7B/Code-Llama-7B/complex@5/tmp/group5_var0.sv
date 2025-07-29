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
module top();
import sv_rtl_pkg::*;
parameter N = 2;
parameter T = 4;
parameter B = 3;
initial begin
    $dumpfile("mealy.vcd");
    $dumpvars(0, mealy);
end
reg Clock, Resetn;
reg [N-1:0] w, w_next;
wire z;
initial begin
    Clock = 1;
    repeat(10) #10 Clock = ~Clock;
    Resetn = 1;
    repeat(10) #10 Resetn = 1;
end
always #10 Clock = ~Clock;
initial begin
    w = 0;
    $display("Initial w = %b", w);
    repeat(T) begin
        #1;
        w = w_next;
        $display("%t w = %b z = %b", $time, w, z);
    end
    $finish;
end
mealy #(N, T) dut(.