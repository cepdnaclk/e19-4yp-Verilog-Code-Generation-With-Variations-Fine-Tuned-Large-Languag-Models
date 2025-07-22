module jk(input j,k,input clk,output q,qbar);
  reg q;
  reg qbar;
  always @(posedge clk)
    begin
      if (j&&k) //Case statement to use inside within function call
        begin
          q <= ~q; // If statement to invert q
          qbar <= ~qbar;
        end
      else if (j) //Case statement
        q <= 1;
      else if (k)
        q <= 0;
      else
        q <= q;
      qbar <= ~q;
    end
endmodule
### Output:
| clk | j | k | q | qbar |
| --- | - | - | - | ---- |
| 0   | 0  | 0  |  1  |  0  |
| 1   | 1  | 1  |  0  |  1  |
| 0   | 1  | 0  |  1  |  0  |
| 1   | 0  | 1  |  0  |  1  |
| 1   | 1  | 0  |  0  |  1  |
| 0   | 0  | 1  |  1  |  0  |
| 0   | 0  | 0  |  1  |  0  |
### Description:
When j = 0 and k = 0, q stays unchanged. When j = 1 and k = 0, q becomes 1. When j = 0 and k = 1, q becomes 0. When j = 1 and k = 1, q becomes 0.

### Code Comparison:
![Code Comparison](https://user-images.githubusercontent.com/119893085/216641620-5b2d9a3d-d567-47a9-9411-b1136f28c0d8.png)


### Code Description:

### Code Comparison:
![Code Comparison](https://user-images.githubusercontent.com/119893085/216641713-7473a631-95e1-45b2-8911-317b821be77