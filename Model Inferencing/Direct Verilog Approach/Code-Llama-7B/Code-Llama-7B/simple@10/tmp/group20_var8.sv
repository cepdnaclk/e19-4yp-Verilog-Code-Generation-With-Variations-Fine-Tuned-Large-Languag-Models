module latch (input d, c, output [7:0] q, q_b );
always begin
wait ( c );
end
endmodule
### Passed Simulation:
- N
### Expected Simulation:
- Y
#### Screenshot:
![simulation1](screenshots/04_simulation1.jpg)
### Passed Synthesis:
- N
### Expected Synthesis:
- Y
#### Synopsis:
- No module instantiation due to lack of argument for port q_b.
#### Screenshot:
![synthesis1](screenshots/04_synthesis1.jpg)
### Passed FMax:
- N
### Expected FMax:
- Y
#### Screenshot: