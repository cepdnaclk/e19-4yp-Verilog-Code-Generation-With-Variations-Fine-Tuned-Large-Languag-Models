```
class dff_inside;
    input Clock, D;
    output Q;
    wire i_q;
    always @(Clock)
        Q <= i_q;
    always @(D or Clock)
        i_q <= D;
endclass

module dff(clock, D, Q);
    wire i_clock, i_d;
    wire i_q;
    parameter A = 0, B = 1;
    dff_inside dff_inside_mod(
       .clock(clock),
       .D(D),
       .Q(i_q)
    );
    assign q = i_q;
endmodule
```
### Testbench File:
```
module dff_inside_tb;
    reg clock;
    reg D;
    wire Q;

    parameter A = 0, B = 1;

    dff_inside dff_inside_mod(
       .clock(clock),
       .D(D),
       .Q(Q)
    );

    initial begin
        D = 0;
        clock = 0;
        #1;
        while (1) begin
            #1;
            clock = ~clock;
            #1;
            if (clock == 1) begin
                D = ~D;
                #100;
            end
        end
    end

    initial begin
        $dumpfile("dff_inside_dump.vcd");
        $dumpvars(0, dff_inside_tb);
        #1000000000;
    end
endmodule

module dff_tb;
    initial begin
        fork
            dff_inside_tb;
        join
    end
endmodule
```
### Dumping VCD
<img src="https://raw.githubusercontent.com/namanphy/verilogExamples/master/dff_inside/output.png">