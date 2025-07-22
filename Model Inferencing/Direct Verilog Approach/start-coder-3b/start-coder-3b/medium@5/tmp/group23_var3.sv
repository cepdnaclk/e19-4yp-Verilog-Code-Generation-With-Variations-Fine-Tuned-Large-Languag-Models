module FSM (output[1:0] Obus, input[2:0] State, input Clk);
always @(posedge Clk) begin
    Obus <= (State == 2'b00)? 1'b0 : (State == 2'b01)? 1'b1 : (State == 2'b10)? 1'b0 : 1'b1;
end
endmodule