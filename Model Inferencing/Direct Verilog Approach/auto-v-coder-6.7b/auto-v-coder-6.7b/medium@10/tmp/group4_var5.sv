```verilog
module jk_flip_flop(input j, k, clk, rst, output q, qbar); 
  output q, qbar;
  input j, k, clk, rst;
  wire q, qbar;
  
  reg mem; 

  always @(posedge clk or posedge rst)
    if(rst) begin
      mem <= 0;
    end else begin
      case({j, k})
        2'b00: mem <= mem;
        2'b01: mem <= 0;
        2'b10: mem <= 1;
        2'b11: mem <= ~mem;
      endcase
    end
  
  assign q = mem;
  assign qbar = ~mem;
endmodule
```
In this modified code, the `mem` flag (i.e., JK flip flop's Q) will not change its value when both J and K are zero. When one of them is 1, it will change to 0 when K is 1 and to 1 when J is 1. When both are 1, it will change to the inverse of its previous state. This can be a simple and effective way to model a JK flip flop in Verilog.