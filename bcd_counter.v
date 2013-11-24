module bcd_counter(clock, reset, bcd, next);

	input clock, reset;
	output bcd, next;
	reg [3:0] bcd;
	reg next;
	
	always @(posedge clock or posedge reset)
		begin
			if (reset == 1)
				bcd <= 0;
			else
			begin
				bcd <= bcd + 1;
				next <= 0;
				if (bcd > 9)
					begin
						bcd <= 0;
						next <= 1;
					end
			end
		end
endmodule