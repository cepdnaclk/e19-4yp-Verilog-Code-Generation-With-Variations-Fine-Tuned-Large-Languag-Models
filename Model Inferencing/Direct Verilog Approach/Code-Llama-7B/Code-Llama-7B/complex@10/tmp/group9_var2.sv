function [1:4] and_logic_9;
  input [4:1] in;
  and_logic_9 = {
    (in[1] & in[2]) | (in[1] & in[3]) | (in[1] & in[4]), // p1
    (in[2] & in[3]) | (in[2] & in[4]) | (in[2] & in[1]), // p2
    (in[3] & in[4]) | (in[3] & in[1]) | (in[3] & in[2]), // p3
    (in[4] & in[1]) | (in[4] & in[2]) | (in[4] & in[3]), // p4
    (in[1] & in[2]) | (in[2] & in[3]) | (in[3] & in[4]) | (in[4] & in[1]), // p5
    (in[1] & in[3]) | (in[2] & in[4]) | (in[3] & in[1]) | (in[4] & in[2]), // p6
    (in[1] & in[4]) | (in[3] & in[2]) | (in[4] & in[1]) | (in[2] & in[3]), // p7
    (in[2]