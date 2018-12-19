
module lab4_seg7(HEX1, HEX0, SW, LEDR);
	output logic [6:0] HEX1, HEX0;
	output logic [9:0] LEDR;
	input logic [9:0] SW;
	
	seg7 display1(.bcd(SW[3:0]), .leds(HEX0));
	seg7 display2(.bcd(SW[7:4]), .leds(HEX1)); 

endmodule

module lab4_seg7_testbench();
 logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
 logic [9:0] LEDR;
 logic [3:0] KEY;
 logic [9:0] SW;

 lab4_seg7 dut (.HEX0, .HEX1, .LEDR, .SW);

 // Try all combinations of inputs.
 integer i;
 initial begin
 SW[9] = 1'b0;
 SW[8] = 1'b0;
 
 for(i = 0; i <256; i++) begin
 SW[7:0] = i; #10;
 
 end
 end
endmodule 
