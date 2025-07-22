```verilog
`timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(tplh2, tphl2) (y, im1, im2, im3);

always @(*) begin
    int arr[3] = {im1, im2, im3};
    int result;
    always @(*) begin
        result = arr[get_random_index()]; // function call returning random index
    end
    y = result;
end
endmodule
```
In the modified code, a `get_random_index()` function is defined in the always block. This function returns a random index between 0 and 2 inclusive. The expression inside the always block calls this function and takes an operand from a randomly selected position in an array. Please replace `get_random_index()` with the actual function that generates random number.

Note: Verilog doesn't support dynamic array indices. The always block will not synthesize because Verilog does not support this operation. For synthesizable code, you may have to use a separate array of logic signals.

Also, keep in mind that the above code is a randomized sample and may not work as expected. It is meant just to showcase the idea of using a function inside an always block to create a random number within a range. In reality, Verilog does not support random statements or expressions. 

You may want to consider using the randomizer or a specific tool in your synthesis flow to generate random numbers based on some criteria. This might be based on a seed or a seeded LFSR for instance. However, Verilog does not natively support this kind of feature. Be sure to use tools or synthesis constraints that support it for hardware description.

It's advised to avoid using always block which are for continuous synthesis in Verilog/Systemver