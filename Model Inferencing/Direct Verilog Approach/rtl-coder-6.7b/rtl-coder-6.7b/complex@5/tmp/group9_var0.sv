module mltp_a(a1,a0,b1,b0,c1,c2,c3,c4);
  input a1,a0,b1,b0; output c1,c2,c3,c4;
  reg[1:4] mand[1:9];
  reg[1:9] mor[1:4];
  reg p1,p2,p3,p4,p5,p6,p7,p8,p9;
  reg c1,c2,c3,c4;
  initial begin
    mand[1]=4'b1010; mand[2]=4'b0110; mand[3]=4'b1110; mand[4]=4'b1001;
    mand[5]=4'b0101; mand[6]=4'b1101; mand[7]=4'b1011; mand[8]=4'b0111;
    mand[9]=4'b1111;
    mor[1]=9'b101000101;
    mor[2]=9'b011101110;
    mor[3]=9'b000011010;
    mor[4]=9'b000000001;
    // Function to handle output logic
    function [1:0] outlogic;
      input [1:9] i;
      outlogic=i[1:2];
    endfunction
    // Corrected input order?
    $async$and$array(mand, {b1,b0,a1,a0}, {p1,p2,p3,p4,p5,p6,p7,p8,p9});
    // Corrected output order?
    $async$or$array(mor, {p1,p2,p3,p4,p5,p6,p7,p8,p9}, {c4,c3,c2,c1});
    // Output logic (function call within range list)
    $async$or$array(mor, {p1,p2,p3,p4,p5,p6,p7,p8,p9}, outlogic);
  end
endmodule