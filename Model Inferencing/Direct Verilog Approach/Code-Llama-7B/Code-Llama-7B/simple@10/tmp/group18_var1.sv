module show_bb(ao,ai); // NOT gate with delay 2
  output ao; input ao,ai;
  enum logic { default=0, non_default=1} ao, ai;
  not #2 (ao,ai);
endmodule
### Test Code:
initial
  begin
    integer i;
    show_bb out_aa, in_bb; // Declare an instance
    for (i=0; i<1000; i++)
      begin
        in_bb=i;
        in_bb=in_bb?default:non_default;
        @(posedge out_aa.ao); // Tick the clock
        $display("ao is %b", out_aa.ao);
      end
end
### Expected:
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao is 1
ao is 0
ao