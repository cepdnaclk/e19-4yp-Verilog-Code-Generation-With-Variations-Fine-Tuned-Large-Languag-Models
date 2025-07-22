module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
integer i, j;
reg [2:0] reg_array [2];
reg [2:0] reg_array_var [0];

initial begin
    for (i = 0; i < 3; i = i + 1) begin
        reg_array[i] = i;
    end
end
always @(posedge Clock)
begin
    j = 0;
    while (j < 3) begin
        Q1 <= reg_array[j];
        j = j + 1;
    end
    Q2 <= Q1;
end
endmodule
### Modifications:
- Add loop variable before while condition.
- Add loop variable inside of while condition.
- Add loop variable outside of while condition.
- Add loop variable inside of while body.
- Add loop variable inside of while body, with no assignment statement.

### Expected output:
- 00
- 10
- 01
- 00
- 00

### Expected error:
- Variable has already been declared.
- Variable is out of scope.