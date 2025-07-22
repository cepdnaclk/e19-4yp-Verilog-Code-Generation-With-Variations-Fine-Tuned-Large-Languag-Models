module aoi_gate(o,a1,a2,b1,b2);
  //input a1,a2,b1,b2;// a1,a2,b1,b2 form the input ports of the module
  //output o;//o is the single output port of the module
  //wire o1,o2;//o1 and o2 are intermediate signals within the module
  //and g1(o1,a1,a2); //The AND gate primitive has two instantiations with assigned names g1 & g2.
  //nor g3(o,o1,o2);//The nor gate has one instantiation with assigned name g3.

  //packed array
  logic [31:0] arr[10];
  //assigning values to packed array
  initial begin
    arr[3] = 32'd10;
    arr[7] = 32'd11;
    arr[2] = 32'd20;
    arr[5] = 32'd21;
    arr[6] = 32'd22;
    arr[0] = 32'd23;
  end

  logic [31:0] arr1[10];

  //assigning values to packed array
  initial begin
    arr1[3] = 32'd10;
    arr1[7] = 32'd11;
    arr1[2] = 32'd20;
    arr1[5] = 32'd21;
    arr1[6] = 32'd22;
    arr1[0] = 32'd23;
  end

  logic [31:0] arr2[10];

  //assigning values to packed array
  initial begin
    arr2[3] = 32'd10;
    arr2[7] = 32'd11;
    arr2[2] = 32'd20;
    arr2[5] = 32'd21;
    arr2[6] = 32'd22;
    arr2[0] = 32'd23;
  end

  logic [31:0] arr3[10];

  //assigning values to packed array
  initial begin
    arr3[3] = 32'd10;
    arr3[7] = 32'd11;
    arr3[2] = 32'd20;
    arr3[5] = 32'd21;
    arr3[6] = 32'd22;
    arr3[0] = 32'd23;
  end

  logic [31:0] arr4[10];

  //assigning values to packed array
  initial begin
    arr4[3] = 32'd10;
    arr4[7] = 32'd11;
    arr4[2] = 32'd20;
    arr4[5] = 32'd21;
    arr4[6] = 32'd22;
    arr4[0] = 32'd23;
  end

  logic [31:0] arr5[10];

  //assigning values to packed array
  initial begin
    arr5[3] = 32'd10;
    arr5[7] = 32'd11;
    arr5[2] = 32'd20;
    arr5[5] = 32'd21;
    arr5[6] = 32'd22;
    arr5[0] = 32'd23;
  end

  logic [31:0] arr6[10];

  //assigning values to packed array
  initial begin
    arr6[3] = 32'd10;
    arr6[7] = 32'd11;
    arr6[2] = 32'd20;
    arr6[5] = 32'd21;
    arr6[6] = 32'd22;
    arr6[0] = 32'd23;
  end

  logic [31:0] arr7[10];

  //assigning values to packed array
  initial begin
    arr7[3] = 32'd10;
    arr7[7] = 32'd11;
    arr7[2] = 32'd20;
    arr7[5] = 32'd21;
    arr7[6] = 32'd22;
    arr7[0] = 32'd23;
  end

  logic [31:0] arr8[10];

  //assigning values to packed array
  initial begin
    arr8[3] = 32'd10;
    arr8[7] = 32'd11;
    arr8[2] = 32'd20;
    arr8[5] = 32'd21;
    arr8[6] = 32'd22;
    arr8[0] = 32'd23;
  end

  logic [31:0] arr9[10];

  //assigning values to packed array
  initial begin
    arr9[3] = 32'd10;
    arr9[7] = 32'd11;
    arr9[2] = 32'd20;
    arr9[5] = 32'd21;
    arr9[6] = 32'd22;
    arr9[0] = 32'd23;
  end

  logic [31:0] arr10[10];

  //assigning values to packed array
  initial begin
    arr10[3] = 32'd10;
    arr10[7] = 32'd11;
    arr10[2] = 32'd20;
    arr10[5] = 32'd21;
    arr10[6] = 32'd22;
    arr10[0] = 32'd23;
  end

  logic [31:0] arr11[10];

  //assigning values to packed array
  initial begin
    arr11[3] = 32'd10;
    arr11[7] = 32'd11;
    arr11[2] = 32'd20;
    arr11[5] = 32'd21;
    arr11[6] = 32'd22;
    arr11[0] = 32'd23;
  end

  logic [31:0] arr12[10];

  //assigning values to packed array
  initial begin
    arr12[3] = 32'd10;
    arr12[7] = 32'd11;
    arr12[2] = 32'd20;
    arr12[5] = 32'd21;
    arr12[6] = 32'd22;
    arr12[0] = 32'd23;
  end

  logic [31:0] arr13[10];

  //assigning values to packed array
  initial begin
    arr13[3] = 32'd10;
    arr13[7] = 32'd11;
    arr13[2] = 32'd20;
    arr13[5] = 32'd21;
    arr13[6] = 32'd22;
    arr13[0] = 32'd23;
  end

  logic [31:0] arr14[10];

  //assigning values to packed array
  initial begin
    arr14[3] = 32'd10;
    arr14[7] = 32'd11;
    arr14[2] = 32'd20;
    arr14[5] = 32'd21;
    arr14[6] = 32'd22;
    arr14[0] = 32'd23;
  end

  logic [31:0] arr15[