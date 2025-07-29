module aoibeh2i(o,a,b); // Mixed structural/behavioral AOI
output o;
input[3:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
initial begin
o = 4'b1111;
end
always@(a1 or b1)
o = ~(a1 || b1);
endmodule
### Passed:
#(
    output_name = "o",
    input_names = ["a", "b"],
    wirelist = ["a1", "b1"],
    modports = [],
    structural = true,
    blackbox = false,
    keep_hierarchy = false,
    flatten = false,
    ignorename = false,
    cell = "",
    lib = "",
    reflib = "",
    paramlist = [],
    moduledir = "",
    topmodule = "",
)
### Failed:
#(
    output_name = "o",
    input_names = ["a", "b"],
    wirelist = ["a1", "b1"],
    modports = [],
    structural = false,
    blackbox = false,
    keep_hierarchy = false,
    flatten = false,
    ignorename = false,
    cell = "",
    lib = "",
    reflib = "",
    paramlist = [],
    moduledir = "",
    topmodule = "",
)
### Passed:
#(
    output_name = "o",
    input_names = ["a", "b"],
    wirelist = ["a1", "b1"],
    modports = [],
    structural = false,
    blackbox = false,
    keep_hierarchy = true,
    flatten = false,
    ignorename = false,
    cell = "",
    lib = "",
    reflib = "",
    paramlist = [],
    moduledir = "",
    topmodule = "",
)
### Failed:
#(
    output_name = "o",
    input_names = ["a", "b"],
    wirelist = ["a1", "b1"],
    modports = [],
    structural = false,
    blackbox = false,
    keep_hierarchy = false,
    flatten = true,
    ignorename = false,
    cell = "",
    lib = "",
    reflib = "",
    paramlist = [],
    moduledir = "",
    topmodule = "",
)
### Passed:
#(
    output_name = "o",
    input_names = ["a", "b"],
    wirelist = ["a1", "b1"],
    modports = [],
    structural = false,
    blackbox = false,
    keep_hierarchy = false,
    flatten = false,
    ignorename = true,
    cell = "",
    lib = "",
    reflib = "",
    paramlist = [],
    moduledir = "",
    topmodule = "",
)
### Failed:
#(
    output_name = "o",
    input_names = ["a", "b"],
    wirelist = ["a1", "b1"],
    modports = [],
    structural = false,
    blackbox = false,
    keep_hierarchy = false,
    flatten = false,
    ignorename = false,
    cell = "aoibeh2i",
    lib = "",
    reflib = "",
    paramlist = [],
    moduledir = "",
    topmodule = "",
)
### Passed:
#(
    output_name = "o",
    input_names = ["a", "b"],
    wirelist = ["a1", "b1"],
    modports = [],
    structural = false,
    blackbox = false,
    keep_hierarchy = false,
    flatten = false,
    ignorename = false,
    cell = "",
    lib = "aoibeh2i",
    reflib = "",
    paramlist