module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output logic sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Tested Code:
module test_adder_logic;

logic [3:0] i1, i2;
logic cin, sum, cout;
logic [3:0] t_sum, t_cout;

initial begin
    i1 = 1;
    i2 = 0;
    cin = 0;
    #1;
    assert (sum == t_sum) else begin
        $error("Error: sum");
        $stop;
    end
    assert (cout == t_cout) else begin
        $error("Error: cout");
        $stop;
    end
    i1 = 1;
    i2 = 0;
    cin = 1;
    #1;
    assert (sum == t_sum) else begin
        $error("Error: sum");
        $stop;
    end
    assert (cout == t_cout) else begin
        $error("Error: cout");
        $stop;
    end
    i1 = 1;
    i2 = 1;
    cin = 0;
    #1;
    assert (sum == t_sum) else begin
        $error("Error: sum");
        $stop;
    end
    assert (cout == t_cout) else begin
        $error("Error: cout");
        $stop;
    end
    i1 = 1;
    i2 = 1;
    cin = 1;
    #1;
    assert (sum == t_sum) else begin
        $error("Error: sum");
        $stop;
    end
    assert (cout == t_cout) else begin
        $error("Error: cout");
        $stop;
    end
    i1 = 1;
    i2 = 1;
    cin = 0;
    #1;
    assert (sum == t_sum) else