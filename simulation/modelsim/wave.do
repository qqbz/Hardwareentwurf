onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_tb/S_reset
add wave -noupdate /test_tb/S_enable_controlUnit
add wave -noupdate /test_tb/S_clock
add wave -noupdate /test_tb/S_enable_others
add wave -noupdate /test_tb/S_enable_memory
add wave -noupdate /test_tb/S_instruction
add wave -noupdate /test_tb/S_decoderOut_opcode_aluIn_opcode
add wave -noupdate -radix hexadecimal /test_tb/S_decoderOut_immediate_aluIn_dataImm
add wave -noupdate -radix decimal /test_tb/S_decoderOut_reg_memoryIn_regReadSelect
add wave -noupdate /test_tb/S_decoderOut_regWrite_memoryIn_writeEnable
add wave -noupdate -radix hexadecimal /test_tb/S_memoryOut_regData_aluIn_dataReg
add wave -noupdate -radix hexadecimal /test_tb/S_aluOut_data_memoryIn_regData
add wave -noupdate /test_tb/S_aluOut_flags
add wave -noupdate -radix hexadecimal /test_tb/S_aluOut_regSelect_memoryIn_regWriteSelect
add wave -noupdate /test_tb/S_aluOut_shouldJump
add wave -noupdate /test_tb/S_memory_writeEnable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {61536 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 396
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {9049 ps}
