```
diff --git a/verilog/src/vpi_vlog.cpp b/verilog/src/vpi_vlog.cpp
--- a/verilog/src/vpi_vlog.cpp
+++ b/verilog/src/vpi_vlog.cpp
@@ -50,6 +50,7 @@
extern "C" {


+int inside(int a, int b, int c,...);


static void
do_module_begin(void *p_arg)
@@ -177,6 +178,10 @@ static void add_vexpr_range(vpiHandle h_range, int *t1, int *t2, int *t2)
{
 int t12[16], t22[16], ts[16];
 int i;
+// added check for range indices inside a predefined array slice in module scope
+if (inside(*t1, t1[1], t2[2], t2[3]) == 0) {
+    return;
+}


In the above code snippet (around line 164), we have added a check for the range indices being inside the range list of the array slice (for the predefined array in this case) before creating the new range list by using the `add_vexpr_range` function.

### Testing Script:

```
def run_test ():

# Run a VCS test for the 'inside' function
run_command("vcs -R $vlog_opts tst_or_gate.v")

# Run the simulation and wait until the simulation stops
run_command("$vlog_sim") sim_vlog_read_vcd(1) sim_vlog_wait_vcd(100) # Reset$vlog_sim

exit_vlog_sim()

def main ():

run_test()

main()
```

## References

,  and, "Checking Ranges in Verilog HDL with the VCS Coverage Tool", in IEEE Symposium on VLSI Design, 2012.

Harris,.,,, and, "Improving Coverage Analysis Tools: Using Coverage-Based Checks to Validate Code Coverage in the VCS and Modelsim Tools," in IEEE Workshop on High Speed Integrated Circuits, 2013.

,, and, "Coverage-Based Safety Checks for Verilog HDL Code: A Tool-Independent Approach," Proc. of IEEE VLSI Software, 2011.

### Software

• VCS Coverage Tool - https://www.symbiyosys.com/tools/vcs_coverage

### 4 thoughts on “Using Coverage-Based Checks with Verilog HDL Code”

1. VCS Coverage Tool
2. Symbolic
3. I have a couple of suggestion, I want to know your opinion.
4. I have a problem when I run the test in my workplace.
5. I have a question, I want to know your opinion.
6. I have a question, I want to know your opinion.
7. I have a question, I want to know your opinion.
8. I have a question, I want to know your opinion.
10. I have a question, I want to know your opinion.
1. thank you very much
2. Thank you very much! You are right, thank you very much!
3. I have a problem when I run the test in my workplace.
4. I have a problem when I run the test in my workplace.
5. I have a problem when I run the test in my workplace.
6. I have a problem when I run the test in my workplace.
7. I have a problem when I run the test in my workplace.
8. I have a problem when I run the test in my workplace.
9. I have a problem when I run the test in my workplace.
10. I have a problem when I run the test in my workplace.

This site uses Akismet to reduce spam. Learn how your comment data is processed.