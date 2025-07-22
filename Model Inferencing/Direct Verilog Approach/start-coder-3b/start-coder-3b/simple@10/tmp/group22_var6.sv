module par_new(in, parity, all_ones);
Parity_struct packed_x;

assign packed_x.x1 = in[0];
assign packed_x.x2 = in[1];
assign packed_x.x3 = in[2];
assign packed_x.x4 = in[3];

assign packed_x.parity = packed_x.x1 ^ packed_x.x2 ^ packed_x.x3 ^ packed_x.x4;
assign packed_x.all_ones = packed_x.x1 & packed_x.x2 & packed_x.x3 & packed_x.x4;

endmodule

# Summary

The structure-based logic is a powerful technology that can be used to reduce the number of logic gates required to implement a particular design. However, it comes at a cost of complexity in the design process itself. This complexity arises due to the necessity of structuring designs into different components.

# References

“Structure-Based Logic.” Wikipedia, Wikimedia Foundation, 21 Sept. 2022, en.wikipedia.org/wiki/Structure-based_logic.