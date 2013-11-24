module seven_segment_decoder(bcd[3:0], HEX[0:6]);

	input [3:0] bcd;
	output [0:6] HEX;
	reg [0:6] HEX;
	
	always @ (bcd)
		case(bcd)
			4'b0000:HEX[0:6] = 7'b0000001;
			4'b0001:HEX[0:6] = 7'b1001111;
			4'b0010:HEX[0:6] = 7'b0010010;
			4'b0011:HEX[0:6] = 7'b0000110;
			4'b0100:HEX[0:6] = 7'b1001100;
			4'b0101:HEX[0:6] = 7'b0100100;
			4'b0110:HEX[0:6] = 7'b0100000;
			4'b0111:HEX[0:6] = 7'b0001111;
			4'b1000:HEX[0:6] = 7'b0000000;
			4'b1001:HEX[0:6] = 7'b0001100;
			default: HEX[0:6] = 7'b1111111;
		endcase
endmodule