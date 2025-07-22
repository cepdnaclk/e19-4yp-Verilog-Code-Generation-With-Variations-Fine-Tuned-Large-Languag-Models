use test.inc;
module test_module;
`module test_package::test_module ( input a, output reg q );
always @( a ) begin : force_a_1
if ( a )
begin
q = 1;
end else begin
//
// inside can be added here
//
if ( inside(a, const) )
begin
q = 0;
end
end
end
endmodule

### Authors





### This Post Has 1 Comment

1.  says:

Hi Siddharth,

Your contribution is valuable to the community.

Thanks,
Vikas