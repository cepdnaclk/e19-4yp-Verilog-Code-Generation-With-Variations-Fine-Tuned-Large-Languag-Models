reg[15:0] a, b, c, d, e;
    initial
    begin
        #10 a <= $random;
        #10 b <= $random;
        #10 c <= a + b;
        #10 d <= $random;
        #10 e <= $random;
    end
    always @(*)
    begin
        if(e >=$signed(a) && e>=b)
            if(e>=a+b)
                if(e>=c)
                    assert(e>=d);
    end