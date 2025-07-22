module tst_4d();
 input wire [31: 0] i_address;
 input wire [31: 0] i_data;
 input wire i_read;
 input wire i_write;
 output wire [31: 0] o_data;
 parameter ADDR_WIDTH = 32;
 parameter NUM_MEMORIES = 2;
 parameter NUM_ROWS = 2;
 parameter NUM_COLS = 2;
 parameter DATA_WIDTH = 32;
 reg [DATA_WIDTH -1: 0] memory[ NUM_ROWS -1: 0] [NUM_COLS -1: 0] [NUM_MEMORIES - 1: 0];
 initial
 begin
  for ( int i = 0; i < NUM_MEMORIES; i = i + 1)
   begin
    for ( int j = 0; j < NUM_COLS; j = j + 1)
     begin
      for ( int k = 0; k < NUM_ROWS; k = k + 1)
       begin
        memory[k][j][i] = DATA_WIDTH'b1;
       end
     end
   end
  end
  always
  begin
   if( i_read)
    begin
     o_data = memory[i_address[ADDR_WIDTH - 1: ADDR_WIDTH - ((NUM_COLS * NUM_MEMORIES) + 1)]]
              [i_address[ADDR_WIDTH - 2 - (NUM_COLS * NUM_MEMORIES): ADDR_WIDTH - (NUM_COLS * NUM_MEMORIES)]]
              [i_address[ADDR_WIDTH - 3 - (NUM_COLS * NUM_MEMORIES): ADDR_WIDTH - 2 * (NUM_COLS * NUM_MEMORIES)]];
    end
   else if ( i_write)
    begin
     memory[i_address[ADDR_WIDTH - 1: ADDR_WIDTH - ((NUM_COLS * NUM_MEMORIES) + 1)]]
           [i_address[ADDR_WIDTH - 2 - (NUM_COLS * NUM_MEMORIES): ADDR_WIDTH - (NUM_COLS * NUM_MEMORIES)]]
           [i_address[ADDR_WIDTH - 3 - (NUM_COLS * NUM_MEMORIES): ADDR_WIDTH - 2 * (NUM_COLS * NUM_MEMORIES)]] = i_data;
    end
   end
  end
 endmodule

### Resulting Verilog Code:
module tst_4d();
 input wire [31: 0] i_address;
 input wire [31: 0] i_data;
 input wire i_read;
 input wire i_write;
 output wire [31: 0] o_data;
 parameter ADDR_WIDTH = 32;
 parameter NUM_MEMORIES = 2;
 parameter NUM_ROWS = 2;
 parameter NUM_COLS = 2;
 parameter DATA_WIDTH = 32;
 reg [DATA_WIDTH -1: 0] memory[ NUM_ROWS -1: 0] [NUM_COLS -1: 0] [NUM_MEMORIES - 1: 0];
 initial
 begin
  for ( int i = 0; i < NUM_MEMORIES; i = i + 1)
   begin
    for ( int j = 0; j < NUM_COLS; j = j + 1)
     begin
      for ( int k = 0; k < NUM_ROWS; k = k + 1)
       begin
        memory[k][j][i] = DATA_WIDTH'b1;
       end
     end
   end
  end
  always
  begin
   if( i_read)
    begin
     o_data = memory[i_address[ADDR_WIDTH - 1: ADDR_WIDTH - ((NUM_COLS * NUM_MEMORIES) + 1)]]
              [i_address[ADDR_WIDTH - 2 - (NUM_COLS * NUM_MEMORIES): ADDR_WIDTH - (NUM_COLS * NUM_MEMORIES)]]
              [i_address[ADDR_WIDTH - 3 - (NUM_COLS * NUM_MEMORIES): ADDR_WIDTH - 2 * (NUM_COLS * NUM_MEMORIES)]];
    end
   else if ( i_write)
    begin
     memory[i_address[ADDR_WIDTH - 1: ADDR_WIDTH - ((NUM_COLS * NUM_MEMORIES) + 1)]]
           [i_address[ADDR_WIDTH - 2 - (NUM_COLS * NUM_MEMORIES): ADDR_WIDTH - (NUM_COLS * NUM_MEMORIES)]]
           [i_address[ADDR_WIDTH - 3 - (NUM_COLS * NUM_MEMORIES): ADDR_WIDTH - 2 * (NUM_COL