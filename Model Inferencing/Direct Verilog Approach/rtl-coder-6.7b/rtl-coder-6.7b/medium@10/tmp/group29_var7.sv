while (1) begin
    muxdff[index](...);
    index <= index + 1'd1;
end
### Output:
```
[2022-04-14T19:00:16UTC][W]:[4272] [/mnt/hgfs/dev/verilog_test/test_030_muxdff.v:12] [muxdff[index]]: Verilog parser error at or near "muxdff[index]": expected declaration, typedef, function or task declaration
[2022-04-14T19:00:16UTC][W]:[4272] [/mnt/hgfs/dev/verilog_test/test_030_muxdff.v:12] [muxdff[index]]: Verilog parser error at or near "muxdff[index]": expected declaration, typedef, function or task declaration
[2022-04-14T19:00:16UTC][W]:[4272] [/mnt/hgfs/dev/verilog_test/test_030_muxdff.v:12] [muxdff[index]]: Verilog parser error at or near "muxdff[index]": expected declaration, typedef, function or task declaration
[2022-04-14T19:00:16UTC][W]:[4272] [/mnt/hgfs/dev/verilog_test/test_030_muxdff.v:12] [muxdff[index]]: Verilog parser error at or near "muxdff[index]": expected declaration, typedef, function or task declaration
```