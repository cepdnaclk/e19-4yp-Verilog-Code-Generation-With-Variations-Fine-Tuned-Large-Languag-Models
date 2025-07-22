module gade(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;
// Instantiate OR gate with inertial delay 3
or #3 gg1(a1,c1,b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(a,c,b);
endmodule
### Original IR:
<IR>@ 0x18c <f694>
[i_parameter]:
[0x100] 0x1000 <f694> "inertial_delay_default" "1"
[i_parameter]:
[0x100] 0x1001 <f695> "inertial_delay_default" "1"
[i_parameter]:
[0x100] 0x1002 <f696> "inertial_delay_default" "1"
[i_parameter]:
[0x100] 0x1003 <f697> "inertial_delay_default" "1"
[i_parameter]:
[0x100] 0x1004 <f698> "inertial_delay_default" "1"
[i_parameter]:
[0x100] 0x1005 <f699> "inertial_delay_default" "1"
[i_parameter]:
[0x100] 0x1006 <f69a> "inertial_delay_default" "1"
[i_parameter]:
[0x100] 0x1007 <f69b> "inertial_delay_default" "1"
[i_parameter]:
[0x100] 0x1008 <f69c> "inertial_delay_default" "1"
[i_parameter]:
[0x100] 0x1009 <f69d> "inertial_delay_default" "1"
[end_of_i_parameters]
[i_port]:
[0x100] 0x100a <f69e> "a1"
[i_port]:
[0x100] 0x100b <f69f> "a"
[end_of_i_ports]
[i_port]:
[0x100] 0x100c <f6a0> "b"
[i_port]:
[0x100] 0x100d <f6a1> "c"
[end_of_i_ports]
[i_port]:
[0x100] 0x100e <f6a2> "b1"
[i_port]:
[0x100] 0x100f <f6a3> "c1"
[end_of_i_ports]
[o_port]:
[0x100] 0x1010 <f6a4> "a"
[o_port]:
[0x100] 0x1011 <f6a5> "a1"
[end_of_o_ports]
[i_port]:
[0x100] 0x1012 <f6a6> "b"
[i_port]:
[0x100] 0x1013 <f6a7> "c"
[end_of_i_ports]
[i_port]:
[0x100] 0x1014 <f6a8> "b1"
[i_port]:
[0x100] 0x1015 <f6a9> "c1"
[end_of_i_ports]
[o_port]:
[0x100] 0x1016 <f6aa> "a"
[o_port]:
[0x100] 0x1017 <f6ab> "a1"
[end_of_o_ports]
[i_port]:
[0x100] 0x1018 <f6ac> "b"
[i_port]:
[0x100] 0x1019 <f6ad> "c"
[end_of_i_ports]
[i_port]:
[0x100] 0x101a <f6ae> "b1"
[i_port]:
[0x100] 0x101b <f6af> "c1"
[end_of_i_ports]
[i_port]:
[0x100] 0x101c <f6b0> "a"
[i_port]:
[0x100] 0x101d <f6b1> "a1"
[end_of_i_ports]
[i_port]:
[0x100] 0x101e <f6b2> "b"
[i_port]:
[0x100] 0x101f <f6b3> "c"
[end_of_i_ports]
[i_port]:
[0x100] 0x1020 <f6b4> "b1"
[i_port]:
[0x100] 0x1021 <f6b5> "c1"
[end_of_i_ports]
[i_port]:
[0x100] 0x1022 <f6b6> "a"
[i_port]:
[0x100] 0x1023 <f6b7> "a1"
[end_of_i_ports]
[i_port]:
[0x100] 0x1024 <f6b8> "b"
[i_port]:
[0x100] 0x1025 <f6b9> "c"
[end_of_i_ports]
[i_port]:
[0x100] 0x1026 <f6ba> "b1"
[i_port]:
[0x100] 0x1027 <f6bb> "c1"
[end_of_i_ports]
[i_port]:
[0x100] 0x1028 <f6bc> "a"
[i_port]:
[0x100] 0x1029 <f6bd> "a1"
[end_of_i_ports]
[i_port]:
[0x100] 0x102a <f6be> "b"
[i_port]:
[0x100] 0x102b <f6bf> "c"
[end_of_i_ports]
[i_port]:
[0x100] 0x102c <f6c0> "b1"
[i_port]:
[0x100] 0x102d <f6c1> "c1"
[end_of_i_ports]
[i_port]:
[0x100] 0x102e <f6c2> "a"
[i_port]:
[0x100] 0x102f <f6c3> "a1"
[end_of_i_ports]
[i_port]:
[0x100] 0x1030 <f6c4> "b"
[i_port]:
[0x100] 0x1031 <f6c5> "c"
[end_of_i_ports]
[i_port]:
[0x100] 0x1032 <f6c6> "b1"
[i_port]:
[0x100] 0x1033 <f6c7> "c1"
[end_of_i_ports]
[i_port]:
[0x100] 0x1034 <f6c8> "a"
[i_port]:
[0x100]