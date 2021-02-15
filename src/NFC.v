`timescale 1ns/100ps
module NFC(clk, rst, cmd, done, M_RW, M_A, M_D, F_IO, F_CLE, F_ALE, F_REN, F_WEN, F_RB);

  input clk;
  input rst;
  input [32:0] cmd;
  output done;
  output M_RW;
  output [6:0] M_A;
  inout  [7:0] M_D;
  inout  [7:0] F_IO;
  output F_CLE;
  output F_ALE;
  output F_REN;
  output F_WEN;
  input  F_RB;

reg [3:0] cs,ns; //main state 
reg [2:0] cs_f,ns_f; //flash control state 
reg [127:0] dirty_bits;

parameter RST = 4'd0;
parameter IDLE = 4'd1;
parameter READ_M = 4'd2; //read memory
parameter WRITE_M = 4'd3; //    memory
parameter READ_F = 4'd4; //read flash 
parameter WRITE_F = 4'd5; // write flash
parameter ERASE = 4'd6; // erase flash block
parameter DONE = 4'd7;

//flash state
parameter F_IDLE = 3'd0;
parameter F_CMD = 3'd1;
parameter F_ADDR = 3'd2;
parameter F_DATA_R = 3'd3; //flash read data
parameter F_DATA_W = 3'd4; //flash write data
parameter F_WAIT = 3'd5;
parameter F_DONE = 3'd6; 

//switch state
always@(posedge clk or posedge rst) begin
	if(rst) begin
		cs <= RST;
		cs_f <= F_IDLE; 
	end
	else begin
		cs <= ns;
		cs_f <= ns_f;
	end
end

//next state logic 
always@(*) begin
	case(cs)
	RST: ns = IDLE;
	IDLE: begin
		if(done == 1'd1) begin
			if(cmd[32] == 1'd1) ns = READ_F;
			else begin
				if(dirty_bits)
			end
		end
	end
	READ_M:
	WRITE_M:
	READ_F:
	WRITE_F:
	ERASE:
	DONE:
	default: ns = IDLE;
	endcase
end

always@(*) begin
	case(ns)
	READ_F: begin
		case(cs_f)
		
		endcase
	end
	default: ns = F_IDLE;
	endcase
end

endmodule
