```
module mux4to1(w0, w1, w1, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
reg [1:0] s_list;
always @(w0 or w1 or w2 or w3 or S)
    if (inside(S,s_list))
        f = w3;
    else
        f = w1;
endmodule
```
### Replay Code:
```
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg [1:0] s_list = {1'b0, 1'b0};
reg f;
always @(w0 or w1 or w2 or w3 or S)
    if (inside(S,s_list))
        f = w3;
    else
        f = w1;
endmodule
```
### Test Vector:
| w0 | w1 | w2 | w3 | S | f |
| -- | -- | -- | -- | --| -- |
| 0  | 1  | 0  | 1  | 00 | 0 |
| 1  | 0  | 1  | 0  | 00 | 1 |
| 0  | 0  | 0  | 1  | 01 | 1 |
| 1  | 1  | 1  | 0  | 01 | 0 |
| 0  | 0  | 0  | 0  | 11 | 0 |
| 0  | 0  | 0  | 0  | 10 | 1 |
| 1  | 1  | 1  | 1  | 11 | 1 |
| 1  | 1  | 1  | 1  | 10 | 1 |

### Expected Result
![image](https://user-images.githubusercontent.com/66383745/139536347-fbf9f0f4-3398-471c-8f8f-b724e2346b94.png)
### Observation Result
![image](https://user-images.githubusercontent.com/66383745/139537192-7558338e-30c3-4c28-9236-49931575b647.png)
### Pass/Fail:
FAIL
### Explanation for Failure:
In a case that the signal `f` should be set to `0`, it is not the case because of the signal `S` remains the same as `1'bxx`, where `xx` does not exist in the `s_list`. `f` is set to `1` because of the last statement of the `if