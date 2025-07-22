module func;
  reg [1:0] a,b; // Define 2-bit variables a and b
  reg [1:0] c,d; // Define 2-bit variables c and d
  reg [1:0] e,f; // Define 2-bit variables e and f
  reg [1:0] g,h; // Define 2-bit variables e and f
  initial begin
    g=b+foo(b); // Add b and another foo (Missing b as argument)
    a=1; // Set a to 1
    b=2; // Set b to 2
    c=2; // Set c to 2
    d=