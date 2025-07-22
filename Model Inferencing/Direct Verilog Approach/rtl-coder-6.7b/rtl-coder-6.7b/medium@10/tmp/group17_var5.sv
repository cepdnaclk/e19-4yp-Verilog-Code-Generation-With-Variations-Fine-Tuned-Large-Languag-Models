```
module mux21c (
input wire a,
input wire b,
input wire s,
output wire x
);
if (s) x = b; // Select b when s=1
else x = a; // Select a when s=0