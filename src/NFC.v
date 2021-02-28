`timescale 1ns/10ps
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

reg done;
reg [6:0] M_A;
reg F_CLE,F_ALE,F_WEN;


//thri state gate F_IO
wire [7:0] F_IN;
reg [7:0] F_OUT;
wire F_EN;
assign F_IO = (F_EN == 1'd1) ? F_OUT : 8'bz;
assign F_IN = F_IO;
//thri state gate M_D
reg [7:0] M_OUT;
wire [7:0] M_IN;
reg M_RW;
assign M_D = (M_RW == 1'd1) ? 8'bz : M_OUT;
assign M_IN = M_D; 

reg [32:0] cmd_reg;
reg [3:0] cs,ns; //main state 
reg [3:0] cs_f,ns_f; //flash control state 
reg [127:0] dirty_bits;
reg [7:0] BLOCK_MEM [0:2047];
reg [6:0] CNT_M,CNT_F,CNT_Temp;
reg [3:0] CNT_F_EX; //extend

wire CMD_RW = cmd_reg[32]; // cmd read write
wire [17:0] CMD_F_ADDR = cmd_reg[31:14]; //cmd flash start address
wire [6:0] CMD_M_ADDR = cmd_reg[13:7]; //cmd mem start address
wire [6:0] CMD_LEN = cmd_reg[6:0] - 7'd1; //cmd length
wire [9:0] CMD_F_ADDR_now = CMD_F_ADDR[8:0] + CNT_M + 9'd1;
wire [9:0] CMD_F_ADDR_now_flash = CMD_F_ADDR[8:0] + CNT_F + 9'd1;
wire [17:0] CNT_F_ADDR = CMD_F_ADDR + CNT_Temp;
wire [6:0] BLOCK_ADDR = CMD_F_ADDR[17:11];
wire [1:0] PAGE_ADDR = CMD_F_ADDR[11:10];
wire [8:0] ROW_ADDR = CMD_F_ADDR[8:0];
wire [10:0] BYTES_ADDR = CMD_F_ADDR[10:0];

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
parameter RST_F = 4'd11;
parameter WRITE_B = 4'd12; // write block
parameter READ_CMD = 4'd13;
//flash state
parameter F_IDLE = 4'd0;
parameter F_CMD = 4'd1;
parameter F_ADDR = 4'd2;
parameter F_DATA_R = 4'd3; //flash read data
parameter F_DATA_W = 4'd4; //flash write data
parameter F_WAIT = 4'd5;
parameter F_DONE = 4'd6;
parameter F_ADDR_0 = 4'd8; 
parameter F_ADDR_1 = 4'd9; 
parameter F_ADDR_2 = 4'd10; 
parameter F_CMD_01 = 4'd11;
parameter F_CMD_80 = 4'd12;
parameter F_CMD_10 = 4'd13;
parameter F_CMD_60 = 4'd14;
parameter F_CMD_D0 = 4'd15;

reg clk_div;
//clock div
always@(posedge clk or posedge rst) begin
	if(rst) clk_div <= 1'd0;
	else clk_div <= ~clk_div;
end

//switch state
always@(posedge clk or posedge rst) begin
	if(rst) cs <= RST;
	else cs <= ns;
end

always@(posedge clk_div or posedge rst) begin
	if(rst) cs_f <= F_IDLE;
	else cs_f <= ns_f;
end

//next state logic 
always@(*) begin
	case(cs)
	RST: ns = RST_F;
	RST_F: begin
		if(cs_f == F_DONE) ns = IDLE;
		else ns = RST_F;
	end
	IDLE: begin
		ns = WAIT_CMD;
	end
	WAIT_CMD: begin
		ns = READ_CMD;
	end
	READ_CMD: begin
		if(CMD_RW == 1'd1) ns = READ_F;
		else ns = CHECK_F;
	end
	READ_F: begin
		if(cs_f == F_DONE) ns = WRITE_M;
		else ns = READ_F;
	end
	WRITE_M: begin
		if(CNT_M == CMD_LEN) ns = DONE;
		else ns = WRITE_M;
	end
	CHECK_F: begin
		if(dirty_bits[BLOCK_ADDR]) ns = READ_B;
		else ns = READ_M;
	end
	READ_M: begin
		if(CMD_LEN == (CNT_M-7'd1)) begin
			if(dirty_bits[BLOCK_ADDR]) ns = WRITE_B;
			else ns = WRITE_F;
		end
		else ns = READ_M;
	end
	WRITE_F: begin
		if(cs_f == F_DONE) ns = DONE;
		else ns = WRITE_F;
	end
	READ_B: begin
		if(cs_f == F_DONE || ns_f == F_DONE) ns = ERASE;
		else ns = READ_B;
	end
	ERASE: begin
		if(cs_f == F_DONE) ns = READ_M;
		else ns = ERASE;
	end
	WRITE_B: begin
		if(cs_f == F_DONE) ns = DONE;
		else ns = WRITE_B;
	end
	DONE: ns = IDLE;
	default: ns = IDLE;
	endcase
end

always@(*) begin
	case(cs)
	RST_F: begin
		case(cs_f)
		F_IDLE: ns_f = F_CMD;
		F_CMD: ns_f = F_DONE;
		F_DONE: ns_f = F_DONE;
		default: ns_f = F_IDLE;
		endcase
	end
	READ_F: begin
		case(cs_f)
		F_IDLE: ns_f = F_CMD;
		F_CMD:  ns_f = F_ADDR_0;
		F_ADDR_0: ns_f = F_ADDR_1;
		F_ADDR_1: ns_f = F_ADDR_2;
		F_ADDR_2: ns_f = F_WAIT;
		F_WAIT: begin
			if(F_RB == 1'd1) ns_f = F_DATA_R;
			else ns_f = F_WAIT;
		end
		F_DATA_R: begin
			if(CNT_F == (CMD_LEN+7'd1)) ns_f = F_DONE;
			else if(CMD_F_ADDR_now_flash[8:0] == 9'd0) ns_f = F_CMD;
			else ns_f = F_DATA_R;
		end
		F_DONE: ns_f = F_IDLE;
		default: ns_f = F_IDLE;
		endcase
	end
	WRITE_F: begin
		case(cs_f)
		F_IDLE: begin
			if(CMD_F_ADDR[8] == 1'd1) ns_f = F_CMD_01;
			else ns_f = F_CMD_80;
		end
		F_CMD_01: begin
			ns_f = F_CMD_80;
		end
		F_CMD_80: begin
			ns_f = F_ADDR_0;
		end
		F_ADDR_0: ns_f = F_ADDR_1;
		F_ADDR_1: ns_f = F_ADDR_2;
		F_ADDR_2: ns_f = F_DATA_W;
		F_DATA_W: begin
			if(CNT_F == CMD_LEN) ns_f = F_CMD_10;
			else if(CMD_F_ADDR_now_flash[8:0] == 9'd0) ns_f = F_CMD_10;
			else ns_f = F_DATA_W;
		end
		F_CMD_10: ns_f = F_WAIT;
		F_WAIT: begin
			if(F_RB == 1'd1) begin
				if(CNT_F == CMD_LEN) ns_f = F_DONE;
				else begin
					if(CNT_F_ADDR[8] == 1'd1) ns_f = F_CMD_01;
					else ns_f = F_CMD_80;
				end
			end
			else ns_f = F_WAIT;
		end
		F_DONE: ns_f = F_IDLE;
		default: ns_f = F_IDLE;
		endcase
	end
	READ_B: begin
		case(cs_f)
		F_IDLE: ns_f = F_CMD;
		F_CMD:  ns_f = F_ADDR_0;
		F_ADDR_0: ns_f = F_ADDR_1;
		F_ADDR_1: ns_f = F_ADDR_2;
		F_ADDR_2: ns_f = F_DATA_R;//F_WAIT;
		F_WAIT: begin
			if(F_RB == 1'd1) ns_f = F_DATA_R;
			else ns_f = F_WAIT;
		end
		F_DATA_R: begin
			if({CNT_F_EX,CNT_F} == 11'd2047) ns_f = F_DONE;
			else if({CNT_F_EX[1:0],CNT_F} == 9'd511) ns_f = F_IDLE;
			else ns_f = F_DATA_R;
		end
		F_DONE: ns_f = F_IDLE;
		default: ns_f = F_IDLE;
		endcase
	end
	ERASE: begin
		case(cs_f) 
		F_IDLE: ns_f = F_CMD_60;
		F_CMD_60: ns_f = F_ADDR_0;
		F_ADDR_0: ns_f = F_ADDR_1;
		F_ADDR_1: ns_f = F_CMD_D0;
		F_CMD_D0: ns_f = F_WAIT;
		F_WAIT: begin
			if(F_RB == 1'd1) ns_f = F_DONE;
			else ns_f = F_WAIT;
		end
		F_DONE: ns_f = F_IDLE;
		default: ns_f = F_IDLE;
		endcase
	end
	WRITE_B: begin
		case(cs_f)
		F_IDLE: begin
			ns_f = F_CMD_80;
		end
		F_CMD_80: begin
			ns_f = F_ADDR_0;
		end
		F_ADDR_0: ns_f = F_ADDR_1;
		F_ADDR_1: ns_f = F_ADDR_2;
		F_ADDR_2: ns_f = F_DATA_W;
		F_DATA_W: begin
			if({CNT_F_EX[1:0],CNT_F} == 9'd511) ns_f = F_CMD_10;
			else ns_f = F_DATA_W;
		end
		F_CMD_10: ns_f = F_WAIT;
		F_WAIT: begin
			if(F_RB == 1'd1) begin
				if({CNT_F_EX,CNT_F} == 11'd2047) ns_f = F_DONE;
				else ns_f = F_IDLE;
			end
			else ns_f = F_WAIT;
		end
		F_DONE: ns_f = F_IDLE;
		default: ns_f = F_IDLE;
		endcase
	end
	default: ns_f = F_IDLE;
	endcase
end

//output logic 

//cmd_reg
always@(posedge clk or posedge rst) begin
	if(rst) cmd_reg <= 33'd0;
	else if(done != 1'd1) cmd_reg <= cmd;
end

//done
always@(posedge clk or posedge rst) begin
	if(rst) #1 done <= 1'd0;
	else if( (cs == RST_F && cs_f == F_DONE) || ns == DONE ) #1 done <= 1'd1;
	else #1 done <= 1'd0;
end

//F_CLE
always@(posedge clk_div or posedge rst) begin
	if(rst) F_CLE <= 1'd0;
	else if(	(ns_f == F_CMD || ns_f == F_CMD_D0) ||
				(ns_f == F_CMD_01 || ns_f == F_CMD_10) || 
				(ns_f == F_CMD_80 || ns_f == F_CMD_60) ) F_CLE <= 1'd1;
	else F_CLE <= 1'd0;
end
//F_ALE
always@(posedge clk_div or posedge rst) begin
	if(rst) F_ALE <= 1'd0;
	else if( (ns_f == F_ADDR_0 || ns_f == F_ADDR_1) || 
			   ns_f == F_ADDR_2) F_ALE <= 1'd1;
	else F_ALE <= 1'd0;
end

//F_EN
assign F_EN =  ( (cs_f[3] == 1'd1) ||
				 (cs_f == F_CMD || cs_f == F_DATA_W) ) ? 1'd1 : 1'd0;

//F_WEN
always@(posedge clk or posedge rst) begin
	if(rst) F_WEN <= 1'd1;
	else if( (ns_f[3] == 1'd1 || ns_f == F_CMD) ||
				(ns_f == F_DATA_W) ) F_WEN <= clk_div;
	else F_WEN <= 1'd1;
end

//F_REN
//wire F_REN = (ns_f == F_DATA_R && cs_f != F_ADDR_2) ? clk_div : 1'd1;

reg F_REN;
always@(posedge clk or posedge rst) begin
	if(rst) F_REN <= 1'd1;
	else if(ns_f == F_DATA_R && cs_f != F_ADDR_2) F_REN <= ~clk_div;
	else F_REN <= 1'd1; 
end

//F_OUT
always @(*) begin
	if(cs == RST_F) F_OUT = 8'hff;
	else if(cs_f == F_CMD_01) F_OUT = 8'h1;
	else if(cs_f == F_CMD_10) F_OUT = 8'h10;
	else if(cs_f == F_CMD_80) F_OUT = 8'h80;
	else if(cs_f == F_CMD_60) F_OUT = 8'h60;
	else if(cs_f == F_CMD_D0) F_OUT = 8'hd0;
	else if(cs_f == F_CMD) begin
		if(CNT_F_ADDR[8] == 1'd1 && cs != READ_B) F_OUT = 8'h1;
		else F_OUT = 8'h0;
	end
	else if(cs == READ_F || cs == WRITE_F) begin
		if(cs_f == F_ADDR_0) F_OUT = CNT_F_ADDR[7:0];
		else if(cs_f == F_ADDR_1) F_OUT = CNT_F_ADDR[16:9];
		else if(cs_f == F_ADDR_2) F_OUT = {7'd0,CNT_F_ADDR[17]};
		else if(cs_f == F_DATA_W) F_OUT = BLOCK_MEM[BYTES_ADDR+CNT_F];
		else F_OUT = 8'h0;
	end
	else if(cs == READ_B || cs == WRITE_B) begin
		if(cs_f == F_ADDR_0) F_OUT = 8'd0;
		else if(cs_f == F_ADDR_1) F_OUT = {CMD_F_ADDR[16:11],CNT_F_EX[3:2]};
		else if(cs_f == F_ADDR_2) F_OUT = {7'd0,CMD_F_ADDR[17]};
		else if(cs_f == F_DATA_W) F_OUT = BLOCK_MEM[{CNT_F_EX,CNT_F}];
		else F_OUT = 8'h0;
	end
	else if(cs == ERASE) begin
		if(cs_f == F_ADDR_0) F_OUT = CMD_F_ADDR[16:9];
		else if(cs_f == F_ADDR_1) F_OUT = {7'd0,CMD_F_ADDR[17]};
		else F_OUT = 8'h0;
	end
	else F_OUT = 8'h0;
end

//memory counter
always@(posedge clk or posedge rst) begin
	if(rst) CNT_M <= 7'd0;
	else if(cs == READ_M && F_RB == 1'd1) CNT_M <= CNT_M + 7'd1;
	else if(cs == WRITE_M) CNT_M <= CNT_M + 7'd1;
	else if(cs_f == F_IDLE || cs_f == F_DONE) CNT_M <= 7'd0;
end

//flash counter
always@(posedge clk_div or posedge rst) begin
	if(rst) {CNT_F_EX,CNT_F} <= 11'd0;
	else if(cs_f == F_ADDR_2 && 
		   (cs != WRITE_B && cs != READ_B)) CNT_F <= CNT_Temp;
	else if( (cs_f == F_DATA_W && ns_f == F_DATA_W) ||
	 		 (cs_f == F_DATA_R || ns_f == F_DATA_R) ) begin
		CNT_F <= CNT_F + 7'd1;
		if(CNT_F == 7'd127) CNT_F_EX <= CNT_F_EX + 4'd1; 
	end
	else if( (cs_f == F_DATA_W || ns_f == F_DATA_W) && 
			 (CNT_F == 7'd127 && CNT_F_EX != 4'd15) )begin
		CNT_F_EX <= CNT_F_EX + 4'd1; 
	end
	else if(cs_f == F_IDLE) CNT_F <= 7'd0;
	else if(cs_f == F_DONE) begin
		CNT_F <= 7'd0;
		if(cs_f == F_DONE) CNT_F_EX[3:0] <= 2'd0;
	end
end

//counter temp
always@(posedge clk or posedge rst) begin
	if(rst) CNT_Temp <= 7'd0;
	else if(cs == DONE) CNT_Temp <= 7'd0;
	else if(CMD_F_ADDR_now_flash[8:0] == 9'd0 && 
			(cs_f == F_DATA_W || cs_f == F_DATA_R) ) begin
		CNT_Temp <= CNT_F + 7'd1;
	end
end

//BLOCK_MEM
integer i;
always@(posedge clk or posedge rst) begin
	if(rst) begin
		for(i=0;i<2048;i=i+1) begin
			BLOCK_MEM[i] <= 8'd0;
		end
	end
	else if( (cs == READ_B && F_RB == 1'd1) && 
			(cs_f == F_DATA_R && ns_f == F_DATA_R) ) begin
		BLOCK_MEM[{CNT_F_EX,CNT_F}-11'd1] <= F_IN;			
	end
	else if( (cs_f == F_DATA_R && ns_f == F_DATA_R) || 
			 (cs_f == F_WAIT && ns_f == F_DATA_R) ) begin
		BLOCK_MEM[BYTES_ADDR+CNT_F] <= F_IN;
	end
	else if(cs == READ_M) begin
		BLOCK_MEM[BYTES_ADDR+CNT_M-7'd1] <= M_IN;
	end
end

//dirty_bit
always@(posedge clk or posedge rst) begin
	if(rst) dirty_bits <= 128'd0;
	else if(cs == DONE) dirty_bits[BLOCK_ADDR] <= 1'd1;
end

//M_A
always@(*) begin
	if(cs == READ_M) #1 M_A = CNT_M + CMD_M_ADDR;
	else if(cs == WRITE_M) #1 M_A = CNT_M + CMD_M_ADDR;
	else #1 M_A = 7'd0;
end

//M_OUT
always@(*) begin
	if(cs == WRITE_M) #1 M_OUT = BLOCK_MEM[BYTES_ADDR+CNT_M];
	else #1 M_OUT = 8'd0;
end

//M_RW
always@(posedge clk or posedge rst) begin
	if(rst) #1 M_RW <= 1'd1;
	else if(ns == WRITE_M) #1 M_RW <= 1'd0;
	else #1 M_RW <= 1'd1;
end

endmodule
