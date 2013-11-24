module ms_clock_switched(ms_clock, control, ms_clock_switched);

	input ms_clock, control;
	output ms_clock_switched;
	reg ms_clock_switched;
	reg state; //0 paused, 1 active
	
	//Basic state machine for toggleing the clock
	always @ (negedge control)
		state <= ~state;
	
	always @ (ms_clock)
		begin
			if (state == 0)
				ms_clock_switched <= 0;
			else
				ms_clock_switched <= ms_clock;
		end
endmodule