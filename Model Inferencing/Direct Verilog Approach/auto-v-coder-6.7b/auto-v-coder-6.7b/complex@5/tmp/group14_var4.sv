```verilog
module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
`define INSIDE(i)  (x[i] === 1'b1)
wire inside;
generate
  for (i=0; i<31; i++) begin
    if (i === 4'h0) begin
      assign inside = (x === 4'h0);
    end
    if (i === 4'h1) begin
      assign inside = (x === 4'h1) | (x === 4'h2) | (x === 4'h4) | (x === 4'h8) | (x === 4'h10);
    end
    if (i === 4'h2) begin
      assign inside = (x === 4'h1) | (x === 4'h2) | (x === 4'h4) | (x === 4'h8) | (x === 4'h10) | (x === 4'h16) | (x === 4'h32);
    end
    if (i === 4'h3) begin
      assign inside = (x === 4'h1) | (x === 4'h2) | (x === 4'h4) | (x === 4'h8) | (x === 4'h16) | (x === 4'h32);
    end
    if (i === 4'h4) begin
      assign inside = (x === 4'h1) | (x === 4'h2) | (x === 4'h4) | (x === 4'h8) | (x === 4'h16) | (x === 4'h32) | (x === 4'h64);
    end
    if (i === 4'h5) begin
      assign inside = (x === 4'h1) | (x === 4'h2) | (x === 4'h4) | (x === 4'h8) | (x === 4'h16) | (x === 4'h32) | (x ===