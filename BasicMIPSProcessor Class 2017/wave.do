onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/clk
add wave -noupdate /MIPS_Processor_TB/reset
add wave -noupdate /MIPS_Processor_TB/PortIn
add wave -noupdate /MIPS_Processor_TB/ALUResultOut
add wave -noupdate /MIPS_Processor_TB/PortOut
add wave -noupdate -divider ALU
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/ALUOperation
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/A
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/B
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/Zero
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/Jr
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/ALUResult
add wave -noupdate -divider CONTROL
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/OP
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
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {33 ps}
