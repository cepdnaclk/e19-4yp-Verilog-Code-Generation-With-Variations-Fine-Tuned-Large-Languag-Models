module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
reg [1:0]sel ;
reg [1:0]en ;
dec2_4beh dec(o,i,sel,en);
initial
begin
i =2'b00;
sel = 2'b00;
en = 2'b00;
end
initial