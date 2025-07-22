module Problem8 (input [3:0] a, b, output [3:0] diff);

struct packed{
    wire a;
    wire b;
    wire [1:0] diff;
} diff_out;

assign diff_out.a = a[3];
assign diff_out.b = b[3];
assign diff_out.diff[1] = (a[3] & (~b[3]));
assign diff_out.diff[0] = (a[2] ^ b[2]);

assign diff[3] = diff_out.diff[1];
assign diff[2] = a[2] & (~diff_out.b) | diff_out.diff[1] & (~diff_out.b);
assign diff[1] = diff_out.b & (~diff_out.diff[0]) | diff_out.diff[1] & (~diff_out.diff[0]);
assign diff[0] = a[0] ^ b[0];

endmodule