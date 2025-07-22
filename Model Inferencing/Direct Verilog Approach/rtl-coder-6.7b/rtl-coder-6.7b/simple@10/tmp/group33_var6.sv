(* unpacked, indexed, type="basic" *)
struct{
  int Delay_1;
  int Delay_2;
  int Delay_3;
  int Delay_4;
  int Delay_5;
  int Delay_6;
  int Delay_7;
  }Gate_Delays;

module ha_1(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(Gate_Delays.Delay_1,Gate_Delays.Delay_2) (s,a,b);
  and #(Gate_Delays.Delay_3,Gate_Delays.Delay_4) (ca,a,b);
endmodule
### Testbench Code:
Gate_Delays.Delay_1=1;
Gate_Delays.Delay_2=2;
Gate_Delays.Delay_3=3;
Gate_Delays.Delay_4=4;