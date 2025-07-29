module addern(carryin, X, Y, S, carryout);
parameter n = 16;
input carryin;
input [n-1:0] X, Y;
output [n-1:0] S;
output carryout;
reg [n-1:0] S;
reg [n:0] C;
reg carryout;
integer k;
always @(X or Y or carryin)
begin
    C[0] = carryin;
    for (k = 0; k <= n-1; k = k + 1)
    begin
        S[k] = X[k] ^ Y[k] ^ C[k];
        C[k+1] = (X[k] & Y[k]) | (C[k] & X[k]) | (C[k] & Y[k]);
    end
    carryout = C[n];
end
endmodule
### Interface
interface addern_i;
logic [15:0] data;
endinterface
### Variation:
Add constant index 0 to the signal `data` inside addern using `inside` operator.
### Testbench Code:
module tb;
logic clk, sreset;
logic [15:0] x, y;
logic carryin;
logic [15:0] s;
logic carryout;
addern_i adder_i[2];
addern adder[2];
default clocking cb_adder @(posedge clk);
    default input #1 output #1;
    endclocking
initial begin
    clk = 0;
    sreset = 1;
end

assign adder_i[1].carryin = 0;
assign adder_i[0].carryin = 1;
assign adder_i[1].data = 16'b0000_0000_0000_0101;
assign adder_i[0].data = 16'b0000_0000_0000_0010;
always @(posedge clk)
begin
    x <= adder_i[1].data;
    y <= adder_i[0].data;
    carryin <= adder_i[1].carryin;
    s <= adder_i[1].data + adder_i[0].data;
    carryout <= adder_i[1].carryin | (~adder_i[1].carryin & (adder_i[1].data[15] ^ adder_i[0].data[15]));
    adder_i[0].data <= adder_i[0].data + 1;
    adder_i[1].data <= adder_i[1].data + 1;
end

initial begin
    forever #2 clk =!clk;
end

initial begin
    #100 $finish;
end

initial begin
    wait(!sreset);
    cb_adder.configure(adder_i[0], "adder_i[1].data", "wire", 0);
    cb_adder.configure(adder_i[0], "adder_i[0].data", "wire", 1);
    cb_adder.configure(adder_i[0], "adder_i[1].carryin", "wire", 2);
    cb_adder.configure(adder_i[0], "adder_i[0].carryin", "wire", 3);
    cb_adder.configure(adder[0], "S", "wire", 4);
    cb_adder.configure(adder[0], "carryout", "wire", 5);
    cb_adder.configure(adder[0], "car