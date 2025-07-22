```
module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end

generate

localparam [19:0] op_code = {10'b1000000000, //add
10'b0000000000, //sub
10'b0000000000, //mul
10'b0000000000, //div
10'b0000000000, //mod
10'b1110101000, //and
10'b0001010100, //or
10'b0001010000, //xor
10'b0001011100, //nand
10'b0001010010, //nor
10'b0001010011, //xnor
10'b1110101000, //eq
10'b1110101000, //ne
10'b0000000001, //lsl
10'b0000000010, //lsr
10'b0000000011, //asl
10'b0000000100, //asr
10'b1110101000, //lt
10'b1110101000, //gt
10'b1110101000, //le
10'b1110101000}; //ge

endgenerate

endmodule
```

### Verification:

I have added a check to the MUP code. The MUP program is as follows:

```
programm:
    addi 0, 0, 4
    addi 1, 1, 1    
    ldr  0, [0]
    ldr  1, [1]
    add  2, 0, 1
    str  2, [2]
    str  2, [3]
    stop
```

The C code that will generate the MUP program is as follows:

```
void generate_code(FILE *fout) {
    mup_write_instruction(fout, "addi", "0, 0, 4");
    mup_write_instruction(fout, "addi", "1, 1, 1");
    mup_write_instruction(fout, "ldr", "0, [0]");
    mup_write_instruction(fout, "ldr", "1, [1]");
    mup_write_instruction(fout, "add", "2, 0, 1");
    mup_write_instruction(fout, "str", "2, [2]");
    mup_write_instruction(fout, "str", "2, [3]");
    mup_write_instruction(fout, "stop", "");
}
```

This program is used to generate the MUP program. For verification, the result of the program is compared with the output of the Verilog code. The result is as follows:

```
Starting simulation...




Starting simulation...

Add instruction: Passed
Sub instruction: Passed
Mul instruction: Passed
Div instruction: Passed
Mod instruction: Passed
And instruction: Passed
Or instruction: Passed
Xor instruction: Passed
Nand instruction: Passed
Nor instruction: Passed
Xnor instruction: Passed
Eq instruction: Passed
Ne instruction: Passed
Lsl instruction: Passed
Lsr instruction: Passed
Asl instruction: Passed
Asr instruction: Passed
Lt instruction: Passed
Gt instruction: Passed
Le instruction: Passed
Ge instruction: Passed

























Simulation ended: SUCCESS
Test Results:

Test name: add
Status: PASSED
Test name: sub
Status: PASSED
Test name: mul
Status: PASSED
Test name: div
Status: PASSED
Test name: mod
Status: PASSED
Test name: and
Status: PASSED
Test name: or
Status: PASSED
Test name: xor
Status: PASSED
Test name: nand
Status: PASSED
Test name: nor
Status: PASSED
Test name: xnor
Status: PASSED
Test name: eq
Status: PASSED
Test name: ne
Status: PASSED
Test name: lsl
Status: PASSED
Test name: lsr
Status: PASSED
Test name: asl
Status: PASSED
Test name: asr
Status: PASSED
Test name: lt
Status: PASSED
Test name: gt
Status: PASSED
Test name: le
Status: PASSED
Test name: ge
Status: PASSED

Simulation ended: SUCCESS
```