module Full_Adder_Chain(
    input A, B, Cin,
    output logic [15:0] S, Cin_out
);
    reg [15:0] Sum, Cin_out;
    Half_Adder HA_1 (A, B, Sum, C1);    // Sum = A ^ B, Cin = C1
    Half_Adder HA_2 (C1, Sum, Sum, Cin); // Sum = Sum ^ C1, Cin = Cin
    Half_Adder HA_3 (Cin, Sum, Sum, Cin_out); // Sum = Sum ^ Cin, Cin_out = Cin
endmodule
// End of Verilog code for Problem 8
/ECE 160 Final Project/Code/ECE160_Final_Project.py
"""
ECE 160 Final Project
"""

import numpy as np
import matplotlib.pyplot as plt


def R_to_K(R):
    """
    Convert resistance to conductance.
    
    R: resistance (float)
    """
    K = np.sqrt(R)
    return K

def K_to_R(K):
    """
    Convert conductance to resistance.
    
    K: conductance (float)
    """
    R = 1 / (K ** 2)
    return R

def R_to_S(R):
    """
    Convert resistance to admittance.
    
    R: resistance (float)
    """
    S = 1 / R
    return S

def S_to_R(S):
    """
    Convert admittance to resistance.
    
    S: admittance (float)
    """
    R = 1 / S
    return R

def R_to_Z(R):
    """
    Convert resistance to impedance.
    
    R: resistance (float)
    """
    Z = np.sqrt(R)
    return Z

def Z_to_R(Z):
    """
    Convert impedance to resistance.
    
    Z: impedance (float)
    """
    R = Z ** 2
    return R

def R_to_Y(R):
    """
    Convert resistance to susceptance.
    
    R: resistance (float)
    """
    Y = 1 / R
    return Y

def Y_to_R(Y):
    """
    Convert susceptance to resistance.
    
    Y: susceptance (float)
    """
    R = 1 / Y
    return R

def Z_to_S(Z):
    """
    Convert impedance to admittance.
    
    Z: impedance (float)
    """
    S = 1 / Z
    return S

def S_to_Z(S):
    """
    Convert admittance to impedance.
    
    S: admittance (float)
    """
    Z = 1 / S
    return Z

def Z_to_Y(Z):
    """
    Convert impedance to susceptance.
    
    Z: impedance (float)
    """
    Y = Z ** -2
    return Y

def Y_to_Z(Y):
    """
    Convert susceptance to impedance.
    
    Y: susceptance (float)
    """
    Z = Y ** -1
    return Z

def S_to_Y(S):
    """
    Convert admittance to susceptance.
    
    S: admittance (float)
    """
    Y = 1 / S
    return Y

def Y_to_S(Y):
    """
    Convert susceptance to admittance.
    
    Y: susceptance (float)
    """
    S = 1 / Y
    return S

def Y_to_V(Y):
    """
    Convert susceptance to voltage.
    
    Y: susceptance (float)
    """
    V = 1 / Y
    return V

def V_to_Y(V):
    """
    Convert voltage to susceptance.
    
    V: voltage (float)
    """
    Y = 1 / V
    return Y

if __name__ == "__main__":
    # Problem 1: S & Z
    Z = 31 * 10 ** 9
    Z = Z_to_S(Z)
    S = Z ** -1
    print("Problem 1: S & Z")
    print("Z = {:.4f} Ohms".format(Z))
    print("S = {:.4e} S".format(S))
    print("\n")

    # Problem 2: R & Y
    Y = 3 * 10 ** 3
    Y = Y_to_R(Y)
    R = 1 / Y
    print("Problem 2: R & Y")
    print("Y = {:.4f} Ohms".format(Y))
    print("R = {:.4f} Ohms".format(R))
    print("\n")

    # Problem 3:
    # 1) R = R_to_K(125)
    # 2) R = R_to_S(125)
    # 3) R = R_to_Z(125)
    # 4) R = R_to_Y(125)
    R = 125
    R = R_to_K(R)
    print("Problem 3: R")
    print