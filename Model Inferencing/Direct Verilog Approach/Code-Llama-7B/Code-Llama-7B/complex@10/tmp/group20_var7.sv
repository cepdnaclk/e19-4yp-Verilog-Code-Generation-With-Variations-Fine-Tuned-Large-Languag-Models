// Original:
assign $state_Mealy = ~reset;
// Variant:
assign $state_Mealy = inside({`RESET_STATE, `IDLE_STATE, `READ_STATE, `WRITE_STATE});
### Code Generation:
```
// Original:
assign $state_Mealy = ~reset;
// Variant:
assign $state_Mealy = inside({`RESET_STATE, `IDLE_STATE, `READ_STATE, `WRITE_STATE});
```