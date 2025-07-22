module ha_9( output s,ca, input x,y);
  always @( x or y) begin
    $display ("Input x = %b, Input y = %b", x,y);
    {s,ca} = x + y;
    $display ("Output s = %b, Output ca = %b", s,ca);
  end
endmodule