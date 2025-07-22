initial begin /*... Figure 8.11... */
for(indx = 0; indx <= 2; indx = indx + 1) begin
  mem1[indx] <= 8'h03;
  mem2[indx] <= 8'h04;
end
Apply_Data: for(indx = 0; indx <= 2; indx = indx + 1) begin
  im_data <= mem1[indx];
  @(posedge clk);
  im_data <= mem2[indx];
  @(posedge clk);
  #50;
end
end
### References:
https://www.chipverify.com/systemverilog/mda-array-selections-using-generate-block
https://www.chipverify.com/systemverilog/systemverilog-generate-block
https://www.chipverify.com/systemverilog/systemverilog-inside-operator
https://www.chipverify.com/systemverilog/systemverilog-generate-statement-and-generate-block-reference
https://www.chipverify.com/systemverilog/systemverilog-generate-block-statements-and-labels
### Source Link:
https://www.chipverify.com/systemverilog/systemverilog-generate-block-statements-and-labels
https://www.chipverify.com/systemverilog/systemverilog-generate-block