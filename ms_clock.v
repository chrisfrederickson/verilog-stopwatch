module ms_clock(clock, ms_clock);

	input clock;
	output ms_clock;
	reg ms_clock;
	reg [0:17] count;
	
	//Generate 100 Hz clock from a 50 mHz clock input
	always @ (posedge clock)
		begin
			count <= count + 1;
			if (count == 250000)
				begin
					ms_clock <= ~ms_clock;
					count <= 0;
				end
		end
endmodule