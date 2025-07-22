```
`include "test_bench_top.sv"

module TestDataComponent;

parameter integer NUM_TESTS = 1000000;
parameter integer NUM_ITERATIONS = 10;

localparam TestWidth = 8;
localparam BitWidth = TestWidth + 7;

localparam integer BitMask = (1 << BitWidth) - 1;

reg [TestWidth-1:0] DataIn;

reg [BitWidth-1:0] Rand;
reg [BitWidth-1:0] DataOut;
reg ControlSignals;

DataComponent DUT(
.DataIn(DataIn),
.DataOut(DataOut),
.ControlSignals(ControlSignals)
);

initial begin
$dumpfile("DataComponent.vcd");
$dumpvars(0, TestDataComponent);

for (integer i = 0; i < NUM_TESTS; i ++) begin
DataIn = (Rand & BitMask);
ControlSignals = 1;

for (integer j = 0; j < NUM_ITERATIONS; j++) begin
# 1;
end

$display("%08d, %02x, %03x, %d", i, DataIn, DataOut, ControlSignals);
end

end
endmodule
```
   // Test cases
        // First one is not a duplicate
        for (int i = 1; i < 100; i++) {
            array.add(i);
        }
        System.out.println("Should be false: " + array.contains(1));
        System.out.println("Should be true: " + array.contains(98));
        System.out.println("Should be false: " + array.contains(99));
    }
}
/HW4/src/ArrayIntList.java
/**
 * @author 
 * @version 1.0
 * @since 05/27/2018
 */
public class ArrayIntList implements IntList {

    private int[] list;
    private int count;

    public ArrayIntList(int size) {
        list = new int[size];
        count = 0;
    }

    @Override
    public int size() {
        return count;
    }

    @Override
    public boolean contains(int value) {
        for (int i = 0; i < count; i++) {
            if (list[i] == value) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void insert(int index, int value) {
        if (index <= count && index >= 0) {
            if (count == list.length) {
                int[] temp = new int[list.length * 2];
                for (int i = 0; i < list.length; i++) {
                    temp[i] = list[i];
                }
                list = temp;
            }
            for (int i = count; i >= index; i--) {
                list[i] = list[i - 1];
            }
            list[index] = value;
            count++;
        } else {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + count);
        }
    }

    @Override
    public int remove(int index) {
        if (index <= count && index >= 0) {
            int removed = list[index];
            for (int i = index; i < count - 1; i++) {
                list[i] = list[i + 1];
            }
            count--;
            return removed;
        } else {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + count);
        }
    }

    @Override
    public int get(int index) {
        if (index < count && index >= 0) {
            return list[index];
        } else {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + count);
        }
    }

    public int set(int index, int value) {
        if (index < count && index >= 0) {
            int temp = list[index];
            list[index] = value;
            return temp;
        } else {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + count);
        }
    }

    public void main() {
        // Preexisting lists
        ArrayIntList array = new ArrayIntList(100);

        // Tests empty list
        System.out.println("Should be 0: " + array.size());
        System.out.println("Should be false: " + array.contains(0));

        // Test cases with a bunch of 9s in them
        for (int i = 0; i < 10; i++) {
            array.add(9);
        }

        System.out.println("Should be true: " + array.contains(9));
        System.out.println("Should be true: " + array.contains(8));
        System.out.println("Should be true: " + array.contains(7));
        System.out.println("Should be true: " + array.contains(6));

        System.out.println("Should be 10: " + array.size());

        // Test negative index
        try {
            array.remove(-1);
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Caught expected exception: " + e.getMessage());
        }

        // Test out of bounds index
        try {
            array.remove(10);
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Caught expected exception: " + e.getMessage());
        }

        // Add to index 0
        array.insert(0, 0);

        System.out.println("Should be true: " + array.contains(0));
        System.out.println("Should be 11: " + array.size());

        // Add to index 11
        array.insert(11, 11);

        System.out.println("Should be true: " + array.contains(11));
        System.out.println("Should be 12: " + array.size());

        // Test get
        System.out.println("Should be 9: " + array.get(0));

        // Test set
        System.out.println("Should be 3: " + array.set(5, 3));
        System.out.println("Should be 3: " + array.get(5));

        // Test negative index
        try {
            System.out.println("Should be " + array.set(-1, 11));
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Caught expected exception: " + e.getMessage());
        }

        // Test out of bounds index
        try {
            System.out.println("Should be " + array.set(10, 11));
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Caught expected exception: " + e.getMessage());
        }

        // Testing remove
        System.out.println("Should be true: " + array.contains(3));

        System.out.println("Should be 3: " + array.remove(5));

        System.out.println("Should be false: " + array.contains(3));
        System.out.println("Should be true: " + array.contains(0));
        System.out.println("Should be true: " + array.contains(9));
        System.out.println("Should be 10: " + array.size());

        // Test first index
        System.out.println("Should be 0: " + array.remove(0));
        System.out.println("Should be false: " + array.contains(0));
        System.out.println("Should be true: " + array.contains(9));
        System.out.println("Should be 9: " + array.size());

        System.out.println("Should be 9: " + array.remove(8));
        System.out.println("Should be false: " + array.contains(9));
        System.out.println("Should be true: " + array.contains(8));
        System.out.println("Should be 8: " + array.size());

        // Test for removal
        System.out.println("Should be 8: " + array.remove(7));
        System.out.println("Should be false: " + array.contains(8));
        System.out.println("Should be true: " + array.contains(7));
        System.out.println("Should be 7: " + array.size());

        // Test for removal
        System.out.println("Should be 7: " + array.remove(6));
        System.out.println("Should be false: " + array.contains(8));
        System.out.println("Should be false: " + array.contains(7));
        System.out.println("Should be 6: " + array.size());

        // Test for removal
        System.out.println("Should be 6: " + array.remove(5));
        System.out.println("Should be false: " + array.contains(6));
        System.out.println("Should be true: "