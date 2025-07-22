module AndOr (output X, Y, input A, B, C);
assign #10 X = A & B; //Note the & symbol for bitwise AND
assign #10 Y = B | C; //Note the | symbol for bitwise OR
endmodule

## How to use the code:
### Method 1:
Run the code using the command:
### `make`
### Method 2:
Alternatively, the code can be compiled and linked using the command:
### `vlog -sv <input_filename.v>`