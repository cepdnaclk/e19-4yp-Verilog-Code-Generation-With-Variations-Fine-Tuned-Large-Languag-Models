module mealy(Clock, Resetn, w, z);
input Clock, Resetn, w;
output z;
reg y, Y, z;
parameter A = 0, B = 1;
always @(w or y)
    case (y)
        A: begin
            z = 0;
            Y = B;
        end
        B: begin
            z = 1;
            Y = B;
        end
    endcase
always @(negedge Resetn or posedge Clock)
    if (Resetn == 0) y <= A;
    else y <= Y;
endmodule
### Testbench:
class tb_mealy9;
    logic w, z;
    logic Clock, Resetn;
    logic clk;
    logic [1:0] y;
    logic [1:0] Y;
    logic [1:0] Z;
    logic [1:0] a;
    Mealy mealy (
           .Clock(clk),
           .Resetn(Resetn),
           .w(w),
           .z(z)
    );
    initial begin
        clk = 0;
        Resetn = 0;
        w = 1;
        z = 0;
        #10;
        $dumpfile("mealy9.vcd");
        $dumpvars(0, tb_mealy9);
    end
    initial begin
        forever #10 clk = ~clk;
        #10;
    end
    initial begin
        forever #10 Resetn = ~Resetn;
        #10;
    end
    initial begin
        forever #10 w = ~w;
        #10;
    end
    initial begin
        forever #10 a = 2'b00;
        #10;
    end
    initial begin
        forever #10 a = 2'b01;
        #10;
    end
    initial begin
        forever #10 a = 2'b10;
        #10;
    end
    initial begin
        forever #10 a = 2'b11;
        #10;
    end
    initial begin
        forever #10 w = ~w;
        #10;
    end
    initial begin
        forever #10 w = ~w;
        #10;
    end
    initial begin
        forever #10 w = ~w;
        #10;
    end
    initial begin
        forever #10 y = a;
        #10;
    end
endclass
### GTKWave:
![mealy9](./mealy9.png)