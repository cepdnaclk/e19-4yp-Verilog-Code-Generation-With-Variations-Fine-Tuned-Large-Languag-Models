module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();

    always @(a) b[3:0] = a[3:0] + b[2:0];
endmodule

module Ripple_Add (
    input  logic [3:0] a,
    input  logic [3:0] b,
    output logic [3:0] sum
);

    fa0 (
       .a   ( a[3] ),
       .b   ( b[3] ),
       .sum ( sum[3] )
    );
    fa1 (
       .a   ( a[2] ),
       .b   ( b[3] ),
       .sum ( sum[2] )
    );
    fa2 (
       .a   ( a[1] ),
       .b   ( b[2] ),
       .sum ( sum[1] )
    );
    fa3 (
       .a   ( a[0] ),
       .b   ( b[1] ),
       .sum ( sum[0] )
    );
endmodule

module Ripple_Add (
    input  logic [3:0] a,
    input  logic [3:0] b,
    output logic [3:0] sum
);
    fa0 (
       .a   ( a[3] ),
       .b   ( b[3] ),
       .sum ( sum[3] )
    );
    fa1 (
       .a   ( a[2] ),
       .b   ( b[3] ),
       .sum ( sum[2] )
    );
    fa2 (
       .a   ( a[1] ),
       .b   ( b[2] ),
       .sum ( sum[1] )
    );
    fa3 (
       .a   ( a[0] ),
       .b   ( b[1] ),
       .sum ( sum[0] )
    );
endmodule

module Ripple_Add (
    input  logic [3:0] a,
    input  logic [3:0] b,
    output logic [3:0] sum
);
    fa0 (
       .a   ( a[3] ),
       .b   ( b[3] ),
       .sum ( sum[3] )
    );
    fa1 (
       .a   ( a[2] ),
       .b   ( b[3] ),
       .sum ( sum[2] )
    );
    fa2 (
       .a   ( a[1] ),
       .b   ( b[2] ),
       .sum ( sum[1] )
    );
    fa3 (
       .a   ( a[0] ),
       .b   ( b[1] ),
       .sum ( sum[0] )
    );
endmodule

module Ripple_Add (
    input  logic [3:0] a,
    input  logic [3:0] b,
    output logic [3:0] sum
);
    fa0 (
       .a   ( a[3] ),
       .b   ( b[3] ),
       .sum ( sum[3] )
    );
    fa1 (
       .a   ( a[2] ),
       .b   ( b[3] ),
       .sum ( sum[2] )
    );
    fa2 (
       .a   ( a[1] ),
       .b   ( b[2] ),
       .sum ( sum[1] )
    );
    fa3 (
       .a   ( a[0] ),
       .b   ( b[1] ),
       .sum ( sum[0] )
    );
endmodule

module Ripple_Add (
    input  logic [3:0] a,
    input  logic [3:0] b,
    output logic [3:0] sum
);
    fa0 (
       .a   ( a[3] ),
       .b   ( b[3] ),
       .sum ( sum[3] )
    );
    fa1 (
       .a   ( a[2] ),
       .b   ( b[3] ),
       .sum ( sum[2] )
    );
    fa2