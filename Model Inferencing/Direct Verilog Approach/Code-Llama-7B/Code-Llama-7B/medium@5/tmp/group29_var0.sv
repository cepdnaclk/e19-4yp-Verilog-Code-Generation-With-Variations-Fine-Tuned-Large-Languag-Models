module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
always @(posedge Clock)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule

module top;
wire [1:0]sel;
wire [3:0]data;
wire [3:0]out;
reg clock;
reg clk = 0;
integer i;
initial
    begin
        clock = 1;
        repeat(30)
        #10 clock =!clock;
        $finish;
    end
initial
    begin
        for(i = 0; i < 1; i = i + 1)
        begin
            #10
            case(sel)
                0 : data = 4'b1010;
                1 : data = 4'b0101;
                2 : data = 4'b1100;
                3 : data = 4'b0011;
            endcase
            #10
            sel = sel + 1;
        end
    end
always @(posedge clock)
    clk =!clk;
initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars(0, top);
    end
    muxdff #(.D0(data[i]))a(data[i], data[!i], sel[i], clock, out[i]);
endmodule

### Final Code:
module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
always @(posedge Clock)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule

module top;
wire [1:0]sel;
wire [3:0]data;
wire [3:0]out;
reg clock;
reg clk = 0;
integer i;
initial
    begin
        clock = 1;
        repeat(30)
        #10 clock =!clock;
        $finish;
    end
initial
    begin
        for(i = 0; i < 1; i = i + 1)
        begin
            #10
            case(sel)
                0 : data = 4'b1010;
                1 : data = 4'b0101;
                2 : data = 4'b1100;
                3 : data = 4'b0011;
            endcase
            #10
            sel = sel + 1;
        end
    end
always @(posedge clock)
    clk =!clk;
initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars(0, top);
    end
    muxdff #(.D0(data[i]))a(data