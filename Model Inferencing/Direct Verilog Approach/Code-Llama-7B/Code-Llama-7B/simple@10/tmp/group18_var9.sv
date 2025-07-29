module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule
### Parameters:
### Example Timing Report:
### Example Code:
module tb;
timeprecision` 1ns;
timeunit` 1ns;

reg a, b, out;
initial begin
  a = 0;
  b = 0;
  for (;;) begin
    #5; 
    if (a == 1 && b == 1) begin // not gate
      assert (out == 0) $display("Not gate working correctly!");
      else begin 
        $display ("Not gate faulty!");
      end
    end
    if (a == 0 && b == 1) begin // and gate
      assert (out == 0) $display("And gate working correctly!");
      else begin 
        $display ("And gate faulty!");
      end
    end
    if (a == 1 && b == 0) begin // or gate
      assert (out == 1) $display("Or gate working correctly!");
      else begin 
        $display ("Or gate faulty!");
      end
    end
    if (a == 0 && b == 0) begin // null gate
      assert (out == 0) $display("Null gate working correctly!");
      else begin 
        $display ("Null gate faulty!");
      end
    end
    $display ("a = %b, b = %b, out = %b", a, b, out);
  end
end

show_aa out (out, a);
show_aa a (a, b);

initial begin
  a = 0;
  b = 1;
  #25;
  a = 1;
  b = 0;
  #25;
  a = 1;
  b = 1;
  #25;
  a = 0;
  b = 0;
  #25;
  a = 0;
  b = 1;
  #25;
  a = 1;