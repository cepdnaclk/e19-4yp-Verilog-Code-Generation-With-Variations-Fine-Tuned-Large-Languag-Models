```C++
class LS115
{
    public:
        LS115(sc_module_name name);
        ~LS115();
        void SetInput(bool a, bool b);
        void output_out();
    private:
        void update_out();

        bool reset_ = false;
        bool out_ = 0;
        bool clk_ = 0;
        bool rstn_ = 1;
        bool a_ = 0;
        bool b_ = 0;

        bool out_internal = 0;
        bool out_next = 0;
        bool a_internal = 0;
        bool b_internal = 0;
};
```

### SV Code:
```SystemVerilog
module 74ls115(a, b, out);

input a, b;
output out;
reg out, O;

initial clk <= 0, rstn <= 1;

always @(posedge Clock) clk <= clk;
always @(posedge Resetn) rstn <= Resetn;

always @(a or b)
    case (a)
        0: if (b)
            begin
                O = 1;
            end
        1: begin
                O = 0;
            end
    endcase

always @(negedge rstn or posedge Clock)
    if (rstn == 0) out <= 0;
    else out <= O;
endmodule
```
#include <systemc.h>

class LS115 {
private:
    bool reset_ = false;
    bool out_ = 0;
    bool clk_ = 0;
    bool rstn_ = 1;
    bool a_ = 0;
    bool b_ = 0;

    bool out_internal = 0;
    bool out_next = 0;
    bool a_internal = 0;
    bool b_internal = 0;

public:
    LS115(sc_module_name name);
    ~LS115();
    void SetInput(bool a, bool b);
    void output_out();

private:
    void update_out();
};

class LS115_array {
private:
    bool reset_ = false;
    bool y_ = 0;
    bool clk_ = 0;
    bool rstn_ = 1;

    bool y_internal = 0;
    bool y_next = 0;

public:
    LS115_array(sc_module_name name);
    ~LS115_array();
    void SetInput(bool a, bool b);
    void output_y();

private:
    void update_y();
};

class LS115_array_slice {
private:
    bool