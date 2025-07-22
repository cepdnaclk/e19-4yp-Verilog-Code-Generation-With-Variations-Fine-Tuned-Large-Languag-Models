module tst_or_gate();
reg[3:0]a;
reg en;
wire b;
or_gate gg(b,a,en);
integer array_index;
initial begin
a = 4'h0; // Initialize input
en = 1'b0; // Initialize enable
end
initial begin // Stimulus generation
#2;
en = 1'b1;
for(array_index = 0; array_index < 4; array_index = array_index + 1) begin
if (array_index == 0) begin
a = 4'h0;
end
else if (array_index == 1) begin
a = 4'h1;
end
else if (array_index == 2) begin
a = 4'h3;
end
else if (array_index == 3) begin
a = 4'h7;
end
#2;
end
end
initial $monitor("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b); // Use %h for hex 'a'
initial #30 $stop; // Stop simulation
endmodule
### Analysis Parameters:
### Analysis Results:

| Parameter Name | Value |
| -------------- | :---: |
| Variation      |       | 


### Variation Details:

| Score   | Test Condition                  | Variation Detail                                 |
| ------- | ------------------------------- | ------------------------------------------------ |
| 0.00000 | `(a = 4'h1)`                   | Variation                                         |
| 0.00000 | `(a = 4'h3)`                   | Variation                                         |
| 0.00000 | `(a = 4'h7)`                   | Variation                                         |
| 0.00000 | `(a = 4'b0000)`                | Input Value                                       |
### Variation Score: 0.00000