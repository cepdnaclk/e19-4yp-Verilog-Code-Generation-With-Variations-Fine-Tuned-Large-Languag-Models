module mltp_a(a1,a0,b1,b0,c1,c2,c3,c4); // PLA based 2x2 multiplier
  input a1,a0,b1,b0; output c1,c2,c3,c4;
  // Declare storage for and plane and or plane
  reg[1:4] mand[1:9]; // and plane inputs (4 bits wide, 9 product terms)
  reg[1:9] mor[1:4]; // or plane inputs (9 bits wide, 4 outputs)
  reg p1,p2,p3,p4,p5,p6,p7,p8,p9; // product terms
  reg c1,c2,c3,c4; // outputs must be reg for procedural assignment
  initial begin
    // define and plane connections (input -> product term)
    mand[1]=4'b1010; mand[2]=4'b0110; mand[3]=4'b1110; mand[4]=4'b1001;
    mand[5]=4'b0101; mand[6]=4'b1101; mand[7]=4'b1011; mand[8]=4'b0111;
    mand[9]=4'b1111;
    // define or plane connections (product term -> output)
    // format: 9 bits for p1-p9 connections for each output c1-c4
    mor[1]=9'b101000101; // connections for c1
    mor[2]=9'b011101110; // connections for c2
    mor[3]=9'b000011010; // connections for c3
    mor[4]=9'b000000001; // connections for c4
    // instantiate PLA using system tasks
    mltp_b(p1,p2,p3,p4,p5,p6,p7,p8,p9);
    $async$and$array(mand, {b1,b0,a1,a0}, {p1,p2,p3,p4,p5,p6,p7,p8,p9}); // corrected input order?
    $async$or$array(mor, {p1,p2,p3,p4,p5,p6,p7,p8,p9}, {c4,c3,c2,c1}); // corrected output order?
  end
endmodule
// Function that implements AND plane of mltp_a PLA
function void mltp_b(output p1,p2,p3,p4,p5,p6,p7,p8,p9);
  input a1,a0,b1,b0;
  p1=(a1&b1);
  p2=(a1&b0);
  p3=(a0&b1);
  p4=(a1&b0);
  p5=(a0&b1);
  p6=(a0&b0);
  p7=(a1);
  p8=(b1);
  p9=(a1&b1);
endfunction : mltp_b
### Differences:
![differences](https://github.com/nandland/RTL_Verification_Workshop/raw/main/img/differences.png)