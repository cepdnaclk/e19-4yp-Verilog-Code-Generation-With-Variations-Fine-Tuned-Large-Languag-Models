// test_complex.v - Complex module with FSM
module complex_test(
    input wire clk,
    input wire reset,
    input wire [7:0] cmd,
    output reg [31:0] result,
    output reg done
);
    typedef enum logic [2:0] {
        FSM_IDLE = 3'h0,
        FSM_PROCESS = 3'h1,
        FSM_DONE = 3'h2
    } fsm_state_t;
    
    fsm_state_t current_state;
    reg [31:0] data_array [0:15];
    
    always @(posedge clk) begin
        if (!reset) begin
            current_state <= FSM_IDLE;
            result <= 32'h0;
            done <= 1'b0;
        end else begin
            case (current_state)
                FSM_IDLE: if (cmd != 0) current_state <= FSM_PROCESS;
                FSM_PROCESS: begin 
                    result <= data_array[cmd[3:0]]; 
                    current_state <= FSM_DONE; 
                end
                FSM_DONE: begin 
                    done <= 1'b1; 
                    current_state <= FSM_IDLE; 
                end
            endcase
        end
    end
endmodule