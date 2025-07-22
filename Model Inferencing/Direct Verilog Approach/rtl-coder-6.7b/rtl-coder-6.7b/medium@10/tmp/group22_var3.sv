module nil;
reg [3:0] arr;
reg r_cntl, w_cntl;
always @ (r_cntl, w_cntl, arr[2:0])
begin
if (r_cntl)
$display ("t=%0t display: Read data: arr[2:0] = %b", $time, arr[2:0]); // Added time
if (w_cntl)
$display ("t=%0t display: Write data: arr[3:1] = %b", $time, arr[3:1]); // Added time
end
initial
begin
$monitor("t=%0t monitor: arr = %b", $time, arr); // Added time
arr = 4'b0000;
r_cntl = 1'b0;
w_cntl = 1'b0;
#2;
r_cntl = 1'b1;
#3;
w_cntl = 1'b1;
#2;
r_cntl = 1'b0;
w_cntl = 1'b0;
#2;
arr = 4'b0011;
#2;
r_cntl = 1'b1;
end
endmodule

### Output:
![image](https://user-images.githubusercontent.com/87173449/152517532-15fa1df6-cd2d-4e5b-8502-492a434576bd.png)

### Question:
Q1: In the above code (2), Can we add a time specifier in $display and display?

### Answer:
Yes

### Explanation:
The $display method accepts a time specifier in the first parameter.