module ALU_test_bench();
reg [7:0] a;
reg [7:0] b;
reg [7:0] ldsw;
reg [7:0] ldl;
wire [7:0] c;
wire [7:0] d;
wire [7:0] e;
wire [7:0] f;
wire [7:0] g;
wire [7:0] h;
reg [7:0] lds;
reg [7:0] cnt;
ALU ALU (
.a(a),
.b(b),
.c(c),
.d(d),
.e(e),
.f(f),
.g(g),
.h(h)
);
sw2led2 sw2led2(ldsw,cnt);
always @(posedge clk) begin
if(rst) begin
a <= 8'b00000000;
b <= 8'b00000000;
end
else if(en) begin
    case(op)
        8'b01110010:
        begin
            a <= a + 1'b1;
            b <= b + 1'b1;
        end
        8'b01110001:
        begin
            a <= a + 1'b1;
        end
        8'b01110110:
        begin
            b <= b + 1'b1;
        end
        8'b01110111:
        begin
            a <= a + 1'b1;
            b <= b + 1'b1;
        end
        8'b01111010:
        begin
            a <= a - 1'b1;
            b <= b - 1'b1;
        end
        8'b01111001:
        begin
            a <= a - 1'b1;
        end
        8'b01111110:
        begin
            b <= b - 1'b