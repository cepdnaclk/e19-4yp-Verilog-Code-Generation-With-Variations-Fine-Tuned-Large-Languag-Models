```
module Ripple_Add;
    reg  [7:0] A, B; 
    reg  [15:0] C;
    reg  [7:0] S;
    wire [7:0] M;
    
    FA fa[4];
    
    always @* 
    begin
        C = A + B;
    end
    
    for (int i = 0; i < 4; i = i + 1) begin: fa_loop
        fa[i] = FA();
        fa[i].A = 8'h0;
        fa[i].B = 8'h1;
        fa[i].OP = i;
    end
    
    FA fa_1 = FA();
    FA fa_2 = FA();
    FA fa_3 = FA();
    
    assign S = fa_1.S + fa_2.S;
    assign M = fa_3.S;
    
    `DESIGN_UNIT_REGISTER_PARTS(
        "FA_MOD",
        0,
        "A",
        "A",
        8,
        "FA_MOD_A",
        "FA_MOD_A",
        8,
        "FA_MOD_B",
        "FA_MOD_B",
        8,
        "FA_MOD_S",
        "FA_MOD_S",
        8,
        "FA_MOD_O",
        "FA_MOD_O",
        0
    )
    `DESIGN_UNIT_REGISTER_PARTS(
        "FA_0",
        0,
        "A",
        "FA_0_A_N_Q",
        "FA_0_A_N_D",
        "FA_0_A_N_D",
        8,
        "B",
        "FA_0_B_N_Q",
        "FA_0_B_N_D",
        "FA_0_B_N_D",
        8,
        "S",
        "FA_0_S_N_Q",
        "FA_0_S_N