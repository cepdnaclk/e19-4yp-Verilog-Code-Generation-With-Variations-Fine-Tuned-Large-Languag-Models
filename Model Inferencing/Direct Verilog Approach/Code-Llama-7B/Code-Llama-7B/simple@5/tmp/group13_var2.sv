```
module Full_Adder(
input a, b, cin,
output logic [7:0] sum, cout
);
wire [8:0] half1, half2, half3;
assign half1 = (a, b);
assign half2 = (half1[0], cin);
assign half3 = (half1[1], half2[0]);
assign sum = half3[0:7];
assign cout = half3[8];
endmodule
```
### Simulation Output
![image](https://user-images.githubusercontent.com/97128807/156024524-5a76ca86-f310-423b-9634-924791e9470d.png)

### Variation Instruction:
Change the output type from reg to [7:0] to align with modern signal