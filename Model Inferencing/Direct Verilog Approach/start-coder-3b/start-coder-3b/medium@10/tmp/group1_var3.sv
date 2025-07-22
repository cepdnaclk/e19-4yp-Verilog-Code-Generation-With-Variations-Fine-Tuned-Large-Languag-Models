`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        default: ParOut <= 8'bX;
    endcase
end
endmodule

```

### 2.31 Using Case Statement:
`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        default: ParOut <= 8'bX;
    endcase
end
endmodule

```
/lab4/README.md
# ECE 314 Lab 4

##, 

### 4.1 Write a 5400-word 25-GHz 8x64 RAM

```
module DDR3(
    input wire [3:0] d3_dqs_i,		//Input Data from DRAM
    input wire [3:0] d3_dqs_o,		//Output Control Data from DRAM
    output wire [3:0] d3_dq0_i,
    output wire [3:0] d3_dq1_i,
    output wire [3:0] d3_dq2_i,
    output wire [3:0] d3_dq3_i,
    output wire [3:0] d3_dq4_i,
    output wire [3:0] d3_dq5_i,
    output wire [3:0] d3_dq6_i,
    output wire [3:0] d3_dq7_i,
    output wire [3:0] d3_dq0_o,
    output wire [3:0] d3_dq1_o,
    output wire [3:0] d3_dq2_o,
    output wire [3:0] d3_dq3_o,
    output wire [3:0] d3_dq4_o,
    output wire [3:0] d3_dq5_o,
    output wire [3:0] d3_dq6_o,
    output wire [3:0] d3_dq7_o
);

reg     [9:2] dram_addr,
            dram_rdata,
            dram_wdata,
            dram_cmd;

always @(posedge clk) begin

    d3_dq0_i <= d3_dqs_i[3:0];	//Input Data from DRAM
    d3_dq1_i <= d3_dqs_i[7:4];
    d3_dq2_i <= d3_dqs_i[11:8];
    d3_dq3_i <= d3_dqs_i[15:12];
    d3_dq4_i <= d3_dqs_i[19:16];
    d3_dq5_i <= d3_dqs_i[23:20];
    d3_dq6_i <= d3_dqs_i[27:24];
    d3_dq7_i <= d3_dqs_i[31:28];

    dq0_oe <= ~dq0_we;		//Output Control Data from DRAM
    dq1_oe <= ~dq1_we;
    dq2_oe <= ~dq2_we;
    dq3_oe <= ~dq3_we;
    dq4_oe <= ~dq4_we;
    dq5_oe <= ~dq5_we;
    dq6_oe <= ~dq6_we;
    dq7_oe <= ~dq7_we;

    dq0_oe <= dq0_we;	//Control
    dq1_oe <= dq1_we;
    dq2_oe <= dq2_we;
    dq3_oe <= dq3_we;
    dq4_oe <= dq4_we;
    dq5_oe <= dq5_we;
    dq6_oe <= dq6_we;
    dq7_oe <= dq7_we;

    dq0_we <= dram_cmd[0];	//Command from Controller
    dq1_we <= dram_cmd[1];
    dq2_we <= dram_cmd[2];
    dq3_we <= dram_cmd[3];
    dq4_we <= dram_cmd[4];
    dq5_we <= dram_cmd[5];
    dq6_we <= dram_cmd[6];
    dq7_we <= dram_cmd[7];

    dq0_o <= dram_wdata[0];	//Output Data from Controller
    dq1_o <= dram_wdata[1];
    dq2_o <= dram_wdata[2];
    dq3_o <= dram_wdata[3];
    dq4_o <= dram_wdata[4];
    dq5_o <= dram_wdata[5];
    dq6_o <= dram_wdata[6];
    dq7_o <= dram_wdata[7];

    case (dram_cmd[1:0])	//Address Select
        0 : dram_addr = dram_addr;
        1 : dram_addr = dram_addr + 2'b10;
        2 : dram_addr = dram_addr + 2'b01;
        3 : dram_addr = dram_addr + 2'b00;
    endcase

    dram_rdata <= ({d3_dq0_o[3:0], d3_dq1_o[3:0], d3_dq2_o[3:0], d3_dq3_o[3:0], d3_dq4_o[3:0], d3_dq5_o[3:0], d3_dq6_o[3:0], d3_dq7_o[3:0]});

end

endmodule

module DRAMController(
    input wire [6:0] dram_addr,
    input wire dram_cmd,
    input wire dram_rdata,
    output wire [3:0] dram_wdata
);

reg     [15:0] mem[16'hffff][3:0];

always @(posedge clk) begin

    case (dram_cmd)

        0: dram_wdata <= mem[dram_addr];

        1: begin
            dram_wdata <= mem[dram_addr];
            mem[dram_addr] <= dram_wdata;
        end

        2: begin
            dram_wdata <= mem[dram_addr];
            mem[dram_addr] <= dram_rdata;
        end

        3: begin
            dram_wdata <= {4'h0, dram_addr[4:0], dram_addr[8:5], dram_addr[12:9], dram_addr[16:13]};
            mem[dram_addr] <= dram_wdata;
        end

        4: begin
            dram_wdata <= mem[dram_addr];
        end
    endcase

end

endmodule

```

### 4.2 Write a 5400-word 25-GHz 8x64 RAM

```
module DDR3(
    input wire [3:0] d3_dqs_i,		//Input Data from DRAM
    input wire [3:0] d3_dqs_o,		//Output Control Data from DRAM
    output wire [3:0] d3_dq0_i,
    output wire [3:0] d3_dq1_i,
    output wire [3:0] d3_dq2_i,
    output wire [3:0] d3_dq3_i,
    output wire [3:0] d3_dq4_i,
    output wire [3:0] d3_dq5_i,
    output wire [3:0] d3_dq6_i,
    output wire [3:0] d3_dq7_i,
    output wire [3:0] d3_dq0_o,