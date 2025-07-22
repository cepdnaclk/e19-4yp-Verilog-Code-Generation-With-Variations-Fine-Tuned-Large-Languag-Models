module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, logic cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule

### Test Code: 

module test_full_adder();
  logic i1, i2, cin;
  wire sum, cout;
  full_adder dut(i1, i2, cin, sum, cout);
  initial begin
    $dumpfile("test_full_adder.vcd");
    $dumpvars(1, test_full_adder);
    i1 = 0; i2 = 0; cin = 0; #5; assert (sum===0) && (cout===0);
    i1 = 0; i2 = 0; cin = 1; #5; assert (sum===1) && (cout===0);
    i1 = 0; i2 = 1; cin = 0; #5; assert (sum===1) && (cout===0);
    i1 = 0; i2 = 1; cin = 1; #5; assert (sum===0) && (cout===1);
    i1 = 1; i2 = 0; cin = 0; #5; assert (sum===1) && (cout===0);
    i1 = 1; i2 = 0; cin = 1; #5; assert (sum===0) && (cout===1);
    i1 = 1; i2 = 1; cin = 0; #5; assert (sum===0) && (cout===1);
    i1 = 1; i2 = 1; cin = 1; #5; assert (sum===1) && (cout===1);
    $finish;
  end
endmodule

### Waveform:
![image](https://user-images.githubusercontent.com/18070104/215380391-484339b8-5670-4693-8d63-8e2e33f5c327.png)