module tst_updcounter();//TEST_BENCH
reg clk,u_d;
reg[3:0]N;
wire[3:0]a;
updcounter c2(a,clk,N,u_d);

initial
begin
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up (Corrected: was 1'b0)
clk = 0;
end
initial begin
$dumpfile("updcount_dump.vcd");
$dumpvars(1,tst_updcounter);
end

always #2 clk=~clk; // Generate clock
always #34 u_d=~u_d; // Change direction every 34 time units
initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a); // Display values
initial #64 $stop; // Stop simulation
endmodule

module updcounter(
    output reg [3:0] a,
    input clk,
    input [3:0] N,
    input u_d
);
    reg [3:0] cnt;

    always @(posedge clk) begin
        if(N == cnt) begin
            if(u_d) begin
                cnt <= 4'b0;
            end
            else begin
                cnt <= N;
            end
        end
        else if(u_d) begin
            cnt <= cnt + 1;
        end
        else begin
            cnt <= cnt - 1;
        end
    end
    always @(posedge clk) begin
        a <= cnt;
    end
endmodule

module updcounter2(
    output reg [3:0] a,
    input clk,
    input [3:0] N,
    input u_d
);
    reg [3:0] cnt;

    always @(posedge clk) begin
        if(N == cnt) begin
            if(u_d) begin
                cnt <= 4'b0;
            end
            else begin
                cnt <= N;
            end
        end
        else if(u_d) begin
            cnt <= cnt + 1;
        end
        else begin
            cnt <= cnt - 1;
        end
    end
    always @(posedge clk) begin
        a <= cnt;
    end
endmodule

package counter_pkg;
    parameter RST_X = 2'b10;
endpackage

module tst_updcounter();//TEST_BENCH
reg clk,u_d;
reg[3:0]N;
wire[3:0]a;

updcounter c2(a,clk,N,u_d);

initial
begin
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up (Corrected: was 1'b0)
clk = 0;
end

always #2 clk=~clk; // Generate clock
always #34 u_d=~u_d; // Change direction every 34 time units
initial begin
$dumpfile("updcount_dump.vcd");
$dumpvars(1,tst_updcounter);
end

initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%