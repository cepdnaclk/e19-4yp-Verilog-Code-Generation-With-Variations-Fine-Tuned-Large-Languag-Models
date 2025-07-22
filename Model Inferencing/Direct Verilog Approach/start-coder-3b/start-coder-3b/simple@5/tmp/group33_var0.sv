```c++
void unpackStruct(struct PackedStruct& p) {
  p.s = p.a ^ p.b;  // 1/2 = 1
  p.ca = (p.a & p.b) ^ 1; // 1/2 = 1
}
```
## Results:
The following table lists the number of variations that were found per Verilog file.

|File Name|Variations|
|:--|--:|
|ha_1.v|32|
|ha_2.v|32|
|ha_3.v|32|
|ha_4.v|32|
|ha_5.v|32|
|ha_6.v|32|
|ha_7.v|32|
|ha_8.v|32|
|ha_9.v|32|
|ha_10.v|32|
|ha_11.v|32|
|ha_12.v|32|
|ha_13.v|32|
|ha_14.v|32|
|ha_15.v|32|
|ha_16.v|32|
|ha_17.v|32|
|ha_18.v|32|
|ha_19.v|32|
|ha_20.v|32|
|ha_21.v|32|
|ha_22.v|32|
|ha_23.v|32|
|ha_24.v|32|
|ha_25.v|32|
|ha_26.v|32|
|ha_27.v|32|
|ha_28.v|32|
|ha_29.v|32|
|ha_30.v|32|
|ha_31.v|32|
|ha_32.v|32|