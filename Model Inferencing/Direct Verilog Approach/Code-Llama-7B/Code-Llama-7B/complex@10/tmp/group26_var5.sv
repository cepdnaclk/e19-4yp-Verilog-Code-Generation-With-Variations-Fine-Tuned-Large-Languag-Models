module JerkyComparator_tb;
reg ClockIn, PLLClock, Reset;
wire [1:0] AdjustFreq;

// Declare Interface
interface iInterface;
    logic [1:0] i;
endinterface

// Instantiate DUT
jerky_comparator uut(.AdjustFreq(AdjustFreq),
                   .ClockIn(ClockIn),
                   .PLLClock(PLLClock),
                   .Reset(Reset)
);

// Declare Interface instance
iInterface iface_ins();
// Assign actual interface signal to interface signal inside tb
assign iface_ins.i = uut.AdjustFreq;

initial begin
    // Reset signal
    Reset = 1'b1;
    // Clocking
    ClockIn = 1'b0;
    PLLClock = 1'b0;
    #1;
    // Deassert reset signal
    Reset = 1'b0;
    #10;
    // Load stimulus data into the interface instance
    iface_ins.i = 2'b01;
    iface_ins.i = 2'b11;
    iface_ins.i = 2'b00;
    iface_ins.i = 2'b10;
    iface_ins.i = 2'b10;
    #10;
    $display("interface i value: %h at time %t", iface_ins.i, $time);
    // Clocking
    ClockIn = 1'b1;
    PLLClock = 1'b0;
end

// Clock Generation
always #5 ClockIn = ~ClockIn;
always #10 PLLClock = ~PLLClock;
endmodule
### Resulting Code:
module JerkyComparator_tb;
reg ClockIn, PLLClock, Reset;
wire [1:0] AdjustFreq;

// Declare Interface
interface iInterface;
    logic [1:0] i;
    modport tb(output i);
endinterface

// Instantiate