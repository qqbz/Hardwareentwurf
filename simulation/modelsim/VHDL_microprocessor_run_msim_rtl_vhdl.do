transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Pc.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Memory.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Decoder.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Common.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/ControlUnit.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/VHDL_microprocessor.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Alu.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Rom.vhd}

vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Common.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/ControlUnit.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Alu.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Memory.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Decoder.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/simulation/modelsim/Test1_tb.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Rom.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Pc.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  Test_tb

add wave *
view structure
view signals
run 4000 ns
