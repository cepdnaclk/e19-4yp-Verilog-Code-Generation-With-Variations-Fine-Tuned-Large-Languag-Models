module func1(x1, x2, x3, f1, f2);
input logic x1, x2, x3;
output logic f1, f2;
logic signed [3:0] s1, s2;
assign s1 = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
assign s2 = (~x1 & ~x2 & x3) | (~x1 & x2) | (x1 & ~x2 & x3) | (x1 & x2);
assign f1 = (s1 == 0);
assign f2 = (s2 == 0);
endmodule
### Output(signed):
![image](./image/test_02.png)
### Output(unsigned):
![image](./image/test_03.png)
### Explanation:
1. The logic vector signed [3:0] type is a signed logic vector of size 4 with range -8 to +7.
2. The signed logic vector "s1" is assigned the value of expression "(~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3)".
3. The signed logic vector "s2" is assigned the value of expression "(~x1 & ~x2 & x3) | (~x1 & x2) | (x1 & ~x2 & x3) | (x1 & x2)".
4. The "f1" output is assigned the value of the expression "(s1 == 0)". If the signed logic vector "s1" is equal to 0, the output "f1" is assigned the value of 1, otherwise it is assigned the value of 0.
5. The "f2" output is also assigned the value of the expression "(s2 == 0)". However, this time it is used to determine whether the signed logic vector "s2" is equal to zero, not the value of the signed logic vector itself. Therefore, the output "f2" is assigned a value of 1 if and only if the value of the signed logic vector is zero.
6. The output "f2" is assigned a value of 1 if and only if the value of the signed logic vector "s2" is zero.
7. The output "f2" is assigned a value of 1 if and only if the first three inputs to the module are 0 and the last input to the module is 1, indicating the output should be 1.
8. The second input to the module is not needed in the output "f2", so it is not necessary to check its value.

### Output:
![image](./image/test_01.png)