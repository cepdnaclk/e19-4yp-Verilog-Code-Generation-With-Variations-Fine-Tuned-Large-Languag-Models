module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule
### Test bench code:
module show_aa_tb;
  wire a, b, c, d;
  show_aa #(.A(a),.B(b)) a_gate(c,d);
  show_aa #(.A(b),.B(a)) b_gate(d,c);
  initial begin
    $monitor("%d %d %d %d",$time,a,b,c,d);
    fork
      f1; f2;
    join
  end
  task f1;
    begin
      a = 1'bX; b = 1'b1; #100;
    end
  endtask
  task f2;
    begin
      b = 1'b0; #1000;
    end
  endtask
endmodule
### Simulation Log:
```
 0 ps 0 0 0 0 
100 ps 1 1 1 0 
100 ps 1 0 1 0 
150 ps 1 0 1 0 
200 ps 1 0 1 0 
250 ps 1 0 1 0 
300 ps 1 0 1 0 
350 ps 1 0 1 0 
400 ps 1 0 1 0 
450 ps 1 0 1 0 
500 ps 1 0 1 0 
550 ps 1 0 1 0 
600 ps 1 0 1 0 
650 ps 1 0 1 0 
700 ps 1 0 1 0 
750 ps 1 0 1 0 
800 ps 1 0 1 0 
850 ps 1 0 1 0 
900 ps 1 0 1 0