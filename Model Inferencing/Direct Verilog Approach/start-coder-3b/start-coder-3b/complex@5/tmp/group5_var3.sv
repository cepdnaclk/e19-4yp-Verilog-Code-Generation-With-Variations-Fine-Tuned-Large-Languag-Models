#include <systemc.h>
SC_MODULE(mealy)
{
    sc_in<bool> Clock;
    sc_in<bool> Resetn;
    sc_in<bool> w;
    sc_out<bool> z;
    // Declare the array of 2 FSM states.
    int state_array[2] = {0, 1};

    SC_CTOR(mealy)
    {
        // Declare and map the FSM array into an SC_FSM.
        SC_FSM(state_array, A, B);
        SC_FSM_INIT(mealy_A);
        SC_FSM_UPDATE(mealy_B);
        SC_FSM_UPDATE(mealy_A);
        SC_FSM_OUTPUT(A, 0);
        SC_FSM_OUTPUT(B, 1);

        SC_THREAD(FSM);
        sensitive << Clock.pos();
        dont_initialize();
    }

    void FSM()
    {
        if (Resetn.read() == 0)
            y.write(A);
        else
            y.write(Y);
    }

    SC_FSM_ARRAY(mealy_A)
    {
        if (w.read())
        {
            z.write(0);
            Y.write(B);
        }
        else
        {
            z.write(0);
            Y.write(A);
        }
    }
    SC_FSM_ARRAY(mealy_B)
    {
        if (w.read())
        {
            z.write(1);
            Y.write(B);
        }
        else
        {
            z.write(0);
            Y.write(A);
        }
    }
    sc_int<2> A, B, y, Y;
};
int sc_main(int argc, char *argv[])
{
    sc_signal<bool> Clock, Resetn, w, z;
    sc_trace(sc_stdout, Clock, "Clock");
    sc_trace(sc_stdout, Resetn, "Resetn");
    sc_trace(sc_stdout, w, "w");
    sc_trace(sc_stdout, z, "z");

    mealy mealy_inst("mealy_inst");
    mealy_inst.Clock(Clock);
    mealy_inst.Resetn(Resetn);
    mealy_inst.w(w);
    mealy_inst.z(z);

    sc_start(1, SC_SEC);
    sc_start(1, SC_SEC);

    w = 1;
    sc_start(1, SC_SEC);

    w = 0;
    sc_start(1, SC_SEC);

    sc_stop();
    return 0;
}

### Output:
* `Resetn` is 1
* `w` is 1
* `z` is 0
* `y` is 1
* `Resetn` is 0
* `w` is 1
* `z` is 1
* `y` is 1
* `Resetn` is 0
* `w` is 0
* `z` is 0
* `y` is 1
### Explanation:
* When `Resetn` is set to 1, the first two state transitions of the `A` array are executed, resulting in `z` being set to 0 and `Y` being set to 1.
* When `w` is set to 1, the third and fourth state transitions of the `A` array are executed. `z` is set to 1, and `Y` is set to 1.
* When `Resetn` is set to 0, the first two state transitions of the `B` array are executed, resulting in `z` being set to 0, and `Y` being set to 1.
* When `w` is set to 0, the third and fourth state transitions of the `B` array are executed, resulting in `z` being set to 0, and `Y` being set to 1.
* The final state transition of the `A` array is executed when `w` is set to 0 and `z` is set to 1, resulting in the last two state transitions of the `A` array being executed, resulting in `z` being set to 0, and `Y` being set to 1.

### Conclusion:

In this project, we have used `inside` and `outside` loops to reorganize the state transitions of a `mealy` FSM. This code results in fewer lines of code for the same functionality.

* [mealy.cpp](mealy.cpp)

# [Lab 4](https://github.com/RahulSharma-98/Computer-Organization-and-Architecture/tree/master/Lab%204)
# [Lab 5](https://github.com/RahulSharma-98/Computer-Organization-and-Architecture/tree/master/Lab%205)

## [Memory Management Unit (MMU)](https://github.com/RahulSharma-98/Computer-Organization-and-Architecture/tree/master/Lab%205#memory-management-unit-mmu):

In a typical system, the memory hierarchy is implemented as follows:

* The CPU accesses the memory via the memory controller. All memory operations are performed by the memory controller.
* The memory controller selects a memory module from a list of memory modules.
* The memory module transfers data to the processor via the memory interface.

### [Memory Module](https://github.com/RahulSharma-98/Computer-Organization-and-Architecture/tree/master/Lab%205#memory-module):

* The memory module is responsible for fetching and storing data in a memory location.
* The memory module is responsible for managing the following attributes of memory:
* Memory allocation: The memory module ensures that a memory location is allocated to a particular process.
* Memory protection: The memory module ensures that a process is allowed to access and modify a memory location.
* Memory paging: The memory module ensures that a process is able to access a memory location using multiple pages.

### [Memory Controller](https://github.com/RahulSharma-98/Computer-Organization-and-Architecture/tree/master/Lab%205#memory-controller):

* The memory controller is responsible for the following tasks:
* Memory access control: The memory controller ensures that only authorized processes can access a memory location.
* Memory address translation: The memory controller translates a memory address into a physical address.
* Memory page replacement: The memory controller ensures that memory pages are replaced or allocated dynamically.

### [Memory Interface](https://github.com/RahulSharma-98/Computer-Organization-and-Architecture/tree/master/Lab%205#memory-interface):

* The memory interface is responsible for transferring data between memory modules and the CPU.
* The memory interface is responsible for providing the following features:
* Memory data stalling: The memory interface ensures that the CPU does not continue execution until the memory data is ready.
* Memory address stalling: The memory interface ensures that the CPU does not continue execution until the memory address is ready.

### [Translation Lookaside Buffer (TLB)](https://github.com/RahulSharma-98/Computer-Organization-and-Architecture/tree/master/Lab%205#translation-lookaside-buffer-tlb):

* The Translation Lookaside Buffer (TLB) is a cache that stores a mapping of memory addresses to physical addresses.
* The TLB is used when performing memory address translations.
* The TLB is used to improve the performance of memory accesses by caching recently used memory addresses.
* The TLB is used to reduce the number of memory address translations required when performing a memory access.

### [Address Translation](https://github.com/RahulSharma-98/Computer-Organization-and-Architecture/tree/master/Lab%205#address-translation):

* Address Translation is the process of translating a logical address to the corresponding physical address in memory.
* Address Translation is the process of translating a virtual address to the corresponding physical address in memory.
* Address Translation is the process of translating the address of an instruction or data to the corresponding physical address in memory.

* [mmu.cpp](mmu.cpp)

## [Cache](https://github.com/RahulSharma-98/Computer-Organization-and-Architecture/tree/master/Lab%205#cache):

* Cache is a small fast memory that stores recently used data from main memory.
* Cache is used to reduce the access time to main memory.
* Cache is used to improve the performance of programs by reducing the number of memory accesses.
* Cache is used to improve the performance of programs by caching frequently accessed data.

![](images/cache.png)

### [Cache Types](https://github.com/RahulSharma-98/Computer-Organization-and-Architecture/tree/master/Lab%205#cache-types):

* [Cache](https://en.wikipedia