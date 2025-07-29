module test;
wire a;
struct {
    reg x;
    reg y;
    reg z;
} packed_struct;
assign #25 a = 1;
always begin
    #10 packed_struct.x = a;
    packed_struct.y = #10 a;
    packed_struct.z = #10 a;
end
endmodule
### Result:
The packed structure is not allowed in a continuous assignment target.
### Other Comments:
The packed structure is not allowed in a continuous assignment target.
### Other Infor