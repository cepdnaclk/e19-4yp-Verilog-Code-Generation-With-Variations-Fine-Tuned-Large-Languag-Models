module tst_case1; //testbench
wire [1:0] y;
reg [2:0] i;
case (i)
3'b000: y=0;
3'b001: y=1;
3'b010: y=2;
otherwise: y=~y;
endcase
initial
begin
i=3'b000;
end
initial $monitor($time,"y=%b,i=%b", y, i);
initial #8 $stop; endmodule ### New Code: module tst_case1; //testbench wire [1:0] y; parameter N=3; wire psel_low=N-1; wire psel_high=0; reg [N-1:0] i; case (i) 3'b000: y=0; 3'b001: y=1; 3'b010: y