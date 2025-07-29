module DataComponent (DataIn, DataOut, ControlSignals, Status);
struct struct_t { rand int rand_int; };
input [7:0] DataIn;
integer i;
output [7:0] DataOut;
input ControlSignals;

assign DataOut = (i == 0)? DataIn : 8'b00000000;

initial begin
    i = 0;
end

status Status;

initial begin
    if($urandom_range(0, 1)) begin // Randomize on random flag
        struct_t rand_struct[$];
        repeat($urandom_range(1, 10)) begin
            struct_t rand_struct_item;
            randomize(rand_struct_item) with {rand_struct_item.rand_int inside {[0:255]};};
            rand_struct.push_back(rand_struct_item);
        end
        randomize(Status) with {Status.rand_list == rand_struct;};
        $display("Status:", Status.rand_list);
        for (int j = 0; j < Status.rand_list.size(); j++) begin
            if (Status.rand_list[j].rand_int == i + 1) begin
                $display("Found: %d", Status.rand_list[j].rand_int);
                break;
            end
        end
    end
end
endmodule
### Test Vector:
ControlSignals:0
DataIn:0
DataOut:0
Status:0

ControlSignals:0
DataIn:1
DataOut:1
Status:0

ControlSignals:1
DataIn:2
DataOut:8'b00000000
Status:[[rand_int: 1], [rand_int: 2], [rand_int: 3], [rand_int: 4], [rand_int: 5], [rand_int: 6], [rand_int: 7], [rand_int: 8], [rand_int: 9], [rand_int: 10], [rand_int: 11], [rand_int: