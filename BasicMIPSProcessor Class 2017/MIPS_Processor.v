/******************************************************************
* Description
*	This is the top-level of a MIPS processor that can execute the next set of instructions:
*		add
*		addi
*		sub
*		ori
*		or
*		bne
*		beq
*		and
*		nor
* This processor is written Verilog-HDL. Also, it is synthesizable into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be execute. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	12/06/2016
******************************************************************/


module MIPS_Processor
#(
	parameter MEMORY_DEPTH = 700,
	parameter DATA_WIDTH = 32
)

(
	// Inputs
	input clk,
	input reset,
	input [7:0] PortIn,
	// Output
	output [31:0] ALUResultOut,
	output [31:0] PortOut
);
//******************************************************************/
//******************************************************************/
assign  PortOut = 0;

//******************************************************************/
//******************************************************************/
// Data types to connect modules
wire BranchNE_wire;
wire BranchEQ_wire;
wire RegDst_wire;
wire NotZeroANDBranchNE;
wire ZeroANDBranchEQ;
wire ORForBranch;
wire ALUSrc_wire;
wire RegWrite_wire;
wire Zero_wire;
wire MemWrite_wire;
wire MemRead_wire;
wire MemtoReg_wire;
wire Jump_wire;
wire JAL_wire;
wire JR_wire;

wire [2:0] ALUOp_wire;
wire [3:0] ALUOperation_wire;
wire [4:0] WriteRegister_wire;
wire [4:0] WriteRegister_wire_final;
wire [25:0] JMPAddress_wire;

wire [31:0] MUX_WriteData_wire;
wire [31:0] JumpAddress;
wire [31:0] PC_8_wire;

wire [31:0] PC_wire;
wire [31:0] Instruction_wire;
wire [31:0] ReadData1_wire;
wire [31:0] ReadData2_wire;
wire [31:0] InmmediateExtend_wire;
wire [31:0] ReadData2OrInmmediate_wire;
wire [31:0] ALUResult_wire;
wire [31:0] PC_4_wire;
wire [31:0] InmmediateExtendAnded_wire;
wire [31:0] PCtoBranch_wire;
wire [31:0] ReadData_Mem_wire;
wire [31:0] WriteData_wire;
wire [31:0] Adder_Multiplexer_wire;
wire [31:0] PC_wire_afterbranch;
wire [31:0] PC_wire_afterjmp;
wire [31:0] PC_wire_final;

integer ALUStatus;


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Control
ControlUnit
(
	.OP(Instruction_wire[31:26]),
	.RegDst(RegDst_wire),
	.BranchNE(BranchNE_wire),
	.BranchEQ(BranchEQ_wire),
	.ALUOp(ALUOp_wire),
	.ALUSrc(ALUSrc_wire),
	.RegWrite(RegWrite_wire),
	.MemWrite(MemWrite_wire),
	.MemRead(MemRead_wire),
	.MemtoReg(MemtoReg_wire),
	.Jump(Jump_wire)
	
);

PC_Register
#(
	.N(32)
)
program_counter
(
	.clk(clk),
	.reset(reset),
	.NewPC(PC_wire_final),
	.PCValue(PC_wire)
);

ProgramMemory
#(
	.MEMORY_DEPTH(MEMORY_DEPTH)
)
ROMProgramMemory
(
	.Address(PC_wire),
	.Instruction(Instruction_wire)
);

Adder32bits
PC_Puls_4
(
	.Data0(PC_wire),
	.Data1(4),
	
	.Result(PC_4_wire)
);

assign NotZeroANDBranchNE = BranchNE_wire & ~(Zero_wire);
assign ZeroANDBranchEQ = BranchEQ_wire & Zero_wire;
assign ORForBranch = NotZeroANDBranchNE | ZeroANDBranchEQ;


ShiftLeft2 
Shift_Branch_Adder
(   
	.DataInput(InmmediateExtend_wire),
	
   .DataOutput(PCtoBranch_wire)
);

Adder32bits
Branch_Adder
(
	.Data0(PC_4_wire),
	.Data1(PCtoBranch_wire),
	

	.Result(Adder_Multiplexer_wire)
);

Multiplexer2to1
#(
	.NBits(32)
)
MUX_Branch
(
	.Selector(ORForBranch),
	.MUX_Data0(PC_4_wire),
	.MUX_Data1(Adder_Multiplexer_wire),
	
	.MUX_Output(PC_wire_afterbranch)

);

//******************************************************************/
//******************************************************************/
//JUMP SECTION
assign JMPAddress_wire = {Instruction_wire[25:0]};
//assign JumpAddress = {PC_4_wire[31:28], JMPAddress_wire, 2'b00};
assign JumpAddress = {10'b0,JMPAddress_wire[19:0],2'b00};

Adder32bits
PC_Puls_8
(
	.Data0(PC_wire),
	.Data1(8),
	
	.Result(PC_8_wire)
);
assign JAL_wire = RegWrite_wire && Jump_wire;

//if we storage PC+8 in the $ra or the normal data.
Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForJAL_WriteData
(
	.Selector(JAL_wire),
	.MUX_Data0(MUX_WriteData_wire),
	.MUX_Data1(PC_4_wire), 
	.MUX_Output(WriteData_wire)

);
//where to write it.
Multiplexer2to1
#(
	.NBits(5)
)
MUX_ForJAL_WriteReg
(
	.Selector(JAL_wire),
	.MUX_Data0(WriteRegister_wire),
	.MUX_Data1(31),
	
	.MUX_Output(WriteRegister_wire_final)

);

Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForJump
(
	.Selector(Jump_wire),
	.MUX_Data0(PC_wire_afterbranch),
	.MUX_Data1(JumpAddress),
	
	.MUX_Output(PC_wire_afterjmp)

);
//Mux for the JR case.
Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForJumpRegister
(
	.Selector(JR_wire),
	.MUX_Data0(PC_wire_afterjmp),
	.MUX_Data1(ALUResult_wire),
	
	.MUX_Output(PC_wire_final)

);
//******************************************************************/
//******************************************************************/
//******************************************************************/
Multiplexer2to1
#(
	.NBits(5)
)
MUX_ForRTypeAndIType
(
	.Selector(RegDst_wire),
	.MUX_Data0(Instruction_wire[20:16]),
	.MUX_Data1(Instruction_wire[15:11]),
	
	.MUX_Output(WriteRegister_wire)

);



RegisterFile
Register_File
(
	.clk(clk),
	.reset(reset),
	.RegWrite(RegWrite_wire),
	.WriteRegister(WriteRegister_wire_final),
	.ReadRegister1(Instruction_wire[25:21]),
	.ReadRegister2(Instruction_wire[20:16]),
	.WriteData(WriteData_wire), 
	.ReadData1(ReadData1_wire),
	.ReadData2(ReadData2_wire)

);

SignExtend
SignExtendForConstants
(   
	.DataInput(Instruction_wire[15:0]),
   .SignExtendOutput(InmmediateExtend_wire)
);



Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForReadDataAndInmediate
(
	.Selector(ALUSrc_wire),
	.MUX_Data0(ReadData2_wire),
	.MUX_Data1(InmmediateExtend_wire),
	
	.MUX_Output(ReadData2OrInmmediate_wire)

);


ALUControl
ArithmeticLogicUnitControl
(
	.ALUOp(ALUOp_wire),
	.ALUFunction(Instruction_wire[5:0]),
	.ALUOperation(ALUOperation_wire)

);



ALU
ArithmeticLogicUnit 
(
	.ALUOperation(ALUOperation_wire),
	.A(ReadData1_wire),
	.B(ReadData2OrInmmediate_wire),
	.Shamt(Instruction_wire[10:6]),
	.Zero(Zero_wire),
	.Jr(JR_wire),
	.ALUResult(ALUResult_wire)
);

assign ALUResultOut = ALUResult_wire;

//
DataMemory 
#(	.DATA_WIDTH(32),
	.MEMORY_DEPTH(1024)

)
RAM
(
	.WriteData(ReadData2_wire),
	.Address(ALUResult_wire),
	.MemWrite(MemWrite_wire),
	.MemRead(MemRead_wire),
	.clk(clk),
	.ReadData(ReadData_Mem_wire)
);
Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForReadDataMemAndALU
(
	.Selector(MemtoReg_wire),
	.MUX_Data0(ALUResult_wire),
	.MUX_Data1(ReadData_Mem_wire),
	
	.MUX_Output(MUX_WriteData_wire)

);

endmodule

