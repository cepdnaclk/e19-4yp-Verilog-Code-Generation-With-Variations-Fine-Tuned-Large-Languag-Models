```
class array_slice_t;
    bit [3:0] array_slice;
    function new(bit [3:0] i);
        array_slice = i;
    endfunction
endclass
class mealy;
    bit [3:0] y, Y;
    bit Clock, Resetn, w, z;
    parameter A = 0, B = 1;
    function new(bit Cl, bit Rs, bit ww);
        Clock = Cl;
        Resetn = Rs;
        w = ww;
        y = A;
    endfunction
    function void clock();
        if (Resetn == 0) y <= A;
        else y <= Y;
    endfunction
    function void mealy_next(array_slice_t w);
        case (y)
            A: begin
                z = 0;
                if (w.array_slice) Y = B;
                else Y = A;
            end
            B: begin
                z = 1;
                if (w.array_slice) Y = B;
                else Y = A;
            end
        endcase
    endfunction
endclass
```