```sv
class fsm;
    int unsigned y;
    bit w;
    bit z;
    bit[1:0] Y;
    bit[3:0] w_array;
    bit[3:0] w_mask;
    function new(bit[1:0] y, bit w, bit z, bit[1:0] Y, bit[3:0] w_array, bit[3:0] w_mask);
        this.y = y;
        this.w = w;
        this.z = z;
        this.Y = Y;
        this.w_array = w_array;
        this.w_mask = w_mask;
    endfunction
    function bit[3:0] array_slice(bit[3:0] array, bit[3:0] mask);
        return array & mask;
    endfunction
    function void update_state();
        case(y[1:0])
            A: 
                begin
                    z = array_slice(w_array, w_mask)? 1'b0 : 1'b0;
                    Y = A & ~w_mask? B : A;
                end
            B: 
                begin
                    z = array_slice(w_array, w_mask)? 1'b1 : 1'b0;
                    Y = A & ~w_mask? B : A;
                end
            default: 
                begin
                    z = 1'b0;
                    Y = A;
                end
        endcase
    endfunction
endclass
```
You would initialize this class like:
```sv
fsm f = new(A, 1, 0, B, 4'b1111, 4'b0100);
```
And `update_state` function would be used to update `y`:
```sv
f.update_state();
```
Please note that the above code is in SystemVerilog, and it is equivalent to the original Verilog code. Please make sure to run this code in a simulator environment which supports SystemVerilog.### 

This `fsm` class includes a method, `array_slice`