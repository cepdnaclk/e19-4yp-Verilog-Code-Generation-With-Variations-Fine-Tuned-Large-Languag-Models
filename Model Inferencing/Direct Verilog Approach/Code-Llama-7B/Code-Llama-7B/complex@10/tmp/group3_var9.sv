always @ (posedge clk) if (rst) 
        state_Moore <= S_0; 
    else begin
        state_Moore <= next_state;
        if(inside({1'b1,S_0},state_Moore) ||
           inside({1'b1,S_1},state_Moore) ||
           inside({1'b1,S_7},state_Moore) ||
           inside({1'b1,S_6},state_Moore) ||
           inside({1'b1,S_5},state_Moore)) 
           Detect_Moore_1 = 1;
        else
           Detect_Moore_1 = 0;
       end
    always @ (state_Moore, D_in) begin
        next_state = S_0;
        case (state_Moore)
            S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_5;
            S_1: if (D_in) next_system = S_2; else if (D_in == 0) next_state = S_5;
            S_2: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_5;
            S_3: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_4;
            S_4: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
            S_5: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
            S_6: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_7;
            S_7: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_7;
            S_8: if (D_in)