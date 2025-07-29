`
if(BCD_in_x>10)  begin
            Error=1; // Error in operation
            $display("ERROR: Expected values are within 0 to 10, BCD_in=%0d", BCD_in);
            end
else begin
            if(pkg::consts[BCD_in]) begin
                // $display("pkg::consts[BCD_in] = %b", pkg::consts[BCD_in]);
                if(pkg::consts[BCD_in[2:0]] == 1) begin
                    // $display("pkg::consts[BCD_in[2:0]] = %b", pkg::consts[BCD_in[2:0]]);
                    BCD_out_x = BCD_in[2:0];
                end
                else if(pkg::consts[BCD_in[5:3]] == 1) begin
                    // $display("pkg::consts[BCD_in[5:3]] = %b", pkg::consts[BCD_in[5:3]]);
                    BCD_out_x = BCD_in[5:3];
                end
                else if(pkg::consts[BCD_in[8:6]] == 1) begin
                    // $display("pkg::consts[BCD_in[8:6]] = %b", pkg::consts[BCD_in[8:6]]);
                    BCD_out_x = BCD_in[8:6];
                end
                else if(pkg::consts[BCD_in[11:9]] == 1) begin
                    // $display("pkg::consts[BCD_in[11:9]] = %b", pkg::consts[BCD_in[11:9]]);
                    BCD_out_x = BCD_in[11:9];
                end
                else begin
                    BCD_out_x = BCD_in[14:12];
                end
            end
            else begin
                Error=1; // Error in operation
                $display("ERROR: Expected values are within 0 to 10, B