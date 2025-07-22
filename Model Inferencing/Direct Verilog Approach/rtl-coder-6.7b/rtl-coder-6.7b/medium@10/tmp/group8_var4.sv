module dec2_4beh(o,i);
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
wire[3:0] y;
always @(i)
      begin
      y[0] = i[1:0] == 2'b00;
      y[1] = i[1:0] == 2'b01;
      y[2] = i[1:0] == 2'b10;
      y[3] = i[1:0] == 2'b11;