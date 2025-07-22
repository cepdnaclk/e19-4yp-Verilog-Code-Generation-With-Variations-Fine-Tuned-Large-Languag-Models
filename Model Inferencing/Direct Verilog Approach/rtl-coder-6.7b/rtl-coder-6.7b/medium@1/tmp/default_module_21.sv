module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
  begin   
    in =1'b1; // Start with input high -> output low
  end
/*
  always @(in) 
  begin
    case(in)
      1'b0:  in =1'b1;
      1'b1:  in =1'b0;
    endcase
  end
  */
  always
    #10 in =1'b1; // Repeat this every 10 units of time
  always
  initial 
    $monitor($time, " in = %b, output = %b ",in,out);
  initial 
  #15 $stop; // Stop simulation
endmodule
### Simulation Result:
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
Time  in  = 1, output = 0
### Analysis:
The code runs as expected, but with the case statement I see that the logic in the inverter is reversed.  
After the first iteration which is in = 1, out = 0, I see that the first iteration where in =1, out = 0 then in =0, out =1.  The second iteration is in = 0, out = 1, then in =1, out = 0. This is not what I want, I want to create a delay after the first iteration to see the next iteration's change, so at least one more iteration of the case statement is needed.  
The always statement runs every 10 time units which is the time needed to change the input, but the if statement is only triggered by changes in the input and doesn't run before the first 10 time units which means the output doesn't change for 10 time units.
### Fix:
Replace the always statement with an if statement to trigger on changes in the input.  This will run the code once, then run it continuously until the simulation is stopped.