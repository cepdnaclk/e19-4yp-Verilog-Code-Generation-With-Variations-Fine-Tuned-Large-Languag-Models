module sw2led2 (
input wire [7:0] sw,
output wire [7:0] ld
) ;
assign ld = signed'(signed'(sw;
endmodule
### Expected Output:
![output](https://user-images.githubusercontent.com/82243095/140728896-a05f284e-7165-4e11-93dc-1e94e2025f94.png)
### Explanation:
![explanation](https://user-images.githubusercontent.com/82243095/140749641-b07aa7f3-3613-4bfc-b61f-4b64f3a9899d.png)
### Base Verilog Code:
module sw2led2