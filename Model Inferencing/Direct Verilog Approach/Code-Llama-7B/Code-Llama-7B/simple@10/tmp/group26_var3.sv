module gad(o,i);
    output [1:0] o;
    input [1:0] i;
    assign o[0] = i[0] & i[1];
    assign o[1] = i[1] | i[0];
endmodule
module gade(a,b,c,d);
input b,c,d;
output [1:0] a;
wire [1:0] temp;
gad ff1(a,temp[1:0],d); // gad is unpacked-gad
gad ff2(temp[1:0],b,c); // gad is unpacked-g