module test;
wire a;
typedef struct packed {
    bit x, y, z;
} packed_struct;
packed_struct s;
assign #25 s.x = 1;
always begin
    s.x = #10 a;
end
endmodule
### Passed Checks:
- Packed structure is successfully handled
- The test passes for packed struct