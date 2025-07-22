`

import cmath
import math 
from sympy import *
import numpy as np
import decimal
import time
import random
import sys
import array
from timeit import default_timer as timer


#######################################################
# Parameters
#######################################################
# Number of inputs
size_in1 = 8
size_in2 = 8

# Number of outputs
size_out = 8

#############################################
# Verilog Type Variables
#############################################
# This is in order to be used with the packed operator in the case statement of the verilog code.
var_type_in1 = cmath.rect(1, 0)
var_type_in2 = cmath.rect(1, 0)
var_type_out = cmath.rect(1, 0)

#############################################
# Verilog Input Variables
#############################################
# These are the verilog input variables
par_in1, par_in2, clk = symbols('par_in1 par_in2 clk')

#############################################
# Verilog Output Variables
#############################################
# These are the verilog output variables
par_out = symbols('par_out')

#############################################
# Verilog Input Variables
#############################################
# These are the packed verilog input variables
m = symbols('m[0:1]')

#############################################
# Verilog Parameter Variables
#############################################
# These are the verilog parameter variables
par_in = symbols('par_in')

#############################################
# Verilog Variable Variables
#############################################
# These are the verilog parameter variables
sl = symbols('sl')
sr = symbols('sr')

#############################################
# Verilog Assignment Variables
#############################################
# These are the verilog parameter variables
par_out = symbols('par_out')

#############################################
# Verilog Module
#############################################
# This is the verilog module
shiftRegister = Module('ShiftRegister8')
# This is the verilog module input
shiftRegister.add_ports(
  ParIn = In(size_in1),
  m = In(2),
  sl = In(var_type_in1),
  sr = In(var_type_in1),
  clk = In(var_type_in1),
  ParOut = Out(size_out)
)

#############################################
# Verilog Code
#############################################
# This is the verilog code
shiftRegister.specialize({
  ParIn: par_in1,
  ParOut: par_out,
  m: m,
  clk: clk,
  sl: sl,
  sr: sr,
  ParIn: par_in2
})

#############################################
# Constraints
#############################################
# This is the constraint
# This is the constraint
shiftRegister.add_constraints(
  And(Not(m[0]), Not(m[1])),
  And(m[0], m[1])
)

#############################################
# Output
#############################################
# This is the output
print(shiftRegister.to_verilog())/code/python/Verilog_Python_Generator_Base_Shift_Register_8bit.py
import cmath
import math 
from sympy import *
import numpy as np
import decimal
import time
import random
import sys
import array
from timeit import default_timer as timer


#######################################################
# Parameters
#######################################################
# Number of inputs
size_in1 = 8
size_in2 = 8

# Number of outputs
size_out = 8

#############################################
# Verilog Type Variables
#############################################
# This is in order to be used with the packed operator in the case statement of the verilog code.
var_type_in1 = cmath.rect(1, 0)
var_type_in2 = cmath.rect(1, 0)
var_type_out = cmath.rect(1, 0)

#############################################
# Verilog Input Variables
#############################################
# These are the verilog input variables
par_in1, par_in2, clk = symbols('par_in1 par_in2 clk')

#############################################
# Verilog Output Variables
#############################################
# These are the verilog output variables
par_out = symbols('par_out')

#############################################
# Verilog Input Variables
#############################################
# These are the packed verilog input variables
m = symbols('m[0:1]')

#############################################
# Verilog Parameter Variables
#############################################
# These are the verilog parameter variables
par_in = symbols('par_in')

#############################################
# Verilog Variable Variables
#############################################
# These are the verilog parameter variables
sl = symbols('sl')
sr = symbols('sr')

#############################################
# Verilog Assignment Variables
#############################################
# These are the verilog parameter variables
par_out = symbols('par_out')

#############################################
# Verilog Module
#############################################
# This is the verilog module
shiftRegister = Module('ShiftRegister8')
# This is the verilog module input
shiftRegister.add_ports(
  ParIn = In(size_in1),
  m = In(2),
  sl = In(var_type_in1),
  sr = In(var_type_in1),
  clk = In(var_type_in1),
  ParOut = Out(size_out)
)

#############################################
# Verilog Code
#############################################
# This is the verilog code
shiftRegister.specialize({
  ParIn: par_in1,
  ParOut: par_out,
  m: m,
  clk: clk,
  sl: sl,
  sr: sr,
  ParIn: par_in2
})

#############################################
# Constraints
#############################################
# This is the constraint
# This is the constraint
shiftRegister.add_constraints(
  And(Not(m[0]), Not(m[1])),
  And(m[0], m[1])
)

#############################################
# Output
#############################################
# This is the output
print(shiftRegister.to_verilog())
/code/python/Verilog_Python_Generator_Base_Shift_Register_2to4bit.py
import cmath
import math 
from sympy import *
import numpy as np
import decimal
import time
import random
import sys
import array
from timeit import default_timer as timer


#######################################################
# Parameters
#######################################################
# Number of inputs
size_in1 = 2
size_in2 = 2

# Number of outputs
size_out = 4

#############################################
# Verilog Type Variables
#############################################
# This is in order to be used with the packed operator in the case statement of the verilog code.
var_type_in1 = cmath.rect(1, 0)
var_type_in2 = cmath.rect(1, 0)
var_type_out = cmath.rect(1, 0)

#############################################
# Verilog Input Variables
#############################################
# These are the verilog input variables
par_in1, par_in2, clk = symbols('par_in1 par_in2 clk')

#############################################
# Verilog Output Variables
#############################################
# These are the verilog output variables
par_out = symbols('par_out')

#############################################
# Verilog Input Variables
#############################################
# These are the packed verilog input variables
m = symbols('m[0:2]')

#############################################
# Verilog Parameter Variables
#############################################
# These are the verilog parameter variables
par_in = symbols('par_in')

#############################################
# Verilog Variable Variables
#############################################
# These are the verilog parameter variables
sl = symbols('sl')
sr = symbols('sr')

#############################################
# Verilog Assignment Variables
#############################################
# These are the verilog parameter variables
par_out = symbols('par_out')

#############################################
# Verilog Module
#############################################
# This is the verilog module
shiftRegister = Module('ShiftRegister4')
# This is the verilog module input
shiftRegister.add_ports(
  ParIn = In(size_in1),
  m = In(3),
  sl = In(var_type_in1),
  sr = In(var_type_in1),
  clk = In(var_type_in1),
  ParOut = Out(size_out)
)

#############################################
# Verilog Code
#############################################
# This is the verilog code
shiftRegister.specialize({
  ParIn: par_in1,
  ParOut: par_out,
  m: m,
  clk: clk,
  sl: sl,
  sr: sr,
  ParIn: par_in2
})

#############################################
# Constraints
#############################################
# This is the constraint
# This is the constraint
shiftRegister.add_constraints(
  And(Not(m[0]), Not(m[1])),
  And(m[0], m[1])
)

#############################################
# Output
#############################################
# This is the output
print(shiftRegister.to_verilog())