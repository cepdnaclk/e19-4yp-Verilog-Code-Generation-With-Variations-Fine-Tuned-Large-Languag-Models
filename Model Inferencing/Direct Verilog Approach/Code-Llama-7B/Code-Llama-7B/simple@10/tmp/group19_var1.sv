module tb_dff();
  localparam N = 10;

  reg [0:N-1] D_array;
  reg Clock, Resetn;

  wire [0:N-1] Q_array;
  wire Q;

  dff_array dut(D_array, Clock, Resetn, Q_array);

  initial begin
    Clock = 0;
    Resetn = 1;

    #100;
    Clock = 1;
    for (int i = 0; i < N; i = i + 1) begin
      #1 D_array[i] = i;
    end
    #100;
    Clock = 0;
    for (int i = 0; i < N; i = i + 1) begin
      #1 $display("D[%3d]=%3d, Q=%3d", i, D_array[i], Q_array[i]);
    end
    Resetn = 0;
    #100;
    Resetn = 1;

    for (int i = 0; i < N; i = i + 1) begin
      #1 $display("Q[%3d]=%3d", i, Q_array[i]);
    end
    $finish;
  end
endmodule

module dff_array(
  input [0:N-1] D,
  input Clock,
  input Resetn,
  output [0:N-1] Q);

  lpm_ff flipflop_array[0:N-1] (
   .data(D[0:N-1]),
   .aclr(Resetn),
   .clock(Clock),
   .q(Q[0:N-1]));

  defparam flipflop_array.lpm_width = 1;
endmodule
### Expected Results:
Q = 0, Q = 1, Q = 2, Q = 3, Q = 4, Q = 5, Q = 6, Q = 7, Q = 8,