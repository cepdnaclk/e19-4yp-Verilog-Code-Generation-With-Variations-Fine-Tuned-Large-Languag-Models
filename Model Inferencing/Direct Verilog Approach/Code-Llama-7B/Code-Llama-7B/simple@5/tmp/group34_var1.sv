```
module wire_assign_wildcard( input clk[*], output out );
    // assign out to Clock[3]
    assign out = clk[3];
endmodule
```
### Expected Output:
```
Clock[3] = x
```
### Simulation Result:
![](https://i.imgur.com/Ys3V0mG.png)
### Explanation: