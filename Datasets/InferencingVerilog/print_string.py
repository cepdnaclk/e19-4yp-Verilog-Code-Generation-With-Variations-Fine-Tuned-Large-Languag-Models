print("```\nmodule wire_assign( input in, output out );\n    // assign out to in\n\
    \    assign out = in;\n    // assign in to out\n    assign in = out;\nendmodule\n\
    ```\n### Result:\n```\n% sv2v -i -v out.sv\n# Verilog module: 1\n# SystemVerilog\
    \ module: 0\n# Error: out.sv:3: syntax error, unexpected 'endmodule', expecting\
    \ 'end'\n```\n### Notes:\nThe Verilog compiler cannot read the SystemVerilog module.\n\
    \n\no | awk '{print $3}'| cut -c 2-)\"\n\techo \"$version\"\nfi\n#!/bin/bash\n\
    \nversion=`cat VERSION`\necho \"$version\"\n\nif [[ -f /usr/local/bin/verilator\
    \ ]]; then\n\tversion=\"$($VERILOG_SIM/verilator -V | grep \"Version:\"| awk '{print\
    \ $2}')\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/abc ]]; then\n\t\
    version=\"$($VERILOG_SIM/abc -v | grep \"version:\"| awk '{print $3}' | cut -c\
    \ 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/moore ]]; then\n\t\
    version=\"$($VERILOG_SIM/moore -v | grep \"Version:\"| awk '{print $2} | cut -c\
    \ 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/x2p ]]; then\n\tversion=\"\
    $($VERILOG_SIM/x2p -h | grep \"Version\" | awk '{print $3}'| cut -c 2-)\"\n\t\
    echo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/verilog2vhdl ]]; then\n\tversion=\"\
    $($VERILOG_SIM/verilog2vhdl -v | grep \"Version\" | awk '{print $3}'| cut -c 2-)\"\
    \n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/verilator ]]; then\n\tversion=\"\
    $($VERILOG_SIM/verilator -V | grep \"Version:\"| awk '{print $2} | cut -c 2-)\"\
    \n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/yosys ]]; then\n\tversion=\"\
    $($VERILOG_SIM/yosys -v | grep \"Yosys \" | awk '{print $2}'| cut -c 2-)\"\n\t\
    echo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/verilog2vhdl ]]; then\n\tversion=\"\
    $($VERILOG_SIM/verilog2vhdl -v | grep \"Version\" | awk '{print $3}'| cut -c 2-)\"\
    \n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/iverilog ]]; then\n\tversion=\"\
    $($VERILOG_SIM/iverilog --version | grep \"Version\" | awk '{print $2}'| cut -c\
    \ 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/verilator ]]; then\n\
    \tversion=\"$($VERILOG_SIM/verilator -V | grep \"Version:\"| awk '{print $2} |\
    \ cut -c 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/vlog ]]; then\n\
    \tversion=\"$($VERILOG_SIM/vlog -V | grep \"Version:\"| awk '{print $2} | cut\
    \ -c 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/x2p ]]; then\n\t\
    version=\"$($VERILOG_SIM/x2p -h | grep \"Version\" | awk '{print $3}'| cut -c\
    \ 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/x2p ]]; then\n\tversion=\"\
    $($VERILOG_SIM/x2p -h | grep \"Version\" | awk '{print $3}'| cut -c 2-)\"\n\t\
    echo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/verilog2vhdl ]]; then\n\tversion=\"\
    $($VERILOG_SIM/verilog2vhdl -v | grep \"Version\" | awk '{print $3}'| cut -c 2-)\"\
    \n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/iverilog ]]; then\n\tversion=\"\
    $($VERILOG_SIM/iverilog --version | grep \"Version\" | awk '{print $2}'| cut -c\
    \ 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/verilator ]]; then\n\
    \tversion=\"$($VERILOG_SIM/verilator -V | grep \"Version:\"| awk '{print $2} |\
    \ cut -c 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/vlog ]]; then\n\
    \tversion=\"$($VERILOG_SIM/vlog -V | grep \"Version:\"| awk '{print $2} | cut\
    \ -c 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/x2p ]]; then\n\t\
    version=\"$($VERILOG_SIM/x2p -h | grep \"Version\" | awk '{print $3}'| cut -c\
    \ 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/x2p ]]; then\n\tversion=\"\
    $($VERILOG_SIM/x2p -h | grep \"Version\" | awk '{print $3}'| cut -c 2-)\"\n\t\
    echo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/verilog2vhdl ]]; then\n\tversion=\"\
    $($VERILOG_SIM/verilog2vhdl -v | grep \"Version\" | awk '{print $3}'| cut -c 2-)\"\
    \n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/iverilog ]]; then\n\tversion=\"\
    $($VERILOG_SIM/iverilog --version | grep \"Version\" | awk '{print $2}'| cut -c\
    \ 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/verilator ]]; then\n\
    \tversion=\"$($VERILOG_SIM/verilator -V | grep \"Version:\"| awk '{print $2} |\
    \ cut -c 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/vlog ]]; then\n\
    \tversion=\"$($VERILOG_SIM/vlog -V | grep \"Version:\"| awk '{print $2} | cut\
    \ -c 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/x2p ]]; then\n\t\
    version=\"$($VERILOG_SIM/x2p -h | grep \"Version\" | awk '{print $3}'| cut -c\
    \ 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/x2p ]]; then\n\tversion=\"\
    $($VERILOG_SIM/x2p -h | grep \"Version\" | awk '{print $3}'| cut -c 2-)\"\n\t\
    echo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/verilog2vhdl ]]; then\n\tversion=\"\
    $($VERILOG_SIM/verilog2vhdl -v | grep \"Version\" | awk '{print $3}'| cut -c 2-)\"\
    \n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/iverilog ]]; then\n\tversion=\"\
    $($VERILOG_SIM/iverilog --version | grep \"Version\" | awk '{print $2}'| cut -c\
    \ 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/verilator ]]; then\n\
    \tversion=\"$($VERILOG_SIM/verilator -V | grep \"Version:\"| awk '{print $2} |\
    \ cut -c 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/vlog ]]; then\n\
    \tversion=\"$($VERILOG_SIM/vlog -V | grep \"Version:\"| awk '{print $2} | cut\
    \ -c 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/x2p ]]; then\n\t\
    version=\"$($VERILOG_SIM/x2p -h | grep \"Version\" | awk '{print $3}'| cut -c\
    \ 2-)\"\n\techo \"$version\"\nfi\n\nif [[ -f /usr/local/bin/x2p ]]; then\n\tversion=\"\
    $($VERILOG_SIM")