module StateMachine (output xPart, input state, a, b, c);
reg [7:0] count;
assign xPart = count[0];
always @(state)
begin: StateList
    if (count[0] < 100) begin: StateList2
        count <= count + 1;
    end end
end
endmodule
```

Below is a table of all the variations tested with their test benches and scores.

Variation | Score | Test Bench |
-- | -- | --
Original | 50 | https://github.com/Ryan-M-Harrison/event-control-verilog-test/tree/main/StateMachine/StateMachine4 |
Improved | 75 | https://github.com/Ryan-M-Harrison/event-control-verilog-test/tree/main/StateMachine/StateMachine4 |

## 1 State Machine

This fifth variation was the one that took the most