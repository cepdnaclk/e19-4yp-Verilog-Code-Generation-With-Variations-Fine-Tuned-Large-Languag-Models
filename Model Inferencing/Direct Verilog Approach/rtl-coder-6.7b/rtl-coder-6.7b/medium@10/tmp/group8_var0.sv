module dec2_4beh(o,i);
wire[3:0]o;
reg[1:0] i;
initial
begin
o[0]=(i==2'b00);
o[1]=(i==2'b01);
o[2]=(i==2'b10);
o[3]=(i==2'b11);
end
endmodule
### Verilog code after modification:
module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_4beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation
endmodule
### Results:
![image](https://user-images.githubusercontent.com/85353464/225884182-86f34b5b-8044-4ec3-9