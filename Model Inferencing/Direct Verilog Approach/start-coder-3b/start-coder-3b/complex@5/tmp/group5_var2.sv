```systemverilog
class FSM(Clock, Resetn, w, z);
    input Clock, Resetn;
    input [3:0] w;
    output z;
    parameter A = 0, B = 1;
    reg y, Y, z;
    always @(w or y)
        case (w[3:0])
            w[0]: A:
                if (w[0]) z <= 0;
                else z <= 0;
                Y <= B;
            w[1]: B:
                if (w[1]) z <= 1;
                else z <= 0;
                Y <= B;
            w[2]: B:
                if (w[2]) z <= 1;
                else z <= 0;
                Y <= B;
            w[3]: B:
                if (w[3]) z <= 1;
                else z <= 0;