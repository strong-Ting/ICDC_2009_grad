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

wire CMD_RW = cmd[32]; // cmd read write
wire [17:0] CMD_F_ADDR = cmd[31:14]; //cmd flash start address
wire [6:0] CMD_M_ADDR = cmd[13:7]; //cmd mem start address
wire [6:0] CMD_LEN = cmd[6:0]; //cmd length
reg [3:0] cs,ns; //main state 
reg [3:0] cs_f,ns_f; //flash control state 
reg [127:0] dirty_bits;
reg [7:0] BLOCK_MEM [0:2047];
reg [6:0] len_counter;
//thri state gate
wire [7:0] F_IN;
reg [7:0] F_OUT;
wire F_EN;
assign F_IO = (F_EN == 1'd1) ? F_OUT : 'bz;
assign F_IN = F_IO;


parameter RST = 4'd0;
parameter IDLE = 4'd1;
parameter READ_M = 4'd2; //read memory
parameter WRITE_M = 4'd3; //    memory
parameter READ_F = 4'd4; //read flash 
parameter WRITE_F = 4'd5; // write flash
parameter ERASE = 4'd6; // erase flash block
parameter DONE = 4'd7;
parameter READ_B = 4'd8; //read flash block
parameter CHECK_F = 4'd9; //check flash dirty bit
parameter WAIT_CMD = 4'd10;
//flash state
parameter F_IDLE = 4'd0;
parameter F_CMD = 4'd1;
parameter F_ADDR = 4'd2;
parameter F_DATA_R = 4'd3; //flash read data
parameter F_DATA_W = 4'd4; //flash write data
parameter F_WAIT = 4'd5;
parameter F_DONE = 4'd6;
parameter F_ADDR_0 = 4'd7;
parameter F_ADDR_1 = 4'd8;
parameter F_ADDR_2 = 4'd9;



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
		ns = WAIT_CMD;
	end
	WAIT_CMD: begin
		if(cmd[32] == 1'd1) ns = READ_F;
		else ns = CHECK_F;
	end
	READ_F: begin
		if(cs_f == F_DONE) ns = WRITE_M;
		else ns = READ_F;
	end
	WRITE_M: begin
		ns = DONE;
	end
	CHECK_F: begin
		if(dirty_bits) ns = READ_B;
		else ns = READ_M;
	end
	READ_M: begin
		ns = WRITE_F;
	end
	WRITE_F: begin
		ns = DONE;
	end
	READ_B: begin
		ns = ERASE;
	end
	ERASE: begin
		ns = READ_M;
	end
	DONE: ns = IDLE;
	default: ns = IDLE;
	endcase
end

always@(*) begin
	case(ns)
	READ_F: begin
		case(cs_f)
		F_IDLE: begin
			ns_f = F_CMD;
		end
		F_CMD: begin
			ns_f = F_ADDR_0;
		end
		F_ADDR_0: begin
			ns_f = F_ADDR_1;
		end
		F_ADDR_1: begin
			ns_f = F_ADDR_2;
		end
		F_ADDR_2: begin
			if(F_RB == 1'd1) ns_f = F_DATA_R;
			else ns_f = F_ADDR_2;
		end
		F_DATA_R: begin
			if(len_counter == CMD_LEN) ns_f = F_DONE;
			else ns_f = F_DATA_R;
		end
		F_DONE: ns_f = F_IDLE;
		default: ns_f = F_IDLE;
		endcase
	end
	default: ns_f = F_IDLE;
	endcase
end

//output logic 

//done
wire done = (cs == IDLE) ? 1'd1 : 1'd0;
//F_CLE
wire F_CLE = (cs == RST ||  cs_f == F_CMD) ? 1'd1 : 1'd0;
//F_ALE
wire F_ALE = (cs_f == F_ADDR_0 || 
			  cs_f == F_ADDR_1 || 
			  cs_f == F_ADDR_2) ? 1'd1 : 1'd0;
//F_EN
assign F_EN = ( cs == RST ||
			cs_f == F_CMD || 
			cs_f == F_ADDR_0 ||
			cs_f == F_ADDR_1 || 
			cs_f == F_ADDR_2 ) ? 1'd1 : 1'd0; //1 == write , 0 == read
//F_WEN
wire F_WEN = (cs == RST || 
				cs_f == F_CMD ||
				cs_f == F_ADDR_0 ||
				cs_f == F_ADDR_1 || 
				cs_f == F_ADDR_2 ) ? ~clk : 1'd1;
//F_REN
wire F_REN = (cs_f == F_DATA_R) ? clk : 1'd1;
//F_OUT
always @(*) begin
	if(cs == RST) begin
		F_OUT = 8'hff;
	end
	else if(cs == READ_F) begin
		if(cs_f == F_CMD) begin
			if(CMD_F_ADDR[8] == 1'd1) F_OUT = 8'h1;
			else F_OUT = 8'h0;
		end
		else if(cs_f == F_ADDR_0) F_OUT = CMD_F_ADDR[7:0];
		else if(cs_f == F_ADDR_1) F_OUT = CMD_F_ADDR[16:9];
		else if(cs_f == F_ADDR_2) F_OUT = {7'd0,CMD_F_ADDR[17]};
		else F_OUT = 8'h0;
	end
	else F_OUT = 8'h0;
end

//len counter
always@(posedge clk or posedge rst) begin
	if(rst) len_counter <= 7'd127;
	else if(cs_f == F_DATA_R) len_counter <= len_counter + 7'd1;
end

//BLOCK_MEM
integer i;
always@(posedge clk or posedge rst) begin
	if(rst) begin
		for(i=0;i<2048;i=i+1) begin
			BLOCK_MEM[i] <= 8'd0;
		end
	end
	else if(cs_f == F_DATA_R) begin
		BLOCK_MEM[CMD_F_ADDR[11:0]+len_counter] <= F_IN;
	end
end

endmodule
