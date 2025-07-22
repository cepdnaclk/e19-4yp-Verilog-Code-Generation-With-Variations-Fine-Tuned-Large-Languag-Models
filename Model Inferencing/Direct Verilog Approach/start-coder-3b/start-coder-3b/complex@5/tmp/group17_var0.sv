#include "verilog.hpp"
using namespace std;
int main()
{
// Declare module
verilog::module* comp = new verilog::module("comp");
// Declare generic parameter
verilog::gen_var* N = comp->generic("N", verilog::signed_num);
std::string x_decl = "wire [N-1:0] x;";
std::string y_decl = "wire [N-1:0] y;";
std::string gt_decl = "output reg gt;";
std::string eq_decl = "output reg eq;";
std::string lt_decl = "output reg lt;";
// Declare ports
verilog::sig_var* x = comp->port(x_decl, verilog::sig_var::PORT_WIRE);
verilog::sig_var* y = comp->port(y_decl, verilog::sig_var::PORT_WIRE);
verilog::sig_var* gt = comp->port(gt_decl, verilog::sig_var::PORT_REG);
verilog::sig_var* eq = comp->port(eq_decl, verilog::sig_var::PORT_REG);
verilog::sig_var* lt = comp->port(lt_decl, verilog::sig_var::PORT_REG);
// Create an array to get the index result of the inside operator
verilog::sig_var* inside_arr = new verilog::sig_var("inside_arr", verilog::signed_num);
// Generate statements
comp->add_stmt(verilog::bin_op::lt, x, y, lt);
comp->add_stmt(verilog::bin_op::eq, x, y, eq);
comp->add_stmt(verilog::bin_op::gt, x, y, gt);
comp->add_stmt(verilog::bin_op::inside, inside_arr, lt, gt);
comp->add_stmt(verilog::bin_op::inside, inside_arr, eq, lt);
verilog::print_statements(comp, std::cout);
// Create an array to get the index result of the inside operator
verilog::func_call* inside_func = new verilog::func_call("inside");
inside_func->add_input(x);
inside_func->add_input(y);
verilog::sig_var* inside_arr = new verilog::sig_var("inside_arr", verilog::signed_num);
inside_func->set_output(inside_arr);
verilog::bin_op* gt_inside = new verilog::bin_op(verilog::bin_op::gt);
gt_inside->add_input(inside_arr);
gt_inside->add_input(gt);
inside_func->add_statement(gt_inside);
verilog::bin_op* eq_inside = new verilog::bin_op(verilog::bin_op::eq);
eq_inside->add_input(inside_arr);
eq_inside->add_input(eq);
inside_func->add_statement(eq_inside);
// Create another array to get the index result of the