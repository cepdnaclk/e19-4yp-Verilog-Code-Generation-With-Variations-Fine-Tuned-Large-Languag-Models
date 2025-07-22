```
    // Check XMR usage in index select using array
    if(BCD_in == `LATCH_1)
       pkg::consts[BCD_in] = `LATCH_1;
    else if(BCD_in == `LATCH_2)
       pkg::consts[BCD_in] = `LATCH_2;
    else if(BCD_in == `LATCH_3)
       pkg::consts[BCD_in] = `LATCH_3;
    else if(BCD_in == `LATCH_4)
       pkg::consts[BCD_in] = `LATCH_4;
    else if(BCD_in == `LATCH_5)
       pkg::consts[BCD_in] = `LATCH_5;
    else if(BCD_in == `LATCH_6)
       pkg::consts[BCD_in] = `LATCH_6;
    else if(BCD_in == `LATCH_7)
       pkg::consts[BCD_in] = `LATCH_7;
    else if(BCD_in == `LATCH_8)
       pkg::consts[BCD_in] = `LATCH_8;
    else if(BCD_in == `LATCH_9)
       pkg::consts[BCD_in] = `LATCH_9;
    else if(BCD_in == `LATCH_10)
       pkg::consts[BCD_in] = `LATCH_10;
    else if(BCD_in == `LATCH_11)
       pkg::consts[BCD_in] = `LATCH_11;
    else if(BCD_in == `LATCH_12)
       pkg::consts[BCD_in] = `LATCH_12;
    else if(BCD_in == `LATCH_13)
       pkg::consts[BCD_in] = `LATCH_13;
    else if(BCD_in == `LATCH_14)
       pkg::consts[BCD_in] = `LATCH_14;
    else if(BCD_in == `LATCH_15)
       pkg::consts[BCD_in] = `LATCH_15;
    // Check XMR usage in index select using array
    // Check XMR usage in index select using array
    // Check XMR usage in index select using array
    // Check XMR usage in index select using array
    // Check XMR usage in index select using array
    // Check XMR usage in index select using array
    // Check XMR usage in index select using array
    // Check XMR usage in index select using array
    // Check XMR usage in index select using array
```
### Rationale:
Check `BCD_in` if it is inside the array using XMR (e.g., `pkg::consts[BCD_in]`).
### Risk:
XMR is used in index select for array, but XMR is not supported in index select for arrays.
### Mitigation:
Use non-XMR index select for arrays (e.g., `pkg::consts[BCD_in]`).
### References:
[XMR Support](https://github.com/Symantec/DRED/wiki/Mitigations/XMR-support)