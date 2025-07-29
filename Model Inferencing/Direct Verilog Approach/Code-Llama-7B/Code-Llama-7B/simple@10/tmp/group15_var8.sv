always @(*) begin
				// default assignment to all outputs
				mux1_out = 0;
				mux2_out = 0;
				ledr = 0;
				// logic for mux1_out
				if(sel1 == 2'b00) begin // 00 : sw_sel
					mux1_out = sw;
				end
				else if(sel1 == 2'b01) begin // 01 : led_sel
					mux1_out = led;
				end
				// logic for mux2_out
				if(sel2 == 2'b00) begin // 00 : led_sel
					mux2_out = led;
				end
				else if(sel2 == 2'b01) begin // 01 : sw_sel
					mux2_out = sw;
				end
				else if(sel2 == 2'b10) begin // 10 : reg_out_sel
					mux2_out = reg_out;
				end
				else if(sel2 == 2'b11) begin // 11 : reg_in_sel
					m