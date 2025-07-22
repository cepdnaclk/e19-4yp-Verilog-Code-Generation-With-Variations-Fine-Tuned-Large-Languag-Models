module delay_check_packed_struct(
    input logic clock,
    input logic reset,
    output logic [31:0] Result
  );

  logic [32:0] temp;
  logic [31:0] delay_temp;
  logic [31:0] delay_temp_1;
  logic [31:0] delay_temp_2;
  logic [31:0] delay_temp_3;
  logic [31:0] delay_temp_4;
  logic [31:0] delay_temp_5;
  logic [31:0] delay_temp_6;
  logic [31:0] delay_temp_7;
  logic [31:0] delay_temp_8;
  logic [31:0] delay_temp_9;
  logic [31:0] delay_temp_10;
  logic [31:0] delay_temp_11;
  logic [31:0] delay_temp_12;
  logic [31:0] delay_temp_13;
  logic [31:0] delay_temp_14;
  logic [31:0] delay_temp_15;
  logic [31:0] delay_temp_16;
  logic [31:0] delay_temp_17;
  logic [31:0] delay_temp_18;
  logic [31:0] delay_temp_19;
  logic [31:0] delay_temp_20;
  logic [31:0] delay_temp_21;
  logic [31:0] delay_temp_22;
  logic [31:0] delay_temp_23;
  logic [31:0] delay_temp_24;
  logic [31:0] delay_temp_25;
  logic [31:0] delay_temp_26;
  logic [31:0] delay_temp_27;
  logic [31:0] delay_temp_28;
  logic [31:0] delay_temp_29;
  logic [31:0] delay_temp_30;
  logic [31:0] delay_temp_31;
  logic [31:0] delay_temp_32;
  
  /* verilator lint_off WIDTH */
  always_ff @(posedge clock or posedge reset) begin
    if(reset) begin
      temp <= 33'b0;
      Result <= 32'b0;
    end else begin
      temp <= {temp[30:0],delay_temp};
      Result <= temp[31:0];
    end
  end
  /* verilator lint_on WIDTH */
  netdelay1 delay_check_netdelay1(delay_temp_1,temp[0]);
  netdelay1 delay_check_netdelay1_1(delay_temp_2,temp[1]);
  netdelay1 delay_check_netdelay1_2(delay_temp_3,temp[2]);
  netdelay1 delay_check_netdelay1_3(delay_temp_4,temp[3]);
  netdelay1 delay_check_netdelay1_4(delay_temp_5,temp[4]);
  netdelay1 delay_check_netdelay1_5(delay_temp_6,temp[5]);
  netdelay1 delay_check_netdelay1_6(delay_temp_7,temp[6]);
  netdelay1 delay_check_netdelay1_7(delay_temp_8,temp[7]);
  netdelay1 delay_check_netdelay1_8(delay_temp_9,temp[8]);
  netdelay1 delay_check_netdelay1_9(delay_temp_10,temp[9]);
  netdelay1 delay_check_netdelay1_10(delay_temp_11,temp[10]);
  netdelay1 delay_check_netdelay1_11(delay_temp_12,temp[11]);
  netdelay1 delay_check_netdelay1_12(delay_temp_13,temp[12]);
  netdelay1 delay_check_netdelay1_13(delay_temp_14,temp[13]);
  netdelay1 delay_check_netdelay1_14(delay_temp_15,temp[14]);
  netdelay1 delay_check_netdelay1_15(delay_temp_16,temp[15]);
  netdelay1 delay_check_netdelay1_16(delay_temp_17,temp[16]);
  netdelay1 delay_check_netdelay1_17(delay_temp_18,temp[17]);
  netdelay1 delay_check_netdelay1_18(delay_temp_19,temp[18]);
  netdelay1 delay_check_netdelay1_19(delay_temp_20,temp[19]);
  netdelay1 delay_check_netdelay1_20(delay_temp_21,temp[20]);
  netdelay1 delay_check_netdelay1_21(delay_temp_22,temp[21]);
  netdelay1 delay_check_netdelay1_22(delay_temp_23,temp[22]);
  netdelay1 delay_check_netdelay1_23(delay_temp_24,temp[23]);
  netdelay1 delay_check_netdelay1_24(delay_temp_25,temp[24]);
  netdelay1 delay_check_netdelay1_25(delay_temp_26,temp[25]);
  netdelay1 delay_check_netdelay1_26(delay_temp_27,temp[26]);
  netdelay1 delay_check_netdelay1_27(delay_temp_28,temp[27]);
  netdelay1 delay_check_netdelay1_28(delay_temp_29,temp[28]);
  netdelay1 delay_check_netdelay1_29(delay_temp_30,temp[29]);
  netdelay1 delay_check_netdelay1_30(delay_temp_31,temp[30]);
  netdelay1 delay_check_netdelay1_31(delay_temp_32,temp[31]);

endmodule
### Variation Information:
<table class="variations"><tr><td class="variationsSummaryRow" colspan="3">
<a href="../../variationSupport.php?variation=18925" class="rating">(1)</a>
<a href="../../variationSupport.php?variation=18928" class="rating">(1)</a>
<a href="../../variationSupport.php?variation=23761" class="rating">(2)</a>
<a href="../../variationSupport.php?variation=23762" class="rating">(2)</a>
<a href="../../variationSupport.php?variation=23763" class="rating">(2)</a>
<a href="../../variationSupport.php?variation=23764" class="rating">(2)</a>
<a href="../../variationSupport.php?variation=23765" class="rating">(2)</a>
<a href="../../variationSupport.php?variation=23766" class="rating">(2)</a>
<a href="../../variationSupport.php?variation=23767" class="rating">(2)</a>
<a href="../../variationSupport.php?variation=23768" class="rating">(2)</a>
<a href="../../variationSupport.php?variation=23769" class="rating">(2)</a>
<a href="../../variationSupport.php?variation=23770" class="rating">(2)</a>
<a href="../../variationSupport.php?variation=23771" class="rating">(2)</a>
<a href="../../variationSupport.php?variation=23772" class="rating">(2)<