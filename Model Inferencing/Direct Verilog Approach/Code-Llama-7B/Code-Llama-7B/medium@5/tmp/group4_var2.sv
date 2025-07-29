module jk(j,k,q,out);
input j,k,q;
output out;
reg out;
wire a,b,c,d,e;
not(a,j);
and(b,a,q);
and(c,j,q);
or(d,a,c);
or(out,d,b);
// added case statement
case (j)
 1'b0: n