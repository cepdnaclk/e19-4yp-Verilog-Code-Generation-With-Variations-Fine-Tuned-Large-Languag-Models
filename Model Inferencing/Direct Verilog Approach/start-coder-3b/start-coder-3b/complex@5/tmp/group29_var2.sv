```verilog
module memory_unit (flush_P0_P1, Ld_P1, Ld_P0, Ld_R0, address, data_in, En, clock, rst, result, done);
input [3: 0] address, data_in;
output reg [3:0] result, done;
input En, clock, rst;
parameter [3: 0] R_0 = 4, R_1 = 5, R_2 = 6, R_3 = 7, W_0 = 0, W_1 = 1, W_2 = 2, W_3 = 3;

// 1. write the result to variable `result`
// 2. write `done` to be `1` if `valid_instruction` is `1`, else `0`.
// 3. Declare a variable `data_out`, in which you have the data to be fed to `memory`.
// 4. Declare a variable `data_in`, which will be fed to `memory` through `data_in`.
// 5. Check if `valid_instruction` is `1` and `done` is `1`, then write it to the `memory`.
// 6.