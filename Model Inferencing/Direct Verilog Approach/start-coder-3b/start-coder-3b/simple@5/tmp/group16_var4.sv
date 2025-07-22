```
module or_fr_rl_unpacked (
  input [1:0] DataIn, input [1:0] DataOut,
  input [1:0] EnIn, input [1:0] EnOut,
  output [1:0] DataOut_sig, output [1:0] DataOut_str
) {

  logic [1:0] DataIn_sig;
  assign DataIn_sig = DataIn;

  logic [1:0] DataOut_sig;
  logic [1:0] DataOut_str;
  assign DataOut_sig = DataOut;
  assign DataOut_str = DataOut;

  logic [1:0] EnIn_sig;
  assign EnIn_sig = EnIn;

  or_fr_rl or_fr_rl_inst (.DataOut_sig(DataOut_sig),.DataIn_sig(DataIn_sig),.DataOut_str(DataOut_str), 
   .EnIn_sig(EnIn_sig));
}
```
### Generated Verilog:
```
module or_fr_rl_unpacked (
  input [1:0] DataIn,
  input [1:0] DataOut,
  input [1:0] EnIn,
  input [1:0] EnOut,
  output [1:0] DataOut_sig,
  output [1:0] DataOut_str
);

  logic [1:0] DataIn_sig;
  assign DataIn_sig = DataIn;

  logic [1:0] DataOut_sig;
  logic [1:0] DataOut_str;
  assign DataOut_sig = DataOut;
  assign DataOut_str = DataOut;

  logic [1:0] EnIn_sig;
  assign EnIn_sig = EnIn;

  or_fr_rl_inst or_fr_rl_inst (.DataOut_sig(DataOut_sig),.DataIn_sig(DataIn_sig),.DataOut_str(DataOut_str),
   .EnIn_sig(EnIn_sig));
endmodule
```
### Output Log:
```
19:09:08.144565 [INFO] Input file: or_fr_rl_unpacked.v
19:09:08.144681 [DEBUG] Parsing input file
19:09:08.144793 [DEBUG] Source code has 2 modules
19:09:08.144905 [DEBUG] Source code has 12 modules
19:09:08.145017 [DEBUG] Source code has 13 modules
19:09:08.145124 [DEBUG] Source code has 15 modules
19:09:08.145234 [DEBUG] Source code has 15 modules
19:09:08.145344 [DEBUG] Source code has 16 modules
19:09:08.145455 [DEBUG] Source code has 17 modules
19:09:08.145567 [DEBUG] Source code has 17 modules
19:09:08.145678 [DEBUG] Source code has 18 modules
19:09:08.145791 [DEBUG] Source code has 18 modules
19:09:08.145901 [DEBUG] Source code has 19 modules
19:09:08.146011 [DEBUG] Source code has 19 modules
19:09:08.146124 [DEBUG] Source code has 20 modules
19:09:08.146236 [DEBUG] Source code has 20 modules
19:09:08.146348 [DEBUG] Source code has 21 modules
19:09:08.146461 [DEBUG] Source code has 21 modules
19:09:08.146572 [DEBUG] Source code has 23 modules
19:09:08.146684 [DEBUG] Source code has 23 modules
19:09:08.146794 [DEBUG] Source code has 24 modules
19:09:08.146905 [DEBUG] Source code has 24 modules
19:09:08.147017 [DEBUG] Source code has 25 modules
19:09:08.147128 [DEBUG] Source code has 25 modules
19:09:08.147243 [DEBUG] Source code has 26 modules
19:09:08.147351 [DEBUG] Source code has 26 modules
19:09:08.147463 [DEBUG] Source code has 27 modules
19:09:08.147574 [DEBUG] Source code has 27 modules
19:09:08.147686 [DEBUG] Source code has 28 modules
19:09:08.147802 [DEBUG] Source code has 28 modules
19:09:08.147910 [DEBUG] Source code has 29 modules
19:09:08.148024 [DEBUG] Source code has 29 modules
19:09:08.148136 [DEBUG] Source code has 30 modules
19:09:08.148246 [DEBUG] Source code has 30 modules
19:09:08.148354 [DEBUG] Source code has 31 modules
19:09:08.148463 [DEBUG] Source code has 31 modules
19:09:08.148575 [DEBUG] Source code has 32 modules
19:09:08.148688 [DEBUG] Source code has 32 modules
19:09:08.148799 [DEBUG] Source code has 33 modules
19:09:08.148915 [DEBUG] Source code has 33 modules
19:09:08.149027 [DEBUG] Source code has 34 modules
19:09:08.149138 [DEBUG] Source code has 34 modules
19:09:08.149249 [DEBUG] Source code has 35 modules
19:09:08.149360 [DEBUG] Source code has 35 modules
19:09:08.149471 [DEBUG] Source code has 36 modules
19:09:08.149579 [DEBUG] Source code has 36 modules
19:09:08.149688 [DEBUG] Source code has 37 modules
19:09:08.149798 [DEBUG] Source code has 37 modules
19:09:08.150030 [DEBUG] Source code has 38 modules
19:09:08.150146 [DEBUG] Source code has 38 modules
19:09:08.150389 [DEBUG] Source code has 39 modules
19:09:08.150499 [DEBUG] Source code has 39 modules
19:09:08.150611 [DEBUG] Source code has 40 modules
19:09:08.150723 [DEBUG] Source code has 40 modules
19:09:08.150833 [DEBUG] Source code has 41 modules
19:09:08.150945 [DEBUG] Source code has 41 modules
19:09:08.151055 [DEBUG] Source code has 42 modules
19:09:08.151165 [DEBUG] Source code has 42 modules
19:09:08.151273 [DEBUG] Source code has 43 modules
19:09:08.151386 [DEBUG] Source code has 43 modules
19:09:08.151499 [DEBUG