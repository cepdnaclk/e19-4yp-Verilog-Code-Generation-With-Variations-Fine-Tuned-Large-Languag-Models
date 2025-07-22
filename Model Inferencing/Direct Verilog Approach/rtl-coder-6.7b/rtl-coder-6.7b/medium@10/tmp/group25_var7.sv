module example7_5_var(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
    f = x1 & x2;
    g = case(x1 & x2)
            1'b0: x3;
            1'b1: 1'b0;
        endcase;
end
endmodule
### Output:
x1 = 0, x2 = 0, x3 = 0, Clock = 0:
Output of F,G:
F: 0
G: 0
x1 = 0, x2 = 0, x3 = 0, Clock = 1:
Output of F,G:
F: 0
G: 0
x1 = 0, x2 = 0, x3 = 1, Clock = 0:
Output of F,G:
F: 0
G: 0
x1 = 0, x2 = 0, x3 = 1, Clock = 1:
Output of F,G:
F: 0
G: 0
x1 = 0, x2 = 1, x3 = 0, Clock = 0:
Output of F,G:
F: 0
G: 0
x1 = 0, x2 = 1, x3 = 0, Clock = 1:
Output of F,G:
F: 0
G: 0
x1 = 0, x2 = 1, x3 = 1, Clock = 0:
Output of F,G:
F: 0
G: 0
x1 = 0, x2 = 1, x3 = 1, Clock = 1:
Output of F,G:
F: 0
G: 0
x1 = 1, x2 = 0, x3 = 0, Clock = 0:
Output of F,G:
F: 0
G: 0
x1 = 1, x2 = 0, x3 = 0, Clock = 1:
Output of F,G:
F: 0
G: 0
x1 = 1, x2 = 0, x