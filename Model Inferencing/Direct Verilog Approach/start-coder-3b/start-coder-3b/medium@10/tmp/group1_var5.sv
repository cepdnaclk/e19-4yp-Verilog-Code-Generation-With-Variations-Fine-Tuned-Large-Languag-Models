`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case ({m[1:0], m})
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        default: ParOut <= 8'bX;
    endcase
end
endmodule
### Result of Variation:
`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case ({m[1:0], m})
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        default: ParOut <= 8'bX;
    endcase
end
endmodule
# Results
![results](https://github.com/josephkoh2020/VHDL-code-optimization/blob/main/doc/img/Results_case.PNG)s = np.random.randint(1, 12, 20)    
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()import numpy as np
import matplotlib.pyplot as plt

def max_value(arr):
    currMax = arr[0]
    for i in range(1, len(arr)):
        if arr[i] > currMax:
            currMax = arr[i]
    return currMax

if __name__ == '__main__':
    arr = np.random.randint(1, 12, 50)
    arr = arr.tolist()
    arr.sort()
    arr.reverse()
    arr = np.array(arr)
    arr = np.random.randint(1, 12, 50)    
    arr = arr.tolist()
    arr.sort()
    arr = np.array(arr)
    arr = np.random.randint(1, 12, 50)
    arr = arr.tolist()
    arr.sort()
    arr = np.array(arr)
    arr = np.random.randint(1, 12, 10)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()
    
    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.title('Max Value of Each Index')
    plt.show()

    arr = np.random.randint(1, 12, 20)
    print(arr)
    print('Max is:', max_value(arr))
    plt.plot(arr)
    plt.xlabel('Index')
    plt.ylabel