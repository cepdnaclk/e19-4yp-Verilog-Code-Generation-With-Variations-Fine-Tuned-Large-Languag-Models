```

// alu_1.v

module alu_1(c,co,a,b,f,cci);
reg [3:0]a,b; reg [1:0]f; reg cci;

wire [3:0]d;

// Addittion
assign d=a+b;

// Multiplication
assign d=a*b;

// Comparision
assign c=a==b;

// Condition Branching
assign co=a>b;

// Clear Condition (Clears any pending condition)
assign c=cci;

endmodule

```

### Testing Results:

```

// Input/Output stimulus
module tst_alu2();
  reg [3:0]a,b; reg [1:0] f2; reg cci; wire [3:0]d; wire co;
  alu_1 aa(d,co,a,b,f2,cci); // Instantiate ALU
  initial begin cci=1'b0; f2=2'b00; a=4'h0; b=4'h1; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule


// Input/Output stimulus
module tst_alu3();
  reg [3:0]a,b; reg [1:0] f3; reg cci; wire [3:0]d; wire co;
  alu_1 aa(d,co,a,b,f3,cci); // Instantiate ALU
  initial begin cci=1'b0; f3=2'b00; a=4'h0; b=4'h2; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule

// Input/Output stimulus
module tst_alu4();
  reg [3:0]a,b,f4; reg cci; wire [3:0]d; wire co;
  alu_1 aa(d,co,a,b,f4,cci); // Instantiate ALU
  initial begin cci=1'b0; f4=2'b00; a=4'h1; b=4'h2; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule

// Input/Output stimulus
module tst_alu5();
  reg [3:0]a,b,f5; reg cci; wire [3:0]d; wire co;
  alu_1 aa(d,co,a,b,f5,cci); // Instantiate ALU
  initial begin cci=1'b0; f5=2'b01; a=4'h1; b=4'h1; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule

// Input/Output stimulus
module tst_alu6();
  reg [3:0]a,b,f6; reg cci; wire [3:0]d; wire co;
  alu_1 aa(d,co,a,b,f6,cci); // Instantiate ALU
  initial begin cci=1'b0; f6=2'b10; a=4'h1; b=4'h1; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule

// Input/Output stimulus
module tst_alu7();
  reg [3:0]a,b,f7; reg cci; wire [3:0]d; wire co;
  alu_1 aa(d,co,a,b,f7,cci); // Instantiate ALU
  initial begin cci=1'b0; f7=2'b11; a=4'h1; b=4'h1; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule

// Input/Output stimulus
module tst_alu8();
  reg [3:0]a,b,f8; reg cci; wire [3:0]d; wire co;
  alu_1 aa(d,co,a,b,f8,cci); // Instantiate ALU
  initial begin cci=1'b0; f8=2'b00; a=4'h1; b=4'h9; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule

// Input/Output stimulus
module tst_alu9();
  reg [3:0]a,b,f9; reg cci; wire [3:0]d; wire co;
  alu_1 aa(d,co,a,b,f9,cci); // Instantiate ALU
  initial begin cci=1'b0; f9=2'b00; a=4'h0; b=4'h9; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule

// Input/Output stimulus
module tst_alu10();
  reg [3:0]a,b,f10; reg cci; wire [3:0]d; wire co;
  alu_1 aa(d,co,a,b,f10,cci); // Instantiate ALU
  initial begin cci=1'b0; f10=2'b01; a=4'h0; b=4'h9; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule

// Input/Output stimulus
module tst_alu11();
  reg [3:0]a,b,f11; reg cci; wire [3:0]d; wire co;
  alu_1 aa(d,co,a,b,f11,cci); // Instantiate ALU
  initial begin cci=1'b0; f11=2'b10; a=4'h0; b=4'h9; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule

// Input/Output stimulus
module tst_alu12();
  reg [3:0]a,b,f12; reg cci; wire [3:0]d;