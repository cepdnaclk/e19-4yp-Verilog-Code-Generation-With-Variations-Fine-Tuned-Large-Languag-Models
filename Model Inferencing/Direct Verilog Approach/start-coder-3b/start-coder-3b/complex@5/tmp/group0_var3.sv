#include "verilated.h"
#include "Vtst_or_gate.h"
#include <iostream>
#include <verilated_vcd_c.h>

// Or gate
// Uses Verilator for testing
// Verilator is a C++ program
// Input a is an array of 4 bits
// Input en is a 1 bit
// Output b is a 1 bit
// Verilog Code:
module tst_or_gate();
reg[3:0]a;
reg en;
wire b;
or_gate gg(b,a,en);
initial
begin
a = 4'h0; // Initialize input
en = 1'b0; // Initialize enable
end
initial begin // Stimulus generation
end
initial $monitor("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b); // Use %h for hex 'a'
initial #30 $stop; // Stop simulation
endmodule

// Class of testbench
class TB_Or_Gate extendstb_uut
{
int i;

// Constructor
// Instantiate uut
// Define signal handlers
TB_Or_Gate(boolean do_verilator)
{
uut = new Vtst_or_gate();

// Define signal handlers
// Instantiate Verilator if requested
if(do_verilator){
uut.trace(trace_file, 99);
verilator_setup_timestep();
}

// Instantiate I/O monitors
monitor_a = new String("a");
monitor_en = new String("en");
monitor_b = new String("b");

// Reset inputs to 0
uut.a <= 7'h0;
uut.en <= 1'b0;

// Define signal handlers
monitor_t.

// Main simulation loop
for(i=0;i<5;i++){
// Test input
uut.en = 1'b1
}

}

// Signal handlers
public void handler_a(Object o, Object s){
// Print to screen
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, a = " + s + " ");
}

public void handler_en(Object o, Object s){
// Print to screen
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, en = " + s + " ");
}

public void handler_b(Object o, Object s){
// Print to screen
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, b = " + s + " ");
}

public void handler_monitor_t(Object o, Object s){
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, ");
}

public void handler_monitor_a(Object o, Object s){
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, a = " + s + " ");
}

public void handler_monitor_b(Object o, Object s){
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, b = " + s + " ");
}

public void handler_monitor_en(Object o, Object s){
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, en = " + s + " ");
}
}

#### Testbench Execution

class TB_Or_Gate extendstb_uut
{
int i;
// Constructor
// Instantiate uut
// Define signal handlers
TB_Or_Gate(boolean do_verilator)
{
uut = new Vtst_or_gate();
// Define signal handlers
// Instantiate Verilator if requested
if(do_verilator){
uut.trace(trace_file, 99);
verilator_setup_timestep();
}
// Instantiate I/O monitors
monitor_a = new String("a");
monitor_en = new String("en");
monitor_b = new String("b");
// Reset inputs to 0
uut.a <= 7'h0;
uut.en <= 1'b0;
// Define signal handlers
monitor_t = new String("t");
monitor_a = new String("a");
monitor_b = new String("b");
monitor_en = new String("en");
// Main simulation loop
for(i=0;i<5;i++){
// Test input
uut.en = 1'b1
}
}
// Signal handlers
public void handler_a(Object o, Object s){
// Print to screen
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, a = " + s + " ");
}
public void handler_en(Object o, Object s){
// Print to screen
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, en = " + s + " ");
}
public void handler_b(Object o, Object s){
// Print to screen
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, b = " + s + " ");
}
public void handler_monitor_t(Object o, Object s){
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, ");
}
public void handler_monitor_a(Object o, Object s){
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, a = " + s + " ");
}
public void handler_monitor_b(Object o, Object s){
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, b = " + s + " ");
}
public void handler_monitor_en(Object o, Object s){
double mtime;
mtime = System.currentTimeMillis();
System.out.println("t="+(mtime-start_time)+"ms, en = " + s + " ");
}
}

#### Final Verilog Code:
module or_gate(
output b,
input [3:0] a,
input en
);
begin
b= (en==1) && (a[3]==1 || a[2]==1 || a[1]==1 || a[0]==1) || (en==1) && a[3]==1 && (a[2]==0 || a[1]==0 || a[0]==0) ;
end
endmodule

#### Final C++ Code:
class Or_gate extends Component
{
// Outputs
Bit b;
// Inputs
Bit a[4];
Bit en; // Enable

// Constructor
Or_gate()
{
// Inputs
add_port("a",a);
// Output
add_port("b",b);

// Inside check for a in range list
for(int i=0;i<4;i++){
if(a[i]==1){
// Check for a[i] == 1
add_check("a[i] == 1",a[i] == 1);
}
}
}
}

#### Final Testbench Code:
class TB_Or_Gate extendstb_uut
{
int i;

// Constructor
// Instantiate uut
// Define signal handlers
TB_Or_Gate(boolean do_verilator)
{
uut = new Or_gate();

}
}