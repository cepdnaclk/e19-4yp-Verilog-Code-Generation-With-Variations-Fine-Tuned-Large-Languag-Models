module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;
wire [3:0] A_range = {1'b1, A};
wire [3:0] B_range = {1'b0, B};

logic inside_A = A_range[1:0] == {1'b0, 2'b11};
logic inside_B = B_range[1:0] == {1'b0, 2'b11};

always @(s or A or B)
    case (s)
        0: F = 4'b0000;
        1: when (inside_A && inside_B) F = B - A;
        2: when (inside_A && inside_B) F = A - B;
        3: when (inside_A && inside_B) F = A + B;
        4: when (inside_A && inside_B) F = A ^ B;
        5: when (inside_A && inside_B) F = A | B;
        6: when (inside_A && inside_B) F = A & B;
        7: F = 4'b1111;
    endcase
endmodule
<img src="imgs/inside_3.png" width = "80%" style="float:middle" align=center />  
<img src="imgs/inside_4.png" width = "80%" style="float:middle" align=center />
<img src="imgs/inside_5.png" width = "80%" style="float:middle" align=center />


## Design

| Module  | Inputs  | Outputs | Registers |
| ------- | ------- | ------- | --------- |
| mem     | A, addr | W       |           |
| decode  | A       | s, A, B |           |
| mux     | A, B    | s       |           |
| alu     | s, A, B | F       |           |
| mem_wb  | W       | F       |           |
| register| d, e    | F       |           |
| control | s       | op, ALU |           |
| PC      | PC, op  | PC      |           |


## Results

<img src="imgs/result_1.png" width = "80%" style="float:middle" align=center />
<img src="imgs/result_2.png" width = "80%" style="float:middle" align=center />

## FPGA Simulation

<img src="imgs/simulation.png" width = "80%" style="float:middle" align=center />

## Testbench Simulations

### ALU Testbench

<img src="imgs/ALU_Testbench.png" width = "80%" style="float:middle" align=center />

### Mem Testbench

<img src="imgs/Mem_Testbench.png" width = "80%" style="float:middle" align=center />
from flask import Flask, request
import json
import mysql.connector

app = Flask(__name__)

@app.route('/register', methods = ['GET', 'POST'])
def register():
    try:
        user_id = request.json['ID']
    except KeyError:
        return json.dumps('Key Error')
    con = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "",
    database = "register"
    )
    if request.method == 'GET':
        cursor = con.cursor()
        cursor.execute("SELECT * from users WHERE ID = '{}'".format(user_id))
        result = cursor.fetchone()
    else:
        cursor = con.cursor()
        cursor.execute("INSERT INTO users (ID) VALUES ('{}')".format(user_id))
        con.commit()
        result = "Successed"
    con.close()
    return json.dumps(result)

@app.route('/unregister', methods = ['GET', 'POST'])
def unregister():
    try:
        user_id = request.json['ID']
    except KeyError:
        return json.dumps('Key Error')
    con = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "",
    database = "register"
    )
    if request.method == 'GET':
        cursor = con.cursor()
        cursor.execute("SELECT * from users WHERE ID = '{}'".format(user_id))
        result = cursor.fetchone()
    else:
        cursor = con.cursor()
        cursor.execute("DELETE FROM users WHERE ID = '{}'".format(user_id))
        con.commit()
        result = "Successed"
    con.close()
    return json.dumps(result)

if __name__ == '__main__':
    app.run(debug = True)
import os

os.system("python3 main.py")
# Lab 1 - FPGA Basics

## Contents

* [Introduction](#introduction)
* [FPGA](#fpga)
* [Verilog](#verilog)
* [Vivado](#vivado)
* [Design](#design)
* [Results](#results)
* [FPGA Simulation](#fpga-simulation)
* [Testbench Simulations](#testbench-simulations)

## Introduction

This lab is one of the required labs for ECE 304. It illustrates the basic hardware flow of FPGA. In this lab, we need to create a digital circuit that can output the result of addition of two 8-bit numbers. The Verilog file is given in [ECE 304 - Lab 1.zip](https://www.dropbox.com/s/q1i13y361ybk17g/ECE%20304%20-%20Lab%201.zip?dl=0).

## FPGA

A FPGA is a full-chip integrated circuit, which means it contains all the components of the complete system (CPU, memory, controller, etc.). It is often called "Field Programmable Gate Array". The FPGA