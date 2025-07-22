module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = (
c[ s[1]? 3 : s[0]? 2 : 0 ]
);
endmodule

### Modified code in Python:

def gen(c, s):
    z = s[1]? 3 : s[0]? 2 : 0
    return c[z]