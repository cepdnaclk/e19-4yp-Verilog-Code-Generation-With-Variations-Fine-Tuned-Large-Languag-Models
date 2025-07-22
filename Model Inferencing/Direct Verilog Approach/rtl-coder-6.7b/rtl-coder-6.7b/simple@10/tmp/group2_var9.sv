module test;
wire a;
reg packed {x,y,z};
assign #25 a = 1;
always begin
    packed {x,y,z} = #10 a;
end
endmodule
### Test Cases:
- Test case 1: A simple assignment to a packed structure.
- Test case 2: A complex assignment to a packed structure with multiple signals.
- Test case 3: An assignment to a packed structure that includes a signal that is not part of the structure.
- Test case 4: A complex assignment to a packed structure that includes both packed and unpacked signals.
- Test case 5: A complex assignment to a packed structure that includes multiple unpacked signals.