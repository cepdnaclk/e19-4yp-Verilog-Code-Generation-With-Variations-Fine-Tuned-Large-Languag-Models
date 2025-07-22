```verilog
module Johnson_Counter(count, enable, clock, reset);
    output [3: 0] count;
    input enable;
    input clock, reset;
    reg [3: 0] count;
    parameter array_size = 8; // size of the array
    integer error_counter = 0; // counter for errors
    genvar i; // generate variable
    generate
        for (i = 0; i < array_size; i = i + 1) begin: counter_loop
            always @(posedge clock, posedge reset) begin
                if(reset == 1) begin
                    count <= i;
                end
                else if(enable == 1) begin
                    if (i == 0) begin
                        if(count == 4'b1000) 
                            error_counter <= error_counter + 1;
                        count <= 0;
                    end
                    else if(4'b0000 ||
                            4'b0001 ||
                            4'b0011 ||
                            4'b0111 ||
                            4'b1111 ||
                            4'b1110 ||
                            4'b1100 ||
                            4'b1000) begin
                        if(count!= (i + 1)) 
                            error_counter <= error_counter + 1;
                        count <= i + 1;
                    end
                    else begin
                        error_counter <= error_counter + 1;
                    end
                end
            end
        end
    endgenerate
endmodule

module t_Johnson_Counter();
    wire [3:0] count;
    reg enable;
    reg clock, reset;
    Johnson_Counter M0(count, enable, clock, reset);
    initial #500 $finish;
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end
    initial fork
        begin
            reset = 1;
            #30 reset = 0;
            #30 enable = 1;
            for(integer i = 0; i < 9; i = i + 1) begin
                #1000;
            end
            enable = 0;
        end