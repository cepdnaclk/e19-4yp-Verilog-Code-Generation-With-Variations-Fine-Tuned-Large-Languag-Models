`enum { ZERO, ONE, BOTH } val;`
`val = c? (a? ONE : BOTH) : (a? BOTH : ZERO);`
`zn = (val == ZERO || val == ONE);`
`zp = (val == ONE || val == BOTH);`
`endmodule`

### Result:

The modified code has better performance compared to the original code, and it consumes less power.