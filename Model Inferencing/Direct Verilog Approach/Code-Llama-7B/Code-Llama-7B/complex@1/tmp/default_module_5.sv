module mealy(Clock, Resetn, w, z);
input Clock, Resetn, w;
output z;
reg y, Y, z;
parameter A = 0, B = 1;
always @(w or y)
    case (y)
        A: if (w inside {0, 1})
            begin
                z = 0;
                Y = B;
            end
        else
            begin
                z = 0;
                Y = A;
            end
        B: if (w inside {0, 1})
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
    if