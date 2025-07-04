```
module wire_assign( input in, output out );
    // Create a new clock array to hold all of our clocks
    clock_array #(
       .Clock_Count(8)
    ) clk_arr(
       .Clk_Clk_0(),
       .Clk_Clk_1():clk_reg_0,
       .Clk_Clk_2():clk_reg_1,
       .Clk_Clk_3():clk_reg_2,
       .Clk_Clk_4():clk_reg_3,
       .Clk_Clk_5():clk_reg_4,
       .Clk_Clk_6():clk_reg_5,
       .Clk_Clk_7():clk_reg_6,
    );

    // Create a data array to hold the states of our clocks
    logic_array #(
       .Logic_Count(8)
    ) clk_data(
       .State_0(),
       .State_1(),
       .State_2(),
       .State_3(),
       .State_4(),
       .State_5(),
       .State_6(),
       .State_7(),
    );

    // Create a clock reg for each clock
    clock clk_reg_0, clk_reg_1, clk_reg_2, clk_reg_3, clk_reg_4, clk_reg_5, clk_reg_6;

    // Create a clock switch for each clock
    logic clk_switch_0, clk_switch_1, clk_switch_2, clk_switch_3, clk_switch_4, clk_switch_5, clk_switch_6;

    // Create a state register for each clock
    logic state_0, state_1, state_2, state_3, state_4, state_5, state_6;

    // Create a state switch for each clock
    logic switch_0, switch_1, switch_2, switch_3, switch_4, switch_5, switch_6;

    // Create a wire to be used for assignment
    wire wire;

    // Assign the wire to the input
    assign wire = in;

    // Loop through the clocks
    integer i;
    for(i=0; i<8; i=i+1) begin: clock_index

        // Create a new clock
        clock clk = clk_reg_0;

        // Create a clock switch
        logic switch = clk_switch_0;

        // Create a state register
        logic state = state_0;

        // Create a state switch
        logic switch_state = switch_1;

wire_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_assign_