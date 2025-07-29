module hex7seg_le_v (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)
assign a_to_g[6] = `inside(\x[3]\x[2]\x[1]\x[0]) || `inside([\x[3]\x[2]\x[1]\x[0]][\x[3]\x[2]] || `inside(\x[3]\[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) || `inside(\x[3]\[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) // a (segment index 6)
| `inside(\x[3]\x[2]\x[1]\x[0]) || `inside([\x[3]\x[2]\x[1]\x[0]][\x[3]\x[2]] || `inside(\x[3]\x[2]\x[1]\x[0]) || `inside(\x[3]\[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) || `inside(\x[3]\[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) // b (segment index 5)
| `inside(\x[3]\x[2]\x[1]\x[0]) || `inside([\x[3]\x[2]\x[1]\x[0]][\x[3]\x[2]] || `inside(\x[3]\x[2]\x[1]\x[0]) || `inside(\x[3]\[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) || `inside(\x[3]\[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) // c (segment index 4)
| `inside(\x[3]\x[2]\x[1]\x[0]) || `inside([\x[3]\x[2]\x[1]\x[0]][\x[3]\x[2]] || `inside(\x[3]\x[2]\x[1]\x[0]) || `inside(\x[3]\[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) || `inside(\x[3]\[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) // d (segment index 3)
| `inside(\x[3]\x[2]\x[1]\x[0]) || `inside([\x[3]\x[2]\x[1]\x[0]][\x[3]\x[2]] || `inside(\x[3]\x[2]\x[1]\x[0]) || `inside(\x[3]\[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) || `inside(\x[3]\[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) // e (segment index 2)
| `inside(\x[3]\x[2]\x[1]\x[0]) || `inside([\x[3]\x[2]\x[1]\x[0]][\x[3]\x[2]] || `inside(\x[3]\x[2]\x[1]\x[0]) || `inside(\x[3]\[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) || `inside(\x[3]\[2]\[1]\[0]) || `inside(\x[3]\x[2]\[1]\[0]) // f (segment index 1)
| `inside(\x[3]\x[2]\x[1]\x[0]) || `inside([\x[3]\x[2]\x[1]\x[0]][\x[3]\x[2]]