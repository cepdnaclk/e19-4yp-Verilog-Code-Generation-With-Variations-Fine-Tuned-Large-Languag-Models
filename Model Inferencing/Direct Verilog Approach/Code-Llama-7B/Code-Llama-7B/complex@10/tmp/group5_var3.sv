class mealy_t;
rand bit w;

reg y, y_next, z;

parameter A = 0, B = 1;
parameter Y_A = 0, Y_B = 1;
bit [A:Y_B] Y = {Y_A, Y_B};

function void update_state();
    case (y)
        A: if (w)
            begin
                z = 0;
                y_next = Y[B];
            end
        else
            begin
                z = 0;
                y_next = Y[A];
            end
        B: if (w)
            begin
                z = 1;
                y_next = Y[B];
            end
        else
            begin
                z = 0;
                y_next = Y[A];
            end
    endcase
endfunction

function void reset();
    y = A;
    y_next = A;
    z = 0;
endfunction

function void post_randomize();
    $display("w = %0d y = %0d y_next = %0d z = %0d", w, y, y_next, z);
endfunction

function void pre_randomize();
endfunction

constraint c1 { w inside {0, 1}; }

function new();
endfunction
endclass

### Test Code:
module test;
initial
begin
    mealy_t my_mealy = new();
    my_mealy.randomize();
    $finish();
end
endmodule