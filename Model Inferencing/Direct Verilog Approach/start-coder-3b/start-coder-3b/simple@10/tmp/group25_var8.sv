module nmos_enum (o, i0, i1, b);
input i0, i1, b;
wire o;

assign o = enum_nmos ({i0 & ~b, i1 & ~b, ~i0 & b, ~i1 & b});

module enum_nmos (o, i0, i1, b) {
output o;
assign o = ~a & c | ~a & ~c & b | a & ~c | a & c & b;
}

output o;
endmodule
### References:
* [Assign](http://en.wikipedia.org/wiki/Assign)
* [Wires](http://en.wikipedia.org/wiki/Wire)
* [Enumerated Types](http://en.wikibooks.org/wiki/C_Programming/Enumerated_Types)
* [Enums and Bitfields](http://gcc.gnu.org/onlinedocs/gcc-4.4.1/gcc/Type-Attributes.html)
* [Enumerated Types](http://digital-forensics.sans.org/blog/2