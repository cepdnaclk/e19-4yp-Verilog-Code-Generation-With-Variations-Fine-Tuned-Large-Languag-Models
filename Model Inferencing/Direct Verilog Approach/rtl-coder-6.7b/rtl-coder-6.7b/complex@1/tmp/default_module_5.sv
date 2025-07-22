class mealy;
    parameter A = 0,
                B = 1;
    randc bit [(A+1)] y;
    bit z;
    bit [0:0] w;
    bit X;
    constraint w_c {
        w[0] inside {0, 1};
    }
    constraint y_c {
        y == A;
        y[0] == A;
        y[1] == B;
    }
    task transition();
        X = y;
        z = w;
        case (y)
            A: if (w)
                begin
                    X = B;
                    z = 0;
                end
            else
                begin
                    X = A;
                    z = 0;
                end
            B: if (w)
                begin
                    X = B;
                    z = 1;
                end
            else
                begin
                    X = A;
                    z = 0;
                end
        endcase
        y = X;
    endtask
endclass

module mealy(Clock, Resetn, w, z);
input Clock, Resetn, w [0:0];
output reg z;
mealy mealy_inst ();
initial
    begin
        mealy_inst.y[0] = mealy_inst.A;
        mealy_inst.y[1] = mealy_inst.B;
        mealy_inst.z = 0;
    end
always @ (posedge Clock)
    begin
        mealy_inst.w = w;
        mealy_inst.transition();
        z = mealy_inst.z;
    end
endmodule