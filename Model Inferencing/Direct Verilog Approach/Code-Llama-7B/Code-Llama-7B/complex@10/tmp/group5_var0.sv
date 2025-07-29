```
interface Mealy;
    logic w;
    logic y;
    logic z;
    logic Clock;
    logic Resetn;
endinterface
module mealy(Mealy);
    always_ff @(posedge Mealy.Clock )
        begin
            Mealy.y <= Mealy.w? Mealy.y + 1'b1 : Mealy.y;
        end
endmodule
```
### Testbench Code:
```
module tb_mealy(Mealy);
    initial begin
        Mealy.Resetn <= 0;
        Mealy.Clock <= 0;
        $timeformat(-9, 1, "ns");
        #1ns Mealy.Resetn <= 1;
        Mealy.w <= 0;
        #4ns $finish(2);
    end
    always begin
        #2ns Mealy.Clock = ~Mealy.Clock;
    end
endmodule
```
### SV-TLM Code:
```
class Mealy;
    rand bit [1:0] w;
    rand bit y;
    rand bit z,Y;
    rand bit Clock, Resetn;
    constraint c_reset {Resetn == 0;}
    constraint c_clock {Clock == 0;}
    constraint c_w {w inside {1'b0, 1'b1};}
    constraint c_y {y inside {1'b0, 1'b1};}
    constraint c_z {z inside {1'b0, 1'b1};}
    constraint c_Y {Y inside {1'b0, 1'b1};}
    constraint c_Clock {Clock inside {1'b0, 1'b1};}
    constraint c_Resetn {Resetn inside {1'b0, 1'b1};}
    function new();
        y = 0;
        z = 0;
        Clock = 0;
        Resetn = 0;
    endfunction
    function void print();
        $display("w: %b", w);
        $display("y: %b", y);
        $display("z: %b", z);