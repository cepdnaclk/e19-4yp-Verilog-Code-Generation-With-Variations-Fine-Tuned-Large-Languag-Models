module tst_CMOSsw1();
  reg in,con;wire out;
  CMOSsw1 cmsw[0:3](out,in,con);
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out[3:1]);
  initial #20 $stop; // Stop simulation
endmodule
### Reference Design:
![reference1](https://user-images.githubusercontent.com/62727894/128593451-e6a41d77-6f74-4b2b-9b00-f0d8403a150f.png)

### Synthesised Verilog Code:
![synth1](https://user-images.githubusercontent.com/62727894/128593653-a9c50929-c57b-4c63-90c9-23d8b64a41b2.png)

### Simulation Result:
![sim1](https://user-images.githubusercontent.com/62727894/128593675-44566724-f97c-4d51-b98c-fba176179b84.png)

### Synthesised Verilog Code:
![synth2](https://user-images.githubusercontent.com/62727894/128593694-942f845d-4169-446b-942e-a55008397e19.png)

### Simulation Result:
![sim2](https://user-images.githubusercontent.com/62727894/128593679-83f7d34f-d50c-4a3c-b3c4-c64c5c052e70.png)

### Synthesised Verilog Code:
![synth3](https://user-images.githubusercontent.com/62727894/128593707-08d6146c-7f0b-4e33-aa3c-6be948f6c940.png)

### Simulation Result:
![sim3](https://user-images.githubusercontent.com/62727894/128593712-4ff6693c-8771-47d9-a9d3-ac5744fa9a8c.png)

### Synthesised Verilog Code:
![synth4](https://user-images.githubusercontent.com/62727894/128593719-02b13980-431b-4e1f-875f-9827a4d9b042.png)

### Simulation Result:
![sim4](https://user-images.githubusercontent.com/62727894/128593722-a0404f92-c52d-4c1b-bfdd-07bb1509904c.png)

### Synthesised Verilog Code:
![synth5](https://user-images.githubusercontent.com/62727894/128593730-0289c875-7307-41a8-bd17-1254906e99a8.png)

### Simulation Result:
![sim5](https://user-images.githubusercontent.com/62727894/128593725-56