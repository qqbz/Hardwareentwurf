transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {VHDL_microprocessor.vho}

vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Common.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/ControlUnit.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Alu.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Memory.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Decoder.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/simulation/modelsim/Test1_tb.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Rom.vhd}
vcom -93 -work work {C:/Users/Simon/Desktop/Masterstudium/HardwareEntwurf/et5000_hardwareentwurf/Pc.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /NA=VHDL_microprocessor_vhd.sdo -L altera -L altera_lnsim -L cyclonev -L gate_work -L work -voptargs="+acc"  Test_tb

add wave *
view structure
view signals
run -all
