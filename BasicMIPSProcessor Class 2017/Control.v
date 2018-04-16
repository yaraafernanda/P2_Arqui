/******************************************************************
* Description
*	This is control unit for the MIPS processor. The control unit is 
*	in charge of generation of the control signals. Its only input 
*	corresponds to opcode from the instruction.
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/
module Control
(
	input [5:0]OP,
	
	output RegDst,
	output BranchEQ,
	output BranchNE,
	output MemRead,
	output MemtoReg,
	output MemWrite,
	output ALUSrc,
	output RegWrite,
	output [2:0]ALUOp,
	output Jump
);
localparam R_Type = 0;
localparam I_Type_ADDI = 6'h8;
localparam I_Type_ORI = 6'h0d;
localparam I_Type_ANDI = 6'h0c; 
localparam I_Type_LUI = 6'h0f; 
localparam I_Type_LW = 6'h23;
localparam I_Type_BNE = 6'h5;
localparam I_Type_BEQ = 6'h4;

reg [10:0] ControlValues;

always@(OP) begin
	casex(OP)
		R_Type:       		 ControlValues= 11'b1_001_00_00_111;
		I_Type_ADDI:       ControlValues= 11'b0_101_00_00_110;
		I_Type_ANDI:      ControlValues= 11'b0_101_00_00_011; 
		I_Type_LUI:       ControlValues= 11'b0_101_00_00_001;
		I_Type_ORI:			ControlValues= 11'b0_101_00_00_101;
		I_Type_LW:			ControlValues= 11'b0_111_00_00_010;
		I_Type_BNE:			ControlValues= 11'b0_100_00_10_100;
		I_Type_BEQ:			ControlValues= 11'b0_100_00_01_100;
		
		default:
			ControlValues= 10'b0000000000;
		endcase
end	
	
assign RegDst = ControlValues[10];
assign ALUSrc = ControlValues[9];
assign MemtoReg = ControlValues[8];
assign RegWrite = ControlValues[7];
assign MemRead = ControlValues[6];
assign MemWrite = ControlValues[5];
assign BranchNE = ControlValues[4];
assign BranchEQ = ControlValues[3];
assign ALUOp = ControlValues[2:0];	

endmodule


