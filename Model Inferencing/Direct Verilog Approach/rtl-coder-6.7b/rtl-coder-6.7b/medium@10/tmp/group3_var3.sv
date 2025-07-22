module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    genvar p;
    generate
        for(p=0; p<4; p=p+1)begin:g1
            assign {fa0.a[p], fa0.b[p], fa0.cin[p]} = {fa1.a[p], fa1.b[p], fa1.cin[p]};
        end
    endgenerate
endmodule
### Expected Output:
Syntax Errors:
ERROR:F:/SJSU/SJSU-Student/2018-2019_Spring/Hardware_Design/HW_9/Ripple_Add/src/Ripple_Add.v(13): (near "{") Syntax error.
ERROR:F:/SJSU/SJSU-Student/2018-2019_Spring/Hardware_Design/HW_9/Ripple_Add/src/Ripple_Add.v(13): (near "{fa0.a[p], fa0.b[p], fa0.cin[p]") Syntax error.
ERROR:F:/SJSU/SJSU-Student/2018-2019_Spring/Hardware_Design/HW_9/Ripple_Add/src/Ripple_Add.v(13): (near ")") Syntax error.