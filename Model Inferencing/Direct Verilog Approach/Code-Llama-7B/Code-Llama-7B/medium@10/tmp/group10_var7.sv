module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
wire [3:0] a;
wire [3:0] b;
wire [3:0] c;
wire [3:0] d;
wire [3:0] e;
wire [3:0] f;
wire [3:0] g;
wire [3:0] h;
wire [3:0] i;
wire [3:0] j;
wire [3:0] k;
wire [3:0] x;
wire [3:0] y;
wire [3:0] z;
wire [3:0] m;
wire [3:0] n;
wire [3:0] o;
wire [3:0] p;
wire [3:0] q;
wire [3:0] r;
wire [3:0] s;
wire [3:0] t;
wire [3:0] u;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= D;
endmodule
array1 = {a, b, c, d};
array2 = {e, f, g, h};
array3 = {i, j, k, x};
array4 = {y, z, m, n};
array5 = {o, p, q, r};
array6 = {s, t, u, 4'b0};
array7 = array4  | array5 | array6;
assign Q = array1[D[3:0]] | array2[D[3:0]] | array3[D[3:0]] | array7[D[3:0]];
### Generated Code:
module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
wire [3:0] a;
wire [3:0] b;
wire [3:0] c;
wire [3:0] d;
wire [3:0] e;
wire [3:0] f;
wire [3:0] g;
wire [3:0] h;
wire [3:0] i;
wire [3:0] j;
wire [3:0] k;
wire [3:0] x;
wire [3:0] y;
wire [3:0] z;
wire [3:0] m;
wire [3:0] n;
wire [3:0] o;
wire [3:0] p;
wire [3:0] q;
wire [3:0] r;
wire [3:0] s;
wire [3:0] t;
wire [3:0] u;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= D;
endmodule
wire [3:0] a;
wire [3:0] b;
wire [3:0] c;
wire [3:0] d;
wire [3:0] e;
wire [3:0] f;
wire [3:0] g;
wire [3:0] h;
wire [3:0] i;
wire [3:0] j;
wire [3:0] k;
wire [3:0] x;
wire [3:0] y;
wire [3:0] z;
wire [3:0] m;
wire [3:0] n;
wire [3:0] o;
wire [3:0] p;
wire [3:0] q;
wire [3:0] r;
wire [3:0] s;
wire [3:0] t;
wire [3:0] u;
reg [3:0] Q;
// Continuous Assignment
assign Q = a | b | c | d | e | f | g | h |