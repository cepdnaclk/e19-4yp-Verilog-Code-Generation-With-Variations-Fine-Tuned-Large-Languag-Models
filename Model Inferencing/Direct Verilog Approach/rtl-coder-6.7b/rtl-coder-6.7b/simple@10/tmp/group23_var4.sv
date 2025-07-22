package FourFlopsStruct_p;
typedef struct {
	logic [3:0] D;
	logic Ena;
} FourFlopsStruct_t;
endpackage
module FourFlopsStructL_modify #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam