module t_Mixed_Sync ();
parameter PROG_ENUM = 3;

default mixed_sync_enum_type = PROG_ENUM;

wire sync;
wire resetn;
wire clock;

Mixed_Sync M1 (sync, resetn, clock);
endmodule
### Modified Testbench:
module tb_t_Mixed_Sync ();
t_Mixed_Sync M2 (sync, resetn, clock);
endmodule
### Original Code:
module t_Reset_Sync ();
wire sync