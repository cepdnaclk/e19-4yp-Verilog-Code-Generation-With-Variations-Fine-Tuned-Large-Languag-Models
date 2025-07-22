`include "svaunit.sv"
module sw2led_test;
svaunit_pkg::*;

  reg signed [7:0]in;
  reg [7:0]out,expected;

  sw2led2 dut(in,out);

  initial begin
    // test $signed
    in = 32'd-2;
    expected = -2;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd-1;
    expected = -1;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd0;
    expected = 0;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd1;
    expected = 1;
    #1;
    check(out === expected);


    // test $signed
    in = 32'd2;
    expected = 2;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd32;
    expected = 32;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd64;
    expected = 64;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd127;
    expected = 127;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd128;
    expected = 128;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd129;
    expected = 129;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd255;
    expected = 255;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd256;
    expected = 256;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd257;
    expected = 257;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd512;
    expected = 512;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd513;
    expected = 513;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd514;
    expected = 514;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd1024;
    expected = 1024;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd1025;
    expected = 1025;
    #1;
    check(out === expected);

    // test $signed
    in = 32'd1026;
    expected = 1026;
    #1;
    check(out === expected);

    end

endmodule
### Test Results:
<img width="124" alt="Screen Shot 2022-07-31 at 12 10 55 PM" src="https://user-images.githubusercontent.com/51954242/182012087-ce3436d6-8ec6-490e-9e80-0354e06f6687.png">