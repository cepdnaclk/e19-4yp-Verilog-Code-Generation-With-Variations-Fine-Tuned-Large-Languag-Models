module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;

wire [1:0] index;

reg [1:0] array [0:5] = '{
   {0, 1},
   {1, 0},
   {1, 1},
   {0, 0},
   {0, 1},
   {1, 1}
};

always @(posedge Clock)
begin
    case(index[0]+index[1]*2)
        array[0][0]: f = 0;
        array[1][0]: f = 1;
        array[2][0]: f = 0;
        array[3][0]: f = 1;
        array[4][0]: f = 1;
        array[5][0]: f = 0;
        array[0][1]: f = 1;
        array[1][1]: f = 0;
        array[2][1]: f = 1;
        array[3][1]: f = 0;
        array[4][1]: f = 1;
        array[5][1]: f = 0;
        default:  f = 0;
    endcase

    case(index[0]+index[1]*2)
        array[0][0]: g = 0;
        array[1][0]: g = 1;
        array[2][0]: