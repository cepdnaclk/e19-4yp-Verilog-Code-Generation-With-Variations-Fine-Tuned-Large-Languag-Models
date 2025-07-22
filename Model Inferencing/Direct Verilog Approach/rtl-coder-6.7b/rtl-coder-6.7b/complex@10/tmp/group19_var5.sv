wire [2:0] data [15:0];
inside {
    addern adder(
       .carryin(carryin),
       .X(X[15:0]),
       .Y(Y[15:0]),
       .S(adderS),
       .carryout(carryout));
    data[15] = adderS;
    data[14] = 0;
    data[13:0] = {14{1'b0}};
}