`packed struct packed { wire x; wire y; wire z; } ps;`
`assign ps.x = #10 a;`
###
### Verification Code:
`$monitor($time, " a=%b x=%b y=%b z=%b", a, x, y, z);`
###
### Expected Test Results:
There should be no errors, and the simulation should run successfully.
###
### Verification Code:
`$monitor($time, " a=%b x=%b y=%b z=%b", a, x, y, z);`
###
###