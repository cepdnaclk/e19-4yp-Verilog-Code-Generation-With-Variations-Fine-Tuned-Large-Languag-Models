module nor2NMOS(a,b,c); // 2-input NMOS NOR
  output c;
  input a,b;
  wire y;
  nmos (y,a,b);
  pullup (y);
  cmos(c,c,y,a);
  case(a)
    1'b1: pullup(c);
    1'b0: cmos(c,c,y,a