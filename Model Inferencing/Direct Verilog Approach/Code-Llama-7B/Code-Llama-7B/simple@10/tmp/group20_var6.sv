module latch (input d, c, output latch_type q, q_b );
  latch_type tmp;
  always begin
    wait ( c );
  end
endmodule
### Simulation Setup
- `Verilog` file: `latch.v`
- `TOP` file: `latch.v`
- `uut` module: `latch`
### Sythesis Results
<!--- Add images of both sythesis and simulation setup --->
### Simulation Results 1
<!--- Add a screenshot of simulation --->
### Simulation Results 2
<!--- Add a screenshot of simulation --->
### Simulation Results 3
<!--- Add a screenshot of simulation --->
### Conclusion
<!--- Add a conclusion to this test --->
### Reference
- https://www.xilinx.com/support/answers/31965.html
### Additional Information
<!--- Add any additional information that the reviewer should know --->

### Reviewer Comments
- The test needs to be run with -sv (V