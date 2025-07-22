```
always_comb begin

x[1] = 2'b00 & ~a;
x[2] = 2'b00 & ~a;
if (a!= a_old) begin
    x[2] = 2'b110;
end

y = (x[1] & x[2]) | (x[2] & x[0]);

end
```
### Reference:
https://en.wikipedia.org/wiki/Disjoint-path_multiplier

/06_Verilog_Generator/src/VerilogGenerator.cpp
#include "VerilogGenerator.h"

void VerilogGenerator::addStatement(std::string statementLine) {
    if (statementLine.size() > 0) {
        statementLines.push_back(statementLine);
    }
}

bool VerilogGenerator::generateVerilog(std::string filename) {
    bool outputSuccess = true;
    std::ofstream codeFile(filename);

    if (codeFile.is_open()) {
        codeFile << "module " << module.getName() << "(" << module.getInputs() << ");\n";
        for (unsigned int i = 0; i < module.getInputs().size(); i++) {
            codeFile << "\tinput " << module.getInputs()[i].getName() << ";\n";
        }

        codeFile << module.getOutputs();
        for (unsigned int i = 0; i < module.getOutputs().size(); i++) {
            codeFile << "\toutput " << module.getOutputs()[i].getName() << ";\n";
        }

        codeFile << "\n\t" << module.getClock() << " clk, reset;\n";
        codeFile << module.getConstants();
        codeFile << module.getRegisters();
        codeFile << module.getAlways();

        codeFile << "\nendmodule\n";

        codeFile.close();
    } else {
        outputSuccess = false;
    }

    return outputSuccess;
}

void VerilogGenerator::addModule(std::string name, std::string clock, std::vector<std::string> inputs, std::vector<std::string> outputs, std::vector<std::string> constants, std::vector<std::string> registers, std::vector<std::string> always) {
    module.setName(name);
    module.setClock(clock);
    module.setInputs(inputs);
    module.setOutputs(outputs);
    module.setConstants(constants);
    module.setRegisters(registers);
    module.setAlways(always);
}

void VerilogGenerator::print() {
    std::cout << "Name: " << module.getName() << std::endl;
    std::cout << "Clock: " << module.getClock() << std::endl;
    std::cout << "Inputs: ";
    for (auto input : module.getInputs()) {
        std::cout << input << " ";
    }
    std::cout << std::endl;
    std::cout << "Outputs: ";
    for (auto output : module.getOutputs()) {
        std::cout << output << " ";
    }
    std::cout << std::endl;
    std::cout << "Constants: ";
    for (auto constant : module.getConstants()) {
        std::cout << constant << " ";
    }
    std::cout << std::endl;
    std::cout << "Registers: ";
    for (auto registerLine : module.getRegisters()) {
        std::cout << registerLine << " ";
    }
    std::cout << std::endl;
    std::cout