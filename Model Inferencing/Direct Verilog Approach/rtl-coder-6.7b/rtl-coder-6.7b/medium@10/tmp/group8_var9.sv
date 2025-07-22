// This is a simple 4-to-1 multiplexer
module dec2_4beh(o,i);
input [1:0] i;
output reg [3:0] o;
// logic [3:0] o;
// logic en;

always@(*)
begin
    o = 4'b0;
    // o=0;
    if(i[1])
    begin
        o[i[0]] = 1;
        // o[0] = en & i[0];
        // o[1] = en & i[0];
    end
end
// assign o = en? i[1]? i[0]? 1 : 0 : 0 : 0 : 0 : 0 : 0 : 0 : 0;

endmodule
### Trace:
$ vlog tst_dec2_4beh.v
$ vsim -novopt tst_dec2_4beh
...
t = 0 :  output o = 0000, input i = 00
t = 1 :  output o = 0010, input i = 01
t = 2 :  output o = 0100, input i = 10
t = 3 :  output o = 1000, input i = 11
...
t = 14 :  output o = 0000, input i = 00
t =...
t =...
t =...
### Observations:
* The outputs from the two multiplexers are now independent of the enable signal.