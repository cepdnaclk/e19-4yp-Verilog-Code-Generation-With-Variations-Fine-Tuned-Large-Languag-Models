module hex_to_7seg_decoder (seg, HEX);
/*inside {x = 8'h0; x[0] = 1'b0; x[1] = 1'b1; x[2] = 1'b0; x[3] = 1'b0;}*/
/*inside {x = 8'h1; x[0] = 1'b0; x[1] = 1'b1; x[2] = 1'b1; x[3] = 1'b1;}*/
/*inside {x = 8'h2; x[0] = 1'b0; x[1] = 1'b0; x[2] = 1'b0; x[3] = 1'b0;}*/
/*inside {x = 8'h3; x[0] = 1'b0; x[1] = 1'b1; x[2] = 1'b0; x[3] = 1'b0;}*/
/*inside {x = 8'h4; x[0] = 1'b0; x[1] = 1'b1; x[2] = 1'b0; x[3] = 1'b1;}*/
/*inside {x = 8'h5; x[0] = 1'b0; x[1] = 1'b1; x[2] = 1'b0; x[3] = 1'b1;}*/
/*inside {x = 8'h6; x[0] = 1'b0; x[1] = 1'b1; x[2] = 1'b1; x[3] = 1'b0;}*/
/*inside {x = 8'h7; x[0] = 1'b0; x[1] = 1'b1; x[2] = 1'b1; x[3] = 1'b1;}*/
/*inside {x = 8'h8; x[0] = 1'b0; x[1] = 1'b0; x[2] = 1'b0; x[3] = 1'b0;}*/
/*inside {x = 8'h9; x[0] = 1'b0; x[1] = 1'b0; x[2] = 1'b0; x[3] = 1'b1;}*/
/*inside {x = 8'ha; x[0] = 1'b1; x[1] = 1'b0; x[2] = 1'b0; x[3] = 1'b0;}*/
/*inside {x = 8'hb; x[0] = 1'b1; x[1] = 1'b1; x[2] = 1'b1; x[3] = 1'b0;}*/
/*inside {x = 8'hc; x[0] = 1'b1; x[1] = 1'b0; x[2] = 1'b1; x[3] = 1'b0;}*/
/*inside {x = 8'hd; x[0] = 1'b1; x[1] = 1'b1; x[2] = 1'b0; x[3] = 1'b0;}*/
/*inside {x = 8'he; x[0] = 1'b0; x[1] = 1'b1; x[2] = 1'b1; x[3] = 1'b0;}*/
/*inside {x = 8'hf; x[0] = 1'b0; x[1] = 1'b1; x[2] = 1'b1; x[3] = 1'b1;}*/
reg [2: 0] x;
reg [7: 0] HEX;
reg [6: 0] seg;
always @ (HEX[3: 0]) begin
case (HEX[3: 0])
0: seg = x;
1: seg = x;
2: seg = x;
3: seg = x;
4: seg = x;
5: seg = x;