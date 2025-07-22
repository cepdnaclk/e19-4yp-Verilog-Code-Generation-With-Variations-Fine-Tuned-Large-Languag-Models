module IR ( input [7:0] data_in[3:0], input load, clk, output reg [1:0] data_out[1:0] );
// Multi-dimensional indexed write
always @( posedge clk )
if ( load ) data_out <= {data_in[1:0]};
endmodule

### 4.1.5 Multiple Array Reads

The next step is to create a multiple array read. The module will take five inputs, a 3D packed array, a 2D packed array, and a 2D packed array. The 2D packed logic-vector arrays are expected to be the indices into the 3D packed logic-vector array. The module will read two elements of the 3D array based on the element in the 2D packed array that is indexed into the 3D packed array. The module will then read one element of the 3D array based on the element in the 2D packed array that is indexed into the 3D packed array.

The following is a test bench that reads two elements of the data_in array at the index of data_index[0] and reads the element of the data_in array at the index of data_index[0] and data_index[1