module stopwatch(CLOCK_50, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);

	input CLOCK_50;
	input [1:0] KEY;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	
	wire ms_clk;
	wire tenths_in, ones_in, tens_in;
	wire [3:0] hundredths_bcd, tenths_bcd, ones_bcd, tens_bcd;
	
	ms_clock ms_clock1(CLOCK_50, clk);
	
	ms_clock_switched ms_clock_switched1(clk, KEY[0], ms_clk);
	
	bcd_counter bcd_counter_hundredths(ms_clk, KEY[1], hundredths_bcd[3:0], tenths_in);
	bcd_counter bcd_counter_tenths(tenths_in, KEY[1], tenths_bcd[3:0], ones_in);
	bcd_counter bcd_counter_ones(ones_in, KEY[1], ones_bcd[3:0], tens_in);
	bcd_counter bcd_counter_tens(tens_in, KEY[1], tens_bcd[3:0], );
	
	seven_segment_decoder seven_segment_decoder_hundredths(hundredths_bcd[3:0], HEX4[0:6]);
	seven_segment_decoder seven_segment_decoder_tenths(tenths_bcd[3:0], HEX5[0:6]);
	seven_segment_decoder seven_segment_decoder_ones(ones_bcd[3:0], HEX6[0:6]);
	seven_segment_decoder seven_segment_decoder_tens(tens_bcd[3:0], HEX7[0:6]);
	
	//Turn the unused displays off
	assign HEX3[0:6] = 7'b0100100;
	assign HEX2[0:6] = 7'b0110000;
	assign HEX1[0:6] = 7'b0110001;
	assign HEX0[0:6] = 7'b0100100;
endmodule