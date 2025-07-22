module aoi22beh(o,a,b); // Mixed initial procedural behavioral AOI
output o;
input[1:0]a,b;
assign o = ~(a[1:0] || b[1:0]);

endmodule