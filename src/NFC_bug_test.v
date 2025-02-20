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

wire CMD_RW = cmd[32]; // cmd read write
wire [17:0] CMD_F_ADDR = cmd[31:14]; //cmd flash start address
wire [6:0] CMD_M_ADDR = cmd[13:7]; //cmd mem start address
wire [6:0] CMD_LEN = cmd[6:0] - 7'd1; //cmd length

reg [3:0] cs,ns; //main state 
reg [3:0] cs_f,ns_f; //flash control state 
reg [127:0] dirty_bits;
reg [7:0] BLOCK_MEM [0:2047];
reg [6:0] len_counter,len_counter_neg,len_counter_temp;
wire [9:0] CMD_F_ADDR_now = CMD_F_ADDR[8:0] + len_counter + 9'd1;
wire [17:0] CNT_F_ADDR = CMD_F_ADDR + len_counter_temp;
//thri state gate F_IO
wire [7:0] F_IN;
reg [7:0] F_OUT;
wire F_EN;
assign F_IO = (F_EN == 1'd1) ? F_OUT : 'bz;
assign F_IN = F_IO;
//thri state gate M_D
reg [7:0] M_OUT;
wire [7:0] M_IN;
reg M_RW;
assign M_D = (M_RW == 1'd1) ? 'bz : M_OUT;
assign M_IN = M_D; 

reg [6:0] M_A;

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
//flash state
parameter F_IDLE = 4'd0;
parameter F_CMD = 4'd1;
parameter F_ADDR = 4'd2;
parameter F_DATA_R = 4'd3; //flash read data
parameter F_DATA_W = 4'd4; //flash write data
parameter F_WAIT = 4'd5;
parameter F_DONE = 4'd6;
parameter F_ADDR_0 = 4'd13; 
parameter F_ADDR_1 = 4'd8; 
parameter F_ADDR_2 = 4'd9; 
parameter F_CMD_01 = 4'd10;
parameter F_CMD_80 = 4'd11;
parameter F_CMD_10 = 4'd12;

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
		if(cmd[32] == 1'd1) ns = READ_F;
		else ns = CHECK_F;
	end
	READ_F: begin
		if(cs_f == F_DONE) ns = WRITE_M;
		else ns = READ_F;
	end
	WRITE_M: begin
		if(len_counter == CMD_LEN) ns = DONE;
		else ns = WRITE_M;
	end
	CHECK_F: begin
		if(dirty_bits[CMD_F_ADDR[17:11]]) ns = READ_B;
		else ns = READ_M;
	end
	READ_M: begin
		if(CMD_LEN == (len_counter-7'd1)) ns = WRITE_F;
		else ns = READ_M;
	end
	WRITE_F: begin
		if(cs_f == F_DONE) ns = DONE;
		else ns = WRITE_F;
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
		F_ADDR_2: begin
			if(F_RB == 1'd1) ns_f = F_WAIT;
			else ns_f = F_DATA_R;
		end
		F_WAIT: begin
			if(F_RB == 1'd1) ns_f = F_WAIT;
			else ns_f = F_DATA_R;
		end
		F_DATA_R: begin
			if(len_counter == (CMD_LEN+7'd1)) ns_f = F_DONE;
			else if(CMD_F_ADDR_now[8:0] == 9'd0) ns_f = F_CMD;
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
			if(len_counter == (CMD_LEN+7'd0)) ns_f = F_CMD_10;
			else if(CMD_F_ADDR_now[8:0] == 9'd0) ns_f = F_CMD_10;
			else ns_f = F_DATA_W;
		end
		F_CMD_10: ns_f = F_WAIT;
		F_WAIT: begin
			if(F_RB == 1'd1) begin
				if(len_counter == (CMD_LEN+7'd0)) ns_f = F_DONE;
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
	default: ns_f = F_IDLE;
	endcase
end

//output logic 

//done
wire done = (cs == IDLE) ? 1'd1 : 1'd0;

//F_CLE
wire F_CLE = (	(cs_f == F_CMD) ||
				(cs_f == F_CMD_01 || cs_f == F_CMD_10) || 
				cs_f == F_CMD_80 ) ? 1'd1 : 1'd0;

//F_ALE
wire F_ALE = ( (cs_f == F_ADDR_0 || cs_f == F_ADDR_1) || 
			   cs_f == F_ADDR_2) ? 1'd1 : 1'd0;
//F_EN
/*
assign F_EN = ( cs == RST ||
			cs_f == F_CMD || 
			cs_f == F_CMD_80 ||
			cs_f == F_CMD_01 ||
			cs_f == F_CMD_10 ||
			cs_f == F_DATA_W ||
			cs_f == F_ADDR_0 ||
			cs_f == F_ADDR_1 || 
			cs_f == F_ADDR_2 ) ? 1'd1 : 1'd0; //1 == write , 0 == read
*/
assign F_EN =  ( (cs_f[3] == 1'd1) ||
				 (cs_f == F_CMD || cs_f == F_DATA_W) ) ? 1'd1 : 1'd0;
//F_WEN
/*
wire F_WEN = ( (cs == RST || cs_f == F_CMD) ||
				(cs_f == F_CMD_10 || cs_f == F_CMD_80) ||
				(cs_f == F_CMD_01 || cs_f == F_DATA_W) ||
				(cs_f == F_ADDR_0 || cs_f == F_ADDR_1) || 
				cs_f == F_ADDR_2 ) ? ~clk : 1'd1; */

wire F_WEN = ( (cs_f[3] == 1'd1 || cs_f == F_CMD) ||
				(cs_f == F_DATA_W) ) ? ~clk_div : 1'd1;
//F_REN
wire F_REN = (cs_f == F_DATA_R) ? clk_div : 1'd1;
//F_OUT
always @(*) begin
	if(cs == RST_F) begin
		F_OUT = 8'hff;
	end
	else if(cs_f == F_CMD_01) F_OUT = 8'h1;
	else if(cs_f == F_CMD_10) F_OUT = 8'h10;
	else if(cs_f == F_CMD_80) F_OUT = 8'h80;
	else if(cs_f == F_CMD) begin
			if(CNT_F_ADDR[8] == 1'd1) F_OUT = 8'h1;
			else F_OUT = 8'h0;
	end
	else if(cs == READ_F) begin
		if(cs_f == F_ADDR_0) F_OUT = CNT_F_ADDR[7:0];
		else if(cs_f == F_ADDR_1) F_OUT = CNT_F_ADDR[16:9];
		else if(cs_f == F_ADDR_2) F_OUT = {7'd0,CNT_F_ADDR[17]};
		else F_OUT = 8'h0;
	end
	else if(cs == WRITE_F) begin
		if(cs_f == F_ADDR_0) F_OUT = CNT_F_ADDR[7:0];
		else if(cs_f == F_ADDR_1) F_OUT = CNT_F_ADDR[16:9];
		else if(cs_f == F_ADDR_2) F_OUT = {7'd0,CNT_F_ADDR[17]};
		else if(cs_f == F_DATA_W) begin
			F_OUT = BLOCK_MEM[CMD_F_ADDR[10:0]+len_counter];
		end
		else F_OUT = 8'h0;
	end
	else F_OUT = 8'h0;
end

//len counter posedge 
always@(posedge clk or posedge rst) begin
	if(rst) len_counter <= 7'd0;
	else if(cs_f == F_ADDR_2) len_counter <= len_counter_temp;
	else if(cs == READ_M && F_RB == 1'd1) len_counter <= len_counter + 7'd1;
	else if(cs_f == F_DATA_W && ns_f == F_DATA_W && clk_div == 1'd0) len_counter <= len_counter + 7'd1;
	else if(cs_f == F_DATA_R && clk_div == 1'd0) len_counter <= len_counter + 7'd1;
	else if(cs == WRITE_M) len_counter <= len_counter + 7'd1;
	else if(cs_f == F_IDLE || cs_f == F_DONE) len_counter <= 7'd0;
end

//temp
always@(posedge clk or posedge rst) begin
	if(rst) len_counter_temp <= 7'd0;
	else if(cs == DONE) len_counter_temp <= 7'd0;
	else if(CMD_F_ADDR_now[8:0] == 9'd0 && 
			(cs_f == F_DATA_W || cs_f == F_DATA_R) ) begin
		len_counter_temp <= len_counter + 7'd1;
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
	else if(cs_f == F_DATA_R && F_RB == 1'd1) begin
		BLOCK_MEM[CMD_F_ADDR[10:0]+len_counter] <= F_IN;
	end
	else if(cs == READ_M) begin
		BLOCK_MEM[CMD_F_ADDR[10:0]+len_counter] <= M_IN;
	end
end

//dirty_bit
always@(posedge clk or posedge rst) begin
	if(rst) dirty_bits <= 128'd0;
	else if(cs == CHECK_F) dirty_bits[CMD_F_ADDR[17:11]] <= 1'd1;
end

//M_A
always@(negedge clk or posedge rst) begin
	if(rst) M_A <= 7'd0;
	else if(cs == READ_M) M_A <= len_counter + CMD_M_ADDR + 7'd1;
	else if(cs == WRITE_M) M_A <= len_counter + CMD_M_ADDR;
end

//M_OUT
always@(negedge clk or posedge rst) begin
	if(rst) M_OUT <= 8'd0;
	else M_OUT <= BLOCK_MEM[CMD_F_ADDR[10:0]+len_counter];
end

//M_RW
always@(negedge clk or posedge rst) begin
	if(rst) M_RW <= 1'd1;
	else if(cs == WRITE_M) M_RW <= 1'd0;
	else M_RW <= 1'd1;
end

endmodule
