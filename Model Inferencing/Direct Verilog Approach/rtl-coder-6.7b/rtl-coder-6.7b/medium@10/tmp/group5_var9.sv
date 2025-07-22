module test_k;
  wire q, clock, j, k, preset, clear;
  reg j, k;
  jkEdgeFF jk(q, clock, j, k, preset, clear);

  logic [0:1][0:1] arr;

  initial begin
    reset_ff;
    j = 1;
    k = 0;
    arr[0][0] = 0;
    arr[0][1] = 1;
    arr[1][0] = 1;
    arr[1][1] = 0;
  end

  m555 timer(clock);
endmodule