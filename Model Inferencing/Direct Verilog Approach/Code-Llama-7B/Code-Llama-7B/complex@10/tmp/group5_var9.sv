class mealy;
    logic w, z;
    logic [1:0] y, Y;
    // logic [1:0] y;
    parameter A = 0, B = 1;
    
    typedef enum {A, B} t_state;
    t_state state;
    t_state next_state;
    
    function new();
        state = A;
    endfunction
    
    function void reset;
        y = A;
    endfunction
    
    task transition;
        case (y)
            A: if (`w)
                begin
                    z = 0;
                    Y = B;
                end
            else
                begin
                    z = 0;
                    Y = A;
                end
            B: if (`w)
                begin
                    z = 1;
                    Y = B;
                end
            else
                begin
                    z = 0;
                    Y = A;
                end
        endcase
    endtask
    
    task next;
        next_state = current;
        transition;
        state = next_state;
    endtask
    
    task current;
        y = state;
    endtask
    
    task drive;
        repeat (1) @(posedge Clock);
        w = w_input;
        next;
        current;
        #1;
    endtask
endclass
module mealy(Clock, Resetn, w, z);
    input Clock, Resetn, w;
    output z;
    logic [1:0] y, Y, z;
    t_state state;
    parameter A = 0, B = 1;
    initial begin
        mealy mealy = new();
    end
    always @(posedge Clock) begin
        if (Resetn == 0)
            begin
                state.reset();
            end
        else
            begin
                state.drive(w);
            end
    end
endmodule