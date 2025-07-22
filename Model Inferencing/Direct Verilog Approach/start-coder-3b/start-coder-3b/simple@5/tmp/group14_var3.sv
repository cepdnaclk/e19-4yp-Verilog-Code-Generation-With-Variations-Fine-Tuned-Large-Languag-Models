```
module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial cci=1'b0; f=2'b00; a=4'b1111; b=4'b1111; #30 $stop; // Initialize & stop
  always begin // Apply stimulus
    a=4'b0000; // $display("New A:");
    #30; // 30 ns
    a=4'b0001; // $display("New A:");
    #30; // 30 ns
    a=4'b0010; // $display("New A:");
    #30; // 30 ns
    a=4'b0011; // $display("New A:");
    #30; // 30 ns
    a=4'b0100; // $display("New A:");
    #30; // 30 ns
    a=4'b0101; // $display("New A:");
    #30; // 30 ns
    a=4'b0110; // $display("New A:");
    #30; // 30 ns
    a=4'b0111; // $display("New A:");
    #30; // 30 ns
    a=4'b1000; // $display("New A:");
    #30; // 30 ns
    a=4'b1001; // $display("New A:");
    #30; // 30 ns
    a=4'b1010; // $display("New A:");
    #30; // 30 ns
    a=4'b1011; // $display("New A:");
    #30; // 30 ns
    a=4'b1100; // $display("New A:");
    #30; // 30 ns
    a=4'b1101; // $display("New A:");
    #30; // 30 ns
    a=4'b1110; // $display("New A:");
    #30; // 30 ns
    a=4'