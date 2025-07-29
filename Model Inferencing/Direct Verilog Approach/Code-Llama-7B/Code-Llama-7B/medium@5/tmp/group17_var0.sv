```
// LUT instantiation
LUT2 #(
.INIT(1)
) lut1 (
.I0(s[0]),
.I1(s[1]),
.O(temp)// Select 0 (or 1)
);
case(s)
2'b00: temp = 2'b00;
2'b11: temp = 2'b11;
2'b01: temp = 2'b01;
2'b10: temp = 2'b10;
endcase
assign z = c[temp];
```
### Explanation
The base code is using an LUT instance to select a variable from a fixed input. The variation can change the selected variable index dynamically by a variable input.
### Testing
#### Original Code
Input:

| c |s |Output |
| :-: | :-: | :-: |
| 0 |00 | 0 |
| 1 |00 | 1 |
| 0 |01 | 0 |
| 1 |01 | 1 |
| 0 |10 | 0 |
| 1 |10 | 1 |
| 0 |11 | 0 |
| 1 |11 | 1 |
#### Variation Code
Input:

| c |s |Output |
| :-: | :-: | :-: |
| 0 |00 | 0 |
| 1 |00 | 1 |
| 0 |