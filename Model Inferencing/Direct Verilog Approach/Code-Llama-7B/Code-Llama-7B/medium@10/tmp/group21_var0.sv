module tst_nm_in();
  reg [3:0] in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in = 4'b1111; // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
initial
  begin
    for (i=0;i<20;i=i+1)
    #10 in=incr(in);
    $stop; // Stop simulation
  end
  // Case statement to increment input
  function [3:0] incr(input [3:0] in);
    case(in)
      4'b0000 : incr=4'b0001;
      4'b0001 : incr=4'b0011;
      4'b0010 : incr=4'b0101;
      4'b0011 : incr=4'b0111;
      4'b0100 : incr=4'b1001;
      4'b0101 : incr=4'b1011;
      4'b0110 : incr=4'b1101;
      4'b0111 : incr=4'b1111;
      4'b1000 : incr=4'b1001;
      4'b1001 : incr=4'b1011;
      4'b1010 : incr=4'b1101;
      4'b1011 : incr=4'b1111;
      4'b1100 : incr=4'b1001;
      4'b1101 : incr=4'b1011;
      4'b1110 : incr=4'b1101;
      4'b1111 : incr=4'b1111;
      default : incr=4'b0000;
    endcase
  endfunction
  initial
  begin
    for (i=0;i<20;i=i+1)
    #10 in=incr(in);
    $stop; // Stop simulation
  end
  // Case statement to increment input
  function [3:0] incr(input [3:0] in);
    case(in)
      4'b0000 : incr=4'b0001;
      4'b0001 : incr=4'b0011;
      4'b0010 : incr=4'b0101;
      4'b0011 : incr=4'b0111;
      4'b0100 : incr=4'b1001;
      4'b0101 : incr=4'b1011;
      4'b0110 : incr=4'b1101;
      4'b0111 : incr=4'b1111;
      4'b1000 : incr=4'b1001;
      4'b1001 : incr=4'b1011;
      4'b1010 : incr=4'b1101;
      4'b1011 : incr=4'b1111;
      4'b1100 : incr=4'b1001;
      4'b1101 : incr=4'b1011;
      4'b1110 : incr=4'b1101;
      4'b1111 : incr=4'b1111;
      default : incr=4'b0000;
    endcase
  endfunction
  initial
  begin
    for (i=0;i<20;i=i+1)
    #10 in=incr(in);
    $stop; // Stop simulation
  end
  //