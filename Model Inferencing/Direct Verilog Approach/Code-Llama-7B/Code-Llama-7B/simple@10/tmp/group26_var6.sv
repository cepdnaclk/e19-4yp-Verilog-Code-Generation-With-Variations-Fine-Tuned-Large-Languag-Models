module gade(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;
// Instantiate OR gate with inertial delay 3
or #3 gg1(a1,c1,b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(a,c,b);
endmodule
### Unit Test:
def test():
        gade()
        gade1 = gade()
        gade2 = gade()
        gade1.a1 = 1
        gade1.b = 1
        gade1.c = 0
        gade1.c1 = 0
        gade1.b1 = 1
        assert gade1.a == 1
        assert gade2.a == 1
        assert gade1.a1 == 1
        assert gade2.a1 == 1

        gade2.a1 = 1
        gade2.b = 1
        gade2.c = 0
        gade2.c1 = 0
        gade2.b1 = 1
        assert gade2.a == 1
        assert gade1.a == 1
        assert gade2.a1 == 1
        assert gade1.a1 == 1
test()