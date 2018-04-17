onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/clk
add wave -noupdate /MIPS_Processor_TB/reset
add wave -noupdate /MIPS_Processor_TB/PortIn
add wave -noupdate /MIPS_Processor_TB/ALUResultOut
add wave -noupdate /MIPS_Processor_TB/PortOut
add wave -noupdate /MIPS_Processor_TB/DUV/program_counter/NewPC
add wave -noupdate /MIPS_Processor_TB/DUV/program_counter/PCValue
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ROMProgramMemory/Instruction
add wave -noupdate -divider at
add wave -noupdate /MIPS_Processor_TB/DUV/Register_File/Register_at/DataInput
add wave -noupdate /MIPS_Processor_TB/DUV/Register_File/Register_at/DataOutput
add wave -noupdate -divider s0
add wave -noupdate /MIPS_Processor_TB/DUV/Register_File/Register_s0/DataInput
add wave -noupdate /MIPS_Processor_TB/DUV/Register_File/Register_s0/DataOutput
add wave -noupdate -divider t8
add wave -noupdate /MIPS_Processor_TB/DUV/Register_File/Register_t8/DataInput
add wave -noupdate /MIPS_Processor_TB/DUV/Register_File/Register_t8/DataOutput
add wave -noupdate -divider a0
add wave -noupdate /MIPS_Processor_TB/DUV/Register_File/Register_a0/DataInput
add wave -noupdate /MIPS_Processor_TB/DUV/Register_File/Register_a0/DataOutput
add wave -noupdate -divider ALU
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/ALUOperation
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/A
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/B
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/Zero
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/Jr
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/ALUResult
add wave -noupdate /MIPS_Processor_TB/DUV/ALUResult_wire
add wave -noupdate -divider RAM
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/DATA_WIDTH
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/MEMORY_DEPTH
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/WriteData
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/Address
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/MemWrite
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/MemRead
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/clk
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/ReadData
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/ram
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/ReadDataAux
add wave -noupdate -divider CONTROL
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ControlUnit/OP
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/Jump
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/RegDst
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/BranchEQ
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/BranchNE
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/MemRead
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/MemtoReg
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/MemWrite
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/ALUSrc
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/RegWrite
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/ALUOp
add wave -noupdate -divider TOWER1
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[7]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[6]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[5]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[4]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[3]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[2]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[1]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[0]}
add wave -noupdate -divider TOWER2
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[15]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[14]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[13]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[12]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[11]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[10]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[9]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[8]}
add wave -noupdate -divider TOWER3
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[23]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[22]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[21]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[20]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[19]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[18]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[17]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[16]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 112
configure wave -valuecolwidth 123
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {22 ps} {54 ps}
