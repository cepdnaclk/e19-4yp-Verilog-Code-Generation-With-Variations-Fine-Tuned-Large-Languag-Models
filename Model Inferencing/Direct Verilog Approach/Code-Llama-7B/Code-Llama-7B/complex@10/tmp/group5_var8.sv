class FSM_State;
    const int w_states[2] = '{0, 1};
    int y, Y;
    rand int w;
    constraint w_c {
        w inside {w_states};
    }
    function new();
        y = 0;
        Y = 0;
        w = 0;
    endfunction
endclass
module mealy(Clock, Resetn, w, z);
input Clock, Resetn, w;
output z;
reg y, Y, z;
parameter A = 0, B = 1;
FSM_State statemachine = new();
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
### Resulting VCD:
![image](https://user-images.githubusercontent.com/12136730/190860791-b7a41745-a4d9-4c00-a1b4-1bce279420cd.png)
### Verilog Code:
module state(out, in);
    output reg out;
    input in;
    initial out = 0;
    always @(*)
        case(out)
            0: if(in) out = 0;
               else out = 1;
            1: if(in) out = 1;
               else out = 0;
        endcase
endmodule