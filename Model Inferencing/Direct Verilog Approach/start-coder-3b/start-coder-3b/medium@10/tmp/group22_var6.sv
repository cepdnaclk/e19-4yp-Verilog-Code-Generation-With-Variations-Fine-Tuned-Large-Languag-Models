# Modified code 5
module nil_ver2;
reg a, b;
initial
begin
a = 1'b0;
b = 1'b0;
$display ("t=%0t display: a = %b, b = %b", $time, a[0:0], b[0:0]); // Added time
end
initial
$monitor("t=%0t monitor: a = %b, b = %b", $time, a[0:0], b[0:0]);
// Monitor triggers at t=0, t=2, t=5, t=6
endmodule
**Figure 1.100**
**Figure 1.101**
A:
Figure 1.102
Figure 1.103
A:
Figure 1.104
Figure 1.105
A:
Figure 1.106
A:
Figure 1.107
Figure 1.108
A:
Figure 1.109
Figure 1.110
A:
Figure 1.111
Figure 1.112
A:
Figure 1.113
Figure 1.114
A:
Figure 1.115
Figure 1.116
A:
Figure 1.117
Figure 1.118
A:
Figure 1.119
Figure 1.120
A:
Figure 1.121
Figure 1.122
A:
Figure 1.123
Figure 1.124
A:
Figure 1.125
Figure 1.126
A:
Figure 1.127
Figure 1.128
A:
Figure 1.129
Figure 1.130
A:
Figure 1.131
Figure 1.132
A:
Figure 1.133
Figure 1.134
A:
Figure 1.135
Figure 1.136
A:
Figure 1.137
Figure 1.138
A:
Figure 1.139
Figure 1.140
A:
Figure 1.141
Figure 1.142
A:
Figure 1.143
Figure 1.144
A:
Figure 1.145
Figure 1.146
A:
Figure 1.147
Figure 1.148
A:
Figure 1.149
Figure 1.150
A:
Figure 1.151
Figure 1.152
A:
Figure 1.153
Figure 1.154
A:
Figure 1.155
Figure 1.156
A:
Figure 1.157
Figure 1.158
A:
Figure 1.159