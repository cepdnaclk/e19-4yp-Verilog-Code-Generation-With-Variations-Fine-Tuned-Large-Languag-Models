module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
parameter int my_array [4] = {13, 5, 9, 4};
always @(posedge Clock)
begin
    f = x1 & x2;
    g = f | x3;
    #1;
    case (my_array[1])
        0: f = x1;
        1: f = x2;
        2: f = x3;
        3: f = f & g;
        4: f = f | g;
        default: f = f ^ g;
    endcase
end
endmodule
### Assertions:
assert property (@(posedge Clock) disable iff (Reset) f |-> f[0]);
assert property (@(posedge Clock) disable iff (Reset) not(f) |-> not(f[0]));