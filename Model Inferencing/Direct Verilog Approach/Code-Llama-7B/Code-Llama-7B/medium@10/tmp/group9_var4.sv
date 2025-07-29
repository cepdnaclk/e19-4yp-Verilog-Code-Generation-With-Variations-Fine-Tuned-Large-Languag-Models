module case_test; // Simple test for case functionality
  parameter a = 0;
  initial
  begin
    case (a)
      1: begin
        end
      2: begin
          $display("a=1");
        end
      3: begin
          $display("a=1");
        end
    endcase
  end
  initial
  begin
    case (a)
      1: begin
        end
      2: begin
          $display("a=2");
        end
      3: begin
          $display("a=3");
        end
    endcase
  end
  initial
  begin
    case (a)
      1: begin
        end