module regFile(readAddress, writeAddress, writeData, clock, writeEnable, readData);
input [2:0] readAddress;
input [2:0] writeAddress;
input [3:0] writeData;
input clock;
input writeEnable;
output [3:0] readData;
reg [3:0] regFile[0:7];
always @(posedge clock)
    if(writeEnable)
        regFile[writeAddress] <= writeData;
    else
        regFile[readAddress] <= regFile[readAddress];
assign readData[3:0] = inside regFile[readAddress];
endmodule
### Summary Instruction:
Change read data from regFile[readAddress] to inside regFile.
### Expected Output:
RegFile[3] = 0000
RegFile[3:1] = 0000, 0000, 0000
RegFile[3:2] = 0000, 0000, 0000, 0000
RegFile[3:3] = 0000, 0000, 0000, 0000, 0000
### Output:
RegFile[3] = 0000
RegFile[3:1] = 0000, 0000, 0000
RegFile[3:2] = 0000, 0000, 0000, 0000
RegFile[3:3] = 0000, 0000, 0000, 0000, 0000
### Theory
When the regFile is a dynamic