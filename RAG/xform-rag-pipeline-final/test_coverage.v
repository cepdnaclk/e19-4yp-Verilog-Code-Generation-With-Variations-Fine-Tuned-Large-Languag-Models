// test_coverage.v - For coverage testing
module coverage_test(
    input wire [7:0] test_value,
    output reg result
);
    logic [7:0] test_array [0:7];
    logic [7:0] dynamic_array [];
    
    initial begin
        for (int i = 0; i < 8; i++) begin
            test_array[i] = i * 10;
        end
        dynamic_array = new[4];
        for (int i = 0; i < 4; i++) begin
            dynamic_array[i] = i * 5;
        end
    end
    
    always @(*) begin
        result = (test_value inside {test_array}) || 
                 (test_value inside {dynamic_array});
    end
endmodule