module chap5_107(BTN, LEDR);
   input [2:0] BTN;
   output [6:0] LEDR;
   wire [2:0] SW;

   assign SW[2] = BTN