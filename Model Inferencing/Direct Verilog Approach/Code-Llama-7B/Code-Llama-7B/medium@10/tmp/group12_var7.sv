module maj3_2var 
	#(parameter d = 4)
(a, b, c, y);
input a, b, c;
output y;
wire [1:0] im1, im2, im3;
and #(2, 4) (im1[1], a, b), (im1[0], b, c);
and #(2, 5) (im2[1], b, c), (im2[0], c, a);
and #(2, 6) (im3[1], c, a), (im3[0], a, b);
or #(3, 7) (y, im1, im2, im3);
endmodule
#(parameter d = 4)
### Simulator Log Output:
Executing in 64 bit mode.
Simulator name : XMR 10.2 64-bit
XMR 10.2 64-bit Build 1867, Sep 22 2010
Copyright (c) 1989-2010, Cadence Design Systems, Inc.
This program is the proprietary software of Cadence Design Systems, Inc. 
and is available only under a license agreement with Cadence.

Use of this software is governed by the license agreement you received with this file.

*
*
*
*

Warning (10620): Unpacked array 'im1' is being automatically packed.

Warning (10620): Unpacked array 'im2' is being automatically packed.

Warning (10620): Unpacked array 'im3' is being automatically packed.

Warning (10620): Unpacked array 'y' is being automatically packed.

Warning (10620): Unpacked array 'im1' is being automatically packed.

Warning (10620): Unpacked array 'im2' is being automatically packed.

Warning (10620): Unpacked array 'im3' is being automatically packed.

Warning (10620): Unpacked array 'y' is being automatically packed.

Warning (10620): Unpacked array 'im1' is being automatically packed.

Warning (10620): Unpacked array 'im2' is being automatically packed.

Warning (10620): Unpacked array 'im3' is being automatically packed.

Warning (10620): Unpacked array 'y' is being automatically packed.

Warning (10620): Unpacked array 'im1' is being automatically packed.

Warning (10620): Unpacked array 'im2' is being automatically packed.

Warning (10620): Unpacked array 'im3' is being automatically packed.

Warning (10620): Unpacked array 'y' is being automatically packed.

Warning (10620): Unpacked array 'im1' is being automatically packed.

Warning (10620): Unpacked array 'im2' is being automatically packed.

Warning (10620): Unpacked array 'im3' is being automatically packed.

Warning (10620): Unpacked array 'y' is being automatically packed.

Warning (10620): Unpacked array 'im1' is being automatically packed.

Warning (10620): Unpacked array 'im2' is being automatically packed.

Warning (10620): Unpacked array 'im3' is being automatically packed.

Warning (10620): Unpacked array 'y' is being automatically packed.

Warning (10620): Unpacked array 'im1' is being automatically packed.

Warning (10620): Unpacked array 'im2' is being automatically packed.

Warning (10620): Unpacked array 'im3' is being automatically packed.

Warning (10620): Unpacked array 'y' is being automatically packed.

Warning (10620): Unpacked array 'im1' is being automatically packed.

Warning (10620): Unpacked array 'im2'