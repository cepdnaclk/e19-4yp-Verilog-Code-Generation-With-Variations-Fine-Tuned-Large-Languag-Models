module TOP1;
	parameter N = 4;
  parameter N1 = N+1;
	parameter [N1-1:0] cmp_array [N][N] = { { 4'b1110, 4'b1010, 4'b0110, 4'b0010 }, { 4'b1010, 4'b1110, 4'b0010, 4'b0110 }, { 4'b0110, 4'b0010, 4'b1110, 4'b1010 }, { 4'b0010, 4'b0110, 4'b1010, 4'b1110 } };
  reg [3:0] x;
  wire [3:0] y;
  wire cmp;
  wire [N1-1:0] cmp_result;

  assign y = cmp_array[x[3:0]][x[3:0]];
  assign cmp_result = x inside {cmp_array};

  always @ (posedge CLK) begin
	  if (RST_X)
      begin
        x <= 0;
      end
	  else
	    if (cmp_result!= 1)
        begin
          x <= x + 1;
        end
  end

  assign cmp = (y == x);

  initial begin
    $monitor($time, "cmp_result: %b, cmp: %b", cmp_result, cmp);
  end
endmodule
##