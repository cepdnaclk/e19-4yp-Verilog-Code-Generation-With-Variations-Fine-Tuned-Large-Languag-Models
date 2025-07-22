module delay_struct(Result);
    output struct packed {
        bit [31:0] Result;
    } Result;
endmodule

module test;
    logic [31:0] Result;
    initial begin
        delay_struct inst_delay_struct(.Result(Result));
        $display("Result = %d", Result);
        $finish;
    end
endmodule