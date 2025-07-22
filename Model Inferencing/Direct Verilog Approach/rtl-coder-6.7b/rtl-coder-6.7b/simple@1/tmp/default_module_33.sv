module ha_2(s,ca,a,b); // Half Adder
  input a,b; output s,ca;
  ha_gate(s,ca,a,b);
  typedef struct { int s,ca; } ha_param_t;
  ha_param_t ha_param;
  always @(*) begin
    if (a == 0 && b == 0) begin
      ha_param.s = ha_param.ca = 1;
    end else begin
      ha_param.s = 0;
      ha_param.ca = 0;
    end
  end
  xor #(1,2) (s,a,b);
  and #(3,4) (ca,a,b);
endmodule