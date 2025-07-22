package or_fr_rl #(parameter Width=1, parameter T=100)
(
  input clock, reset,
  input [Width-1:0] DataIn,
  input [Width-1:0] DataOut,
  input force, release, enable,
  output enable_n
);

logic [Width-1:0] D_in, D_out;
logic [Width-1:0] D_in_f, D_in_r, D_in_c_n;
logic [Width-1:0] Data_c_n, Data_c_f, Data_c_r;
localparam l_DataIn_force = 5'h01;
localparam l_DataIn_release = 5'h00;
localparam l_DataIn_c_force = 5'h02;
localparam l_DataIn_c_release = 5'h03;
localparam l_DataIn_c_n = 5'h04;
localparam l_DataOut_f = 5'h01;
localparam l_DataOut_release = 5'h00;

always@(posedge reset or posedge clock)
  if(reset)
    begin
      D_in_f <= 1'b0; D_in_r <= 1'b0;
      Data_c_n <= 1'b0;
      D_in_c_n <= 1'b0;
      enable_n <= 1'b1;
    end
  else
    begin
      if(enable)
        if(force)
          if(D_in_f)
            begin
              D_out <= DataOut;
              D_in_c_f <= DataIn;
              D_in_c_n <= 1'b1;
            end
          else if(D_in_r)
            begin
              D_out <= DataOut;
              D_in_c_r <= DataIn;
              D_in_c_n <= 1'b1;
            end
          else
            begin
              D_in_c_n <= 1'b0;
            end
        else if(release)
          if(D_in_r)
            begin
              D_out <= DataOut;
              D_in_c_r <= DataIn;
              D_in_c_n <= 1'b1;
            end
          else if(D_in_f)
            begin
              D_out <= DataOut;
              D_in_c_f <= DataIn;
              D_in_c_n <= 1'b1;
            end
          else
            begin
              D_in_c_n <= 1'b0;
            end
        else
          begin
            D_in_c_n <= 1'b1;
            D_in_f <= 1'b0;
            D_in_r <= 1'b0;
          end
      else
        begin
          D_in_c_n <= 1'b1;
          D_in_f <= 1'b1;
          D_in_r <= 1'b1;
        end
      end

      if(D_in_c_n)
        if(D_in_c_f)
          D_in_c_n <= 1'b1;
        else if(D_in_c_r)
          D_in_c_n <= 1'b0;
      else if(D_in_c_f)
        D_in_c_n <= 1'b1;
      else if(D_in_c_r)
        D_in_c_n <= 1'b0;

      D_in <= D_in_c_n;
      D_out <= DataOut;
      enable_n <= 1'b1;
    end

endmodule
### Result:

```

<img