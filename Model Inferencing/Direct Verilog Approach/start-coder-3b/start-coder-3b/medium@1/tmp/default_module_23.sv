module StraightLine(DataOut, DataIn);
output[7:0] DataOut;
input [7:0] DataIn;
parameter numCnt = 8'b00000010;
parameter numRange = 8'b00000001;
reg [7:0] cnt;
assign DataOut = DataIn;
always @(posedge clk)
    begin
        if (cnt==numCnt)
            cnt <= cnt + 1;
        else
            cnt <= cnt + numRange;
    end
endmodule
### Simulation result:
<img src="https://raw.githubusercontent.com/Shane123D/img-folder/master/2020-06-10_08-46-59_Screenshot.png" alt="Result Image" title="