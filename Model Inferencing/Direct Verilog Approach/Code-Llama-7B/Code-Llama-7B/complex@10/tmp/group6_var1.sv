module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
constant selects = [0, 1, 2, 3];
always @(w0 or w1 or w2 or w3 or S)
    f = inside (S, selects);
endmodule
### Output:
```
$ vcs -sverilog -timescale=1ns/1ns -f file.f
../mux4to1_test.v
vcs -full64 -sverilog
./simv +vcs+vcdpluson
```