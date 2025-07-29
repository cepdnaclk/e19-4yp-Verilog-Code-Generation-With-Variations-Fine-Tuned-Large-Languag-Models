module gade(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;
// Instantiate OR gate with inertial delay 3
or #3 gg1(a1,c1,b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(a,c,b);
endmodule
module top();
  wire a,aa,a1,b,c,b1,c1;
  gade g1(a1,a,b1,b,c1,c);
  initial begin
    #100;
    $finish;
  end
endmodule
### Modified testbench:
module top();
  wire a,aa,a1,b,c,b1,c1;
  gade g1(a1,a,b1,b,c1,c);
  initial begin
    #100;
    $finish;
  end
endmodule
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: 0.168ms
### Simulation Time: