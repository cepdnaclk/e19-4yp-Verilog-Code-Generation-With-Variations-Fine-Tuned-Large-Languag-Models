module hex7seg_le (
	input wire [3:0] x,
	output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
	);
	generate
		genvar i;
		for (i = 0; i < 7; i++) begin : __gen_inside
			wire __inside_x;
			assign __inside_x = __gen_inside_x[i] ;
			wire __gen_inside_x;
			__gen_inside_x[i] = ~x[3] & ~x[2] & ~x[1] & x[0] // a (segment index 6)
			| ~x[3] & x[2] & ~x[1] & ~x[0]
			| x[3] & x[2] & ~x[1] & x[0]
			| x[3] & ~x[2] & x[1] & x[0];
			wire __inside_b;
			assign __inside_b = __gen_inside_b[i] ;
			wire __gen_inside_b;
			__gen_inside_b[i] = x[2] & x[1] & ~x[0] // b (segment index 5)
			| x[3] & x[1] & x[0]
			| ~x[3] & x[2] & ~x[1] & x[0]
			| x[3] & ~x[2] & ~x[1] & ~x[0];
			wire __inside_c;
			assign __inside_c = __gen_inside_c[i] ;
			wire __gen_inside_c;
			__gen_inside_c[i] = ~x[3] & ~x[2] & x[1] & ~x[0] // c (segment index 4)
			| x[3] & x[2] & x[1]
			| x[3] & x[2] & ~x[0];
			wire __inside_d;
			assign __inside_d = __gen_inside_d[i] ;
			wire __gen_inside_d;
			__gen_inside_d[i] = ~x[3] & ~x[2] & ~x[1] & x[0] // d (segment index 3)
			| ~x[3] & x[2] & ~x[1] & ~x[0]
			| x[3] & ~x[2] & x[1] & ~x[0]
			| x[2] & x[1] & x[0];
			wire __inside_e;
			assign __inside_e = __gen_inside_e[i] ;
			wire __gen_inside_e;
			__gen_inside_e[i] = ~x[3] & x[0] // e (segment index 2)
			| ~x[3] & x[2] & ~x[1]
			| ~x[2] & ~x[1] & x[0];
			wire __inside_f;
			assign __inside_f = __gen_inside_f[i] ;
			wire __gen_inside_f;
			__gen_inside_f[i] = ~x[3] & ~x[2] & x[0] // f (segment index 1)
			| ~x[3] & ~x[2] & x[1]
			| ~x[3] & x[1] & x[0]
			| x[3] & x[2] & ~x[1] & x[0];
			wire __inside_g;
			assign __inside_g = __gen_inside_g[i] ;
			wire __gen_inside_g;
			__gen_inside_g[i] = ~x[3] & ~x[2] & ~x[1] // g (segment index