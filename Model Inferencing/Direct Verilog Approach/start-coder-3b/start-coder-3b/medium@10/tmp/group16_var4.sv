module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
wire [3:0] mux_table[4][4]
endmodule
### Testbench Harness:
module mux24b_tb(
);
reg a,b,s,y;
mux24b mux(.a(a),.b(b),.s(s),.y(y));
always @*
a = 4'b1000;
b = 4'b0001;
s = 0;
#31;
#1;
a = 4'b0100;
b = 4'b0010;
s = 1;
#31;
#1;
a = 4'b0000;
b = 4'b1000;
s = 0;
#31;
#1;
$finish;
endmodule
### Performance Analysis:
The performance of the module can be measured using the following command
> vcs -lca -full64 -notice -debug_all +acc +vpi -f mux24b_tb.v +vpi=vfile_mux24b_tb.c
# Running vcs -lca -full64 -notice -debug_all +acc +vpi -f mux24b_tb.v +vpi=vfile_mux24b_tb.c
Information: -VCS-Xlib:
Xlib: 31014.48

Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007 Mentor Graphics Corporation

Copyright (C) 2007-2018 Synopsys, Inc.

Information: -VCS-Xlib:
Xlib: 31014.48
Information: -VCS-Xlib:
Xlib: 31014.48
Information: Mentor Graphics, Inc.

VCS Version: 11.0

Copyright (C) 2007