```
module gade(a, a1, b, c, b1, c1, a2, a3);
    input b, c, b1, c1;
    output a, a1, a2, a3;
    // Instantiate OR gate with inertial delay 3
    or #3 gg1(a1, c1, b1);
    // Instantiate AND gate with rise=2, fall=1 inertial delay
    and #(2, 1) gg2(a, c, b);
    // Instantiate OR gate with inertial delay 1
    or #1 gg3(a2, c1, b1);
    // Instantiate OR gate with inertial delay 2
    or #2 gg4(a3, c1, b1);
endmodule
```
### Error Expected:
```
ERROR:HDLCompiler:84 - "gade.v" line 12/7: Syntax error near "output".
ERROR:HDLCompiler:510 - "gade.v" line 12/7: Syntax error.
ERROR:HDLCompiler:510 - "gade.v" line 12/7: Syntax error.
ERROR:HDLCompiler:510 - "gade.v" line 12/7: Syntax error.
ERROR:HDLCompiler:510 - "gade.v" line 12/7: Syntax error.
ERROR:HDLCompiler:34 - "gade.v" line 12/7: Syntax error near "output".
```
### Error Observed:
```
ERROR:HDLCompiler:510 - "gade.v" line 11/7: Syntax error.
ERROR:HDLCompiler:510 - "gade.v" line 11/7: Syntax error.
ERROR:HDLCompiler:510 - "gade.v" line 11/7: Syntax error.
ERROR:HDLCompiler:510 - "gade.v" line 11/7: Syntax error.
ERROR:HDLCompiler:510 - "gade.v" line 11/7: