```cpp
module alu_testbench;
reg 	sw0, 		sw1, 		sw2, 		sw3, 		sw4, 		sw5, 		sw6, 		sw7;
reg 	sw8, 		sw9, 		sw10, 		sw11, 		sw12, 		sw13, 		sw14, 		sw15;
wire 	ld0, 		ld1, 		ld2, 		ld3, 		ld4, 		ld5, 		ld6, 		ld7;
wire 	ld8, 		ld9, 		ld10, 		ld11, 		ld12, 		ld13, 		ld14, 		ld15;
wire 	ld16,		ld17,		ld18,		ld19,		ld20,		ld21,		ld22,		ld23;

sw2led2 sw2led2 (
	.sw		(sw),
	.ld		(ld)
	);

alu alu (
	.sw0	(sw[0]),
	.sw1	(sw1),
	.sw2	(sw2),
	.sw3	(sw3),
	.sw4	(sw4),
	.sw5	(sw5),
	.sw6	(sw6),
	.sw7	(sw7),
	.sw8	(sw8),
	.sw9	(sw9),
	.sw10	(sw10),
	.sw11	(sw11),
	.sw12	(sw12),
	.sw13	(sw13),
	.sw14	(sw14),
	.sw15	(sw15),
	.sw16	(sw16),	
	.sw17	(sw17),	
	.sw18