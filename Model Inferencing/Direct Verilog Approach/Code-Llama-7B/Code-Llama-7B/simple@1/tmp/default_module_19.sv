module dff_test;
    parameter W_NUM = 1;
    localparam D_WIDTH = 1;
    localparam C_WIDTH = 1;
    localparam R_WIDTH = 1;
    localparam Q_WIDTH = 1;
    logic clk, resetn, en;
    logic [D_WIDTH-1:0] din, dout;
    logic [W_NUM*D_WIDTH-1:0] din_v, dout_v;
    logic [C_WIDTH-1:0] clk_sig, resetn_sig;
    logic [W_NUM*C_WIDTH-1:0] clk_v, resetn_v;
    logic [W_NUM*Q_WIDTH-1:0] q_v;
    
    dff_inst #(D_WIDTH) dff_inst (
       .D(din),.Clock(clk),.Resetn(resetn),.Q(dout));

    int N_test_vector = 1;
    always @ (posedge clk) begin
        din <= din_v;
        clk <= clk_v;
        resetn <= resetn_v;
    end

    initial begin
        clk <= 0;
        resetn <= 0;
        en <= 0;
        din <= 0;
        clk_v <= 0;
        resetn_v <= 0;
        en <= 0;
        din_v <= 0;
        clk_sig <= 0;
        resetn_sig <= 0;
        din_v[0] <= 0;
        clk_v[0] <= 0;
        resetn_v[0] <= 0;
        dout_v[0] <= 0;

        #1;
        clk_v[0] <= 1;
        resetn_v[0] <= 1;
        en <= 1;
        din_v[0] <= 1;
        clk_sig <= 1;
        resetn_sig <= 1;
        #1;
        clk_v[0] <= 0;