module XOR_Gate(
    input logic [1:0] A [0:3], B [0:3],
    output logic [1:0] Y [0:3]
);
    assign Y = A ^ B;
endmodule
### Simulation Setup:
    * SIMULATION SETUP
    * This section creates the simulation environment, sets up simulation variables and runs the simulation.
    * Please note that the default behaviour of this script is to run the simulation.
import sys
import os
# Import local path to OpenROAD
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__)))))
import globals
# Set environment path to OpenROAD tools
globals.set_openroad_env_path(os.path.dirname(os.path.dirname(globals.get_openroad_path())))
# Import OpenSTA modules
from Sta import Sta
# Import OpenDB modules
from OpenDB import OpenDB
# Import PyVerilog modules
from Verilog import Verilog
# Import PyAha modules
from PyAha import PyAha
# Import PyOracle modules
from PyOracle import PyOracle
# Import PyTinsel modules
from PyTinsel import PyTinsel
# Import GAMS modules
from GAMS import GAMS
# Import PyFlow modules
from PyFlow import PyFlow
# Import PyVerilator modules
from PyVerilator import PyVerilator
# Import PyCadence modules
from PyCadence import PyCadence
# Import PyOpalKelly modules
from PyOpalKelly import PyOpalKelly
# Import PyTechnoGlobe modules
from PyTechnoGlobe import PyTechnoGlobe
# Import PyRenegade modules
from PyRenegade import PyRenegade
# Import PyDavex modules
from PyDavex import PyDavex
# Import PyCentaur modules
from PyCentaur import PyCentaur
# Import PyEttus modules
from PyEttus import PyEttus
# Import PyChipScope modules
from PyChipScope import