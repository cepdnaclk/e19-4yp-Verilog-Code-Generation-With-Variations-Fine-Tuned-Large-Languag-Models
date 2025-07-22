module jk_tb;
    reg a,b,c,d,e,f,g,h,i;
    reg clk; // Clock signal
    reg [3:0]j,k,sel;
    always @(posedge clk) begin
        clk <= ~clk;
    end
    always
    @* begin
        #1;
        a <= 1;
        b <= 2;
        c <= 3;
        d <= 4;
        e <= 5;
        f <= 6;
        g <= 7;
        h <= 8;
        i <= 9;
    end

    module jk(output j,output k,output sel,input clk);
    reg j,k,sel;
    initial begin
        j = 0;
        k = 0;
        sel = 0;
    end
    always @(posedge clk) begin
        case (sel)
            2'b00 : begin
                j = 0;
                k = 0;
             end
            2'b01 : begin
                j = 0;
                k = 1;
             end
            2'b10 : begin
                j = 1;
                k = 0;
             end;
            2'b11 : begin
                j = 1;
                k = 1;
             end;
        endcase
    end
    
    endmodule

    module dff(input clk, input a, output reg q);
        assign q = a;
    endmodule

//    module nor3NMOS(in1,in2,in3,b); // 3-input NMOS NOR
//      output b;
//      input in1,in2,in3;
//      supply0 a; // Ground
//      wire b; // Output wire (should be just output b;)
//      // Parallel NMOS transistors connect output to ground
//      nmos (b, a, in1);
//      nmos (b, a, in2);
//      nmos (b, a, in3);
//      pullup (b); // Pullup device on the output
//    endmodule
    module nor3NMOS(in1,in2,in3,b); // 3-input NMOS NOR
      output b;
      input in1,in2,in3;
      wire in[3];
      input [3:0]sel;
      assign in[0] = in1;
      assign in[1] = in2;
      assign in[2] = in3;
      
      wire [1:0]sel1;
      assign sel1[0] = sel[0];
      assign sel1[1] = ~sel[0] & sel[1];
      
      wire [2:0]sel2;
      assign sel2[0] = ~sel[1] & sel[0];
      assign sel2[1] = sel[0];
      assign sel2[2] = sel[1];
      wire [3:0]sel3;
      assign sel3[0] = ~sel[2] & sel[1];
      assign sel3[1] = ~sel1[0] & sel1[1];
      assign sel3[2] = ~sel2[0] & sel2[1];
      assign sel3[3] = sel2[0];
      
      wire q2[3];
      assign q2[3] = sel3[3] & ~sel3[2] & ~sel3[1] & ~sel3[0];
      assign q2[2] = sel3[2] & sel3[3] & ~sel3[0];
      assign q2[1] = ~sel3[3] & ~sel3[2] & sel3[1] & ~sel3[0];
      assign q2[0] = ~sel3[3] & ~sel3[2] & ~sel3[1] & sel3[0];
      
      wire q3[3];
      assign q3[3] = sel3[3] & ~sel3[2] & ~sel3[1] & sel3[0];
      assign q3[2] = sel3[2] & sel3[3] & sel3[0];
      assign q3[1] = ~sel3[3] & ~sel3[2] & ~sel3[1] & ~sel3[0];
      assign q3[0] = ~sel3[3] & ~sel3[2] & sel3[1] & sel3[0];
      
      wire q4[3];
      assign q4[3] = sel3[3] & ~sel3[2] & sel3[1] & ~sel3[0];
      assign q4[2] = sel3[2] & sel3[3] & sel3[1];
      assign q4[1] = ~sel3[3] & ~sel3[2] & sel3[1] & ~sel3[0];
      assign q4[0] = ~sel3[3] & ~sel3[2] & sel3[1] & sel3[0];
      
      wire q5[3];
      assign q5[3] = sel3[3] & sel3[2] & sel3[1] & ~sel3[0];
      assign q5[2] = sel3[2] & sel3[3] & ~sel3[1] & ~sel3[0];
      assign q5[1] = ~sel3[3] & sel3[2] & sel3[1] & ~sel3[0];
      assign q5[0] = ~sel3[3] & sel3[2] & sel3[1] & sel3[0];
      
      wire q6[3];
      assign q6[3] = sel3[3] & sel3[2] & ~sel3[1] & sel3[0];
      assign q6[2] = sel3[2] & sel3[3] & ~sel3[1] & sel3[0];
      assign q6[1] = ~sel3[3] & sel3[2] & ~sel3[1] & sel3[0];
      assign q6[0] = ~sel3[3] & sel3[2] & ~sel3[1] & ~sel3[0];
      
      wire q7[3];
      assign q7[3] = sel3[3] & ~sel3[2] & ~sel3[1] & sel3[0];
      assign q7[2] = sel3[2] & ~sel3[3] & ~sel3[1] & ~sel3[0];
      assign q7[1] = ~sel3[3] & ~sel3[2] & ~sel3[1] & sel3[0];
      assign q7[0] = ~sel3[3] & ~sel3[2] & ~sel3[1] & ~sel3[0];
      
      wire q8[3];
      assign q8[3] = ~sel3[3] & ~sel3[2] & ~sel3[1] & sel3[0];
      assign q8[2] = ~sel3[2] & ~sel3[3] & ~sel3[1] & ~sel3[0];
      assign q8[1] = ~sel3[3] & ~sel3[2] & ~sel3[1] & sel3[0];
      assign q8[0] = ~sel3[3] & ~sel3[2] & ~sel3[1] & ~sel3[0];
      
      wire q9[3];
      assign q9[3] = ~sel3[3] & ~sel3[2] & sel3[1] & ~sel3[0];
      assign q9[2] = ~sel3[2] & ~sel3[3] & sel3[1] & ~sel3[0];
      assign q9[1] = ~sel3[3] & ~sel3[2] & sel3[1] & sel3[0];
      assign q9[0] = ~sel3[3] & ~sel3[2] & sel3[1] & ~sel3[0];
      
      
      assign b = q2[sel[0]] & q3[sel[1]] & q4[sel[2]];
      assign b = ~b & sel[3];
      
      // Parallel NMOS transistors connect output to ground
      //nmos (b, a, in1);
      //nmos (b, a, in2);
      //nmos (b, a, in3);
      //pullup (b); // Pullup device on the output
    endmodule

    initial begin
        a = 1'b0;
        b = 1'b0;
        c = 1'b0;
        d = 1'b0;
        e = 1'b0;
        f = 1'b0;
        g = 1'b0;
        h = 1'b0;
        i = 1'b0;
    end

    always @(posedge clk) begin
        j = ~j;
    end

    initial begin
        j = 0;
        k = 0;
        sel = 0;