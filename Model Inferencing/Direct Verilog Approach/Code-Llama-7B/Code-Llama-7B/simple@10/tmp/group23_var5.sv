module TestModule #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
Qunit.module("Verilog Type Compatibility", {});
Qunit.test("FourFlopsStructL: vector compatibility test with byte-type", function (ok) {
    var ok = QUnit.assert;
    var verilogCode ='module FourFlopsStructL #(parameter DClk = 2, DBuf = 1) '+
        '(output[3:0] Q, input[3:0] D, input Ena, Clk);'+
        'wire[3:0] QWire;'+
        'localparam DTot = DBuf + DClk;'+
        'DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));'+
        'assign #DTot Q = (Ena==1\'b1)? QWire : \'bz;'+
        'endmodule';
    var testBenchCode ='module TestModule #(parameter DClk = 2, DBuf = 1) '+
        '(output[3:0] Q, input[3:0] D, input Ena, Clk);'+
        'wire[3:0] QWire;'+
        'localparam DTot = DBuf + DClk;'+
        'DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));'+
        'assign #DTot Q = (Ena==1\'b1)? QWire : \'bz;'+
        'endmodule';
    var design = Util.getDesign({
        code: verilogCode,
        top: 'Test