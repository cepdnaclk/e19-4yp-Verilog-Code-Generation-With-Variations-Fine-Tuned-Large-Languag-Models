module full_adder(i1, i2, cin, sum, cout);
    input i1, i2, cin;
    output logic sum, cout;
    assign sum = i1 ^ i2 ^ cin;
    assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Simulation Video:
<video width="640" height="480" controls>
  <source src="../../../../full_adder_logic_vector_modified_code/image/full_adder_logic_vector_modified_code.webm" type