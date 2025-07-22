```
`include "Config.bsv"
`include "Gates.bsv"

module ha_4_delay#(type delay_t)(delay_cfg,s,ca,a,b);
  parameter delay_t delay_cfg;
  input a,b; output s,ca;
  Xor2Gate #(delay_cfg.s) s1(.out(s),.in({a,b}));
  And2Gate #(delay_cfg.ca) ca1(.out(ca),.in({a,b}));
endmodule

typedef struct{signed int s,ca;} ha_4_delay_config_t;

module ha_4_delay_test;
  AddrValue #(ha_4_delay_config_t) delay_cfg_val <-mkAddrValue('{s: 2, ca: 4});
  ha_4_delay #(ha_4_delay_config_t) dut <-mkha_4_delay(delay_cfg_val);
endmodule

// Alternative:

module ha_4_delay_alt#(type delay_t)(delay_t delay_cfg,s,ca,a,b);
  input a,b; output s,ca;
  Xor2Gate #(delay_cfg.s) s1(.out(s),.in({a,b}));
  And2Gate #(delay_cfg.ca) ca1(.out(ca),.in({a,b}));
endmodule

typedef struct{signed int s,ca;} ha_4_delay_config_t;

module ha_4_delay_test_alt;
  ha_4_delay_config_t delay_cfg = '{s: 2, ca: 4};
  ha_4_delay_alt #(ha_4_delay_config_t) dut <-mkha_4_delay(delay_cfg);
endmodule
### Output: