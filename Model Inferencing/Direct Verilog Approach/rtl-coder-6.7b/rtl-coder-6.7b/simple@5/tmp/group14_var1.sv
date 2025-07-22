module alu_1(output[3:0] d, output co, input[3:0]a, input[3:0]b, input[1:0] f, input cci);
  assign d[0]=(f==2'd0)? a[0]: (f==2'd1)? ~a[0]: (f==2'd2)? b[0]: (f==2'd3)? ~b[0]: a[0]&b[0];
  assign d[1]=(f==2'd0)? a[1]: (f==2'd1)? ~a[1]: (f==2'd2)? b[1]: (f==2'd3)? ~b[1]: a[1]&b[1];
  assign d[2]=(f==2'd0)? a[2]: (f==2'd1)? ~a[2]: (f==2'd2)? b[2]: (f==2'd3)? ~b[2]: a[2]&b[2];
  assign d[3]=(f==2'd0)? a[3]: (f==2'd1)? ~a[3]: (f==2'd2)? b[3]: (f==2'd3)? ~b[3]: a[3]&b[3];
  assign co=(f==2'd0)? a[3] & b[3] : (f==2'd1)? ~a[3] & b[3] : (f==2'd2)? a[3] & ~b[3] : (f==2'd3)? ~a[3] & ~b[3] : 1'b0;
endmodule
module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule