module alu_4(output logic [3:0] d,cout,input logic[3:0] a,b,input logic[1:0] f, input cci);
  assign cout = cci;
  logic[3:0]tmp;
  assign tmp = a + b;
  always@(*) case(f)
    0:begin d <= a&b; end
    1:begin d <= a|b; end
    2:begin d <= a^b; end
    3:begin d <= tmp; end
    default: begin d<=d; end
  endcase
endmodule

### Simulation
### Console Output:
(tst_alu4.v)
1000000000 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000001 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000002 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000003 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000004 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000005 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000006 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000007 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000008 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000009 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000010 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000011 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000012 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000013 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000014 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000015 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000016 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000017 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000018 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000019 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000020 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000021 : cci = b'0, a= h0,b = h0,f = h1,d = h0,co= b'0 
1000000022 : cci = b'0, a= h0,b = h0,f = h2,d = h0,co= b'0 
1000000023 : cci = b'0, a= h0,b = h0,f = h3,d = h0,co= b'0 
### Console Output:
(tst_alu4.v)
1000000000 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000001 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000002 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000003 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000004 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000005 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000006 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000007 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000008 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000009 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000010 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000011 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000012 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000013 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000014 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000015 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000016 : cci = b'0, a= h0,b = h0,f = h0,d = h0,co= b'0 
1000000017 : cci = b'0, a= h0,b