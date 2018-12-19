// Top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
 output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
 output logic [9:0] LEDR;
 input logic [3:0] KEY;
 input logic [9:0] SW;


 // Logic for discount and stolen LEDs.
 assign LEDR[0] = (SW[8] | SW[9] & SW[7]); //Discounted?
 assign LEDR[1] = (~((~SW[9] & SW[7]) | SW[8] | SW[0])); //Stolen?
 
 // Logic for the display words
 
 always_comb
	case(SW[9:7])
 
	3'b000: begin
		HEX5 = 7'b1001110; //R
		HEX4 = 7'b1111001; //I
		HEX3 = 7'b1001000; //N
		HEX2 = 7'b0010000; //G
		HEX1 = 7'b1111111; //off
		HEX0 = 7'b1111111; //off
	
	end
	3'b001: begin
		HEX5 = 7'b1000110; //C
		HEX4 = 7'b0001000; //A
		HEX3 = 7'b1001000; //N
		HEX2 = 7'b0100001; //D
		HEX1 = 7'b0010001; //Y
		HEX0 = 7'b1111111; //off
		
	end 
		
	3'b011: begin
		HEX5 = 7'b0010000; //G
		HEX4 = 7'b1000111; //L
		HEX3 = 7'b1000000; //O
		HEX2 = 7'b1000001; //V
		HEX1 = 7'b0000110; //E
		HEX0 = 7'b1111111; //off
		
	end
	3'b100: begin
		HEX5 = 7'b0100001; //D
		HEX4 = 7'b1111001; //I
		HEX3 = 7'b0001000; //A
		HEX2 = 7'b1001110; //R
		HEX1 = 7'b0010001; //Y
		HEX0 = 7'b1111111; //off
	
	end
	3'b101: begin
		HEX5 = 7'b0101111; //Tail
		HEX4 = 7'b0111111; //Body1
		HEX3 = 7'b1100111; //Body2
		HEX2 = 7'b1110111; //Body3
		HEX1 = 7'b1110111; //Body4
		HEX0 = 7'b1001110; //Head
	
	end
	3'b110: begin
		HEX5 = 7'b0010010; //S
		HEX4 = 7'b1000000; //O
		HEX3 = 7'b1000110; //C
		HEX2 = 7'b0010010; //S
		HEX1 = 7'b1111111; //off
		HEX0 = 7'b1111111; //off
		
	end
	
	default: begin
		HEX5 = 7'b1111111; //All display units off
		HEX4 = 7'b1111111;
		HEX3 = 7'b1111111;
		HEX2 = 7'b1111111;
		HEX1 = 7'b1111111;
		HEX0 = 7'b1111111;
	end
	
 endcase
 endmodule
 
module DE1_SoC_testbench();
 logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
 logic [9:0] LEDR;
 logic [3:0] KEY;
 logic [9:0] SW;

 DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR,
.SW);

 // Try all combinations of inputs.
 integer i;
 initial begin
 SW[6] = 1'b0;
 SW[5] = 1'b0;
 SW[4] = 1'b0;
 SW[3] = 1'b0;
 SW[2] = 1'b0;
 SW[1] = 1'b0;
 for(i = 0; i <16; i++) begin
 {SW[9:7], SW[0]} = i; #10;
 //SW[0] = i; #10;
 end
 end
endmodule 
