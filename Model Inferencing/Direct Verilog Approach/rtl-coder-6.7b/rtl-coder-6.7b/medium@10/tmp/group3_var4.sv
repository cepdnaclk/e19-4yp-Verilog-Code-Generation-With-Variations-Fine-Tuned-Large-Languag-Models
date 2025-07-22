module FA;
    input a, b, c_in;
    output s, c_out;

    assign s = $random;
    assign c_out = $random;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
 
    always begin
        fa0.a = $random;
        fa0.b = $random;
        fa0.c_in = $random;
        // Select a subset of the module port.
        fa0.s[0:1] = $random;
        fa0.c_out[0:3] = $random;
    end
endmodule