module wire_assign( input in, output out );
    // assign out to in
    \    assign out = in;
    // assign in to out
    assign in = out;
endmodule
    ```
### Result:
```
% sv2v -i -v out.sv
# Verilog module: 1
# SystemVerilog    \ module: 0
# Error: out.sv:3: syntax error, unexpected 'endmodule', expecting    \ 'end'
```
### Notes:
The Verilog compiler cannot read the SystemVerilog module.
    

o | awk '{print $3}'| cut -c 2-)"
        echo "$version"
fi
#!/bin/bash
    
version=`cat VERSION`
echo "$version"

if [[ -f /usr/local/bin/verilator    \ ]]; then
        version="$($VERILOG_SIM/verilator -V | grep "Version:"| awk '{print    \ $2}')"
        echo "$version"
fi

if [[ -f /usr/local/bin/abc ]]; then
            version="$($VERILOG_SIM/abc -v | grep "version:"| awk '{print $3}' | cut -c    \ 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/moore ]]; then
            version="$($VERILOG_SIM/moore -v | grep "Version:"| awk '{print $2} | cut -c    \ 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/x2p ]]; then
        version="    $($VERILOG_SIM/x2p -h | grep "Version" | awk '{print $3}'| cut -c 2-)"
            echo "$version"
fi

if [[ -f /usr/local/bin/verilog2vhdl ]]; then
        version="    $($VERILOG_SIM/verilog2vhdl -v | grep "Version" | awk '{print $3}'| cut -c 2-)"    
        echo "$version"
fi

if [[ -f /usr/local/bin/verilator ]]; then
        version="    $($VERILOG_SIM/verilator -V | grep "Version:"| awk '{print $2} | cut -c 2-)"    
        echo "$version"
fi

if [[ -f /usr/local/bin/yosys ]]; then
        version="    $($VERILOG_SIM/yosys -v | grep "Yosys " | awk '{print $2}'| cut -c 2-)"
            echo "$version"
fi

if [[ -f /usr/local/bin/verilog2vhdl ]]; then
        version="    $($VERILOG_SIM/verilog2vhdl -v | grep "Version" | awk '{print $3}'| cut -c 2-)"    
        echo "$version"
fi

if [[ -f /usr/local/bin/iverilog ]]; then
        version="    $($VERILOG_SIM/iverilog --version | grep "Version" | awk '{print $2}'| cut -c    \ 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/verilator ]]; then
        version="$($VERILOG_SIM/verilator -V | grep "Version:"| awk '{print $2} |    \ cut -c 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/vlog ]]; then
        version="$($VERILOG_SIM/vlog -V | grep "Version:"| awk '{print $2} | cut    \ -c 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/x2p ]]; then
            version="$($VERILOG_SIM/x2p -h | grep "Version" | awk '{print $3}'| cut -c    \ 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/x2p ]]; then
        version="    $($VERILOG_SIM/x2p -h | grep "Version" | awk '{print $3}'| cut -c 2-)"
            echo "$version"
fi

if [[ -f /usr/local/bin/verilog2vhdl ]]; then
        version="    $($VERILOG_SIM/verilog2vhdl -v | grep "Version" | awk '{print $3}'| cut -c 2-)"    
        echo "$version"
fi

if [[ -f /usr/local/bin/iverilog ]]; then
        version="    $($VERILOG_SIM/iverilog --version | grep "Version" | awk '{print $2}'| cut -c    \ 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/verilator ]]; then
        version="$($VERILOG_SIM/verilator -V | grep "Version:"| awk '{print $2} |    \ cut -c 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/vlog ]]; then
        version="$($VERILOG_SIM/vlog -V | grep "Version:"| awk '{print $2} | cut    \ -c 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/x2p ]]; then
            version="$($VERILOG_SIM/x2p -h | grep "Version" | awk '{print $3}'| cut -c    \ 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/x2p ]]; then
        version="    $($VERILOG_SIM/x2p -h | grep "Version" | awk '{print $3}'| cut -c 2-)"
            echo "$version"
fi

if [[ -f /usr/local/bin/verilog2vhdl ]]; then
        version="    $($VERILOG_SIM/verilog2vhdl -v | grep "Version" | awk '{print $3}'| cut -c 2-)"    
        echo "$version"
fi

if [[ -f /usr/local/bin/iverilog ]]; then
        version="    $($VERILOG_SIM/iverilog --version | grep "Version" | awk '{print $2}'| cut -c    \ 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/verilator ]]; then
        version="$($VERILOG_SIM/verilator -V | grep "Version:"| awk '{print $2} |    \ cut -c 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/vlog ]]; then
        version="$($VERILOG_SIM/vlog -V | grep "Version:"| awk '{print $2} | cut    \ -c 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/x2p ]]; then
            version="$($VERILOG_SIM/x2p -h | grep "Version" | awk '{print $3}'| cut -c    \ 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/x2p ]]; then
        version="    $($VERILOG_SIM/x2p -h | grep "Version" | awk '{print $3}'| cut -c 2-)"
            echo "$version"
fi

if [[ -f /usr/local/bin/verilog2vhdl ]]; then
        version="    $($VERILOG_SIM/verilog2vhdl -v | grep "Version" | awk '{print $3}'| cut -c 2-)"    
        echo "$version"
fi

if [[ -f /usr/local/bin/iverilog ]]; then
        version="    $($VERILOG_SIM/iverilog --version | grep "Version" | awk '{print $2}'| cut -c    \ 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/verilator ]]; then
        version="$($VERILOG_SIM/verilator -V | grep "Version:"| awk '{print $2} |    \ cut -c 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/vlog ]]; then
        version="$($VERILOG_SIM/vlog -V | grep "Version:"| awk '{print $2} | cut    \ -c 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/x2p ]]; then
            version="$($VERILOG_SIM/x2p -h | grep "Version" | awk '{print $3}'| cut -c    \ 2-)"
        echo "$version"
fi

if [[ -f /usr/local/bin/x2p ]]; then
        version="    $($VERILOG_SIM