```
module mealy_slice(Clock, Resetn, w, z);
input Clock, Resetn, w[1:0];
output z;
reg y, Y, z;
parameter A = 0, B = 1;
always @(w[0] or w[1] or y)
    case (y)
        A: if (w[0] && w[1])
            begin
                z = 0;
                Y = B;
            end
        else if (w[0])
            begin
                z = 0;
                Y = A;
            end
        else
            begin
                z = 1;
                Y = B;
            end
        B: if (w[0] && w[1])
            begin
                z = 1;
                Y = B;
            end
        else if (w[0])
            begin
                z = 0;
                Y = A;
            end
        else
            begin
                z = 1;
                Y = A;
            end
    endcase
always @(negedge Resetn or posedge Clock)
    if (Resetn == 0) y <= A;
    else y <= Y;
endmodule
class mealy_slice_class;
static logic Clock, Resetn, w[1:0];
logic z;
logic y, Y, z;
parameter A = 0, B = 1;
always @(w[0] or w[1] or y)
    case (y)
        A: if (w[0] && w[1])
            begin
                z = 0;
                Y = B;
            end
        else if (w[0])
            begin
                z = 0;
                Y = A;
            end
        else
            begin
                z = 1;
                Y = B;
            end
        B: if (w[0] && w[1])
            begin
                z = 1;
                Y = B;
            end
        else if (w[0])
            begin
                z = 0;
                Y = A;
            end
        else
            begin
                z = 1;
                Y = A;
            end
    endcase
always @(negedge Resetn or posedge Clock)
    if (Resetn == 0) y <= A;
    else y <= Y;
endclass
module mealy_slice_instance(Clock, Resetn, w, z);
input Clock, Resetn, w[1:0];
output z;
mealy_slice_class my_inst;
endmodule
### Test Bench:
module mealy_slice_tb;
reg Clock, Resetn;
reg w[1:0];
wire z;
initial begin
    Clock = 0;
end
always begin
    Clock = ~Clock;
end
initial begin
    Resetn = 1;
    w[0] = 0;
    w[1] = 0;
    #2
    w[0] = 1;
    w[1] = 0;
    #2
    w[0] = 0;
    w[1] = 1;
    #2
    w[0] = 0;
    w[1] = 0;
    #2
    w[0] = 1;
    w[1] = 1;
    #2
    w[0] = 1;
    w[1] = 0;
    #2
    w[0] = 0;
    w[1] = 1;
    #2
    w[0] = 1;
    w[1] = 1;
    #2
    $finish;
end
mealy_slice_instance mealy_slice_1(Clock, Resetn, w, z);
endmodule
```
### Test Bench Result:
![image](https://user-images.githubusercontent.com/12651024/160001077-8775cfbf-c700-4167-b74f-a7e6f898c7df.png)
### Conclusion:
The code below is equivalent to