-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"

-- DATE "07/30/2021 14:34:02"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	VHDL_microprocessor IS
    PORT (
	I_processor_clock : IN std_logic;
	I_processor_reset : IN std_logic;
	I_processor_enable : IN std_logic;
	O_pipeline_stage : BUFFER std_logic_vector(5 DOWNTO 0);
	O_pc_programCounter : BUFFER std_logic_vector(7 DOWNTO 0);
	O_rom_instruction : BUFFER std_logic_vector(15 DOWNTO 0);
	O_decoder_opcode : BUFFER std_logic_vector(7 DOWNTO 0);
	O_decoder_dataImmediate : BUFFER std_logic_vector(7 DOWNTO 0);
	O_decoder_regAddress : BUFFER std_logic_vector(7 DOWNTO 0);
	O_memory_regReadData : BUFFER std_logic_vector(7 DOWNTO 0);
	O_alu_data : BUFFER std_logic_vector(7 DOWNTO 0);
	O_alu_flags_debug : BUFFER std_logic_vector(2 DOWNTO 0);
	O_alu_regSelect : BUFFER std_logic_vector(7 DOWNTO 0);
	O_alu_regWrite : BUFFER std_logic;
	O_alu_shouldJump : BUFFER std_logic;
	O_memory_writeEnable_calculated : BUFFER std_logic
	);
END VHDL_microprocessor;

-- Design Ports Information
-- O_pipeline_stage[0]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pipeline_stage[1]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pipeline_stage[2]	=>  Location: PIN_V20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pipeline_stage[3]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pipeline_stage[4]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pipeline_stage[5]	=>  Location: PIN_H11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pc_programCounter[0]	=>  Location: PIN_Y20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pc_programCounter[1]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pc_programCounter[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pc_programCounter[3]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pc_programCounter[4]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pc_programCounter[5]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pc_programCounter[6]	=>  Location: PIN_U17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_pc_programCounter[7]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[0]	=>  Location: PIN_T19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[1]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[2]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[3]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[4]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[5]	=>  Location: PIN_T20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[6]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[7]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[8]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[9]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[10]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[11]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[12]	=>  Location: PIN_V19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[13]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[14]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_rom_instruction[15]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_opcode[0]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_opcode[1]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_opcode[2]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_opcode[3]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_opcode[4]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_opcode[5]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_opcode[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_opcode[7]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_dataImmediate[0]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_dataImmediate[1]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_dataImmediate[2]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_dataImmediate[3]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_dataImmediate[4]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_dataImmediate[5]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_dataImmediate[6]	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_dataImmediate[7]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_regAddress[0]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_regAddress[1]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_regAddress[2]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_regAddress[3]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_regAddress[4]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_regAddress[5]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_regAddress[6]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_decoder_regAddress[7]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_memory_regReadData[0]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_memory_regReadData[1]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_memory_regReadData[2]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_memory_regReadData[3]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_memory_regReadData[4]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_memory_regReadData[5]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_memory_regReadData[6]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_memory_regReadData[7]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_data[0]	=>  Location: PIN_J11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_data[1]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_data[2]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_data[3]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_data[4]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_data[5]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_data[6]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_data[7]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_flags_debug[0]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_flags_debug[1]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_flags_debug[2]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_regSelect[0]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_regSelect[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_regSelect[2]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_regSelect[3]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_regSelect[4]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_regSelect[5]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_regSelect[6]	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_regSelect[7]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_regWrite	=>  Location: PIN_A22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_alu_shouldJump	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_memory_writeEnable_calculated	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I_processor_clock	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I_processor_reset	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I_processor_enable	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF VHDL_microprocessor IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_I_processor_clock : std_logic;
SIGNAL ww_I_processor_reset : std_logic;
SIGNAL ww_I_processor_enable : std_logic;
SIGNAL ww_O_pipeline_stage : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_O_pc_programCounter : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_O_rom_instruction : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_O_decoder_opcode : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_O_decoder_dataImmediate : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_O_decoder_regAddress : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_O_memory_regReadData : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_O_alu_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_O_alu_flags_debug : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_O_alu_regSelect : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_O_alu_regWrite : std_logic;
SIGNAL ww_O_alu_shouldJump : std_logic;
SIGNAL ww_O_memory_writeEnable_calculated : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \I_processor_clock~input_o\ : std_logic;
SIGNAL \I_processor_clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \I_processor_reset~input_o\ : std_logic;
SIGNAL \I_processor_enable~input_o\ : std_logic;
SIGNAL \DUT_controlUnit|S_state.s2~q\ : std_logic;
SIGNAL \DUT_controlUnit|S_state.s3~q\ : std_logic;
SIGNAL \DUT_controlUnit|S_state.s0~feeder_combout\ : std_logic;
SIGNAL \DUT_controlUnit|S_state.s0~q\ : std_logic;
SIGNAL \DUT_controlUnit|WideOr0~combout\ : std_logic;
SIGNAL \DUT_controlUnit|S_state.s1~q\ : std_logic;
SIGNAL \DUT_pc|Add0~1_sumout\ : std_logic;
SIGNAL \DUT_pc|Add0~2\ : std_logic;
SIGNAL \DUT_pc|Add0~5_sumout\ : std_logic;
SIGNAL \DUT_pc|Add0~6\ : std_logic;
SIGNAL \DUT_pc|Add0~9_sumout\ : std_logic;
SIGNAL \DUT_pc|Add0~10\ : std_logic;
SIGNAL \DUT_pc|Add0~13_sumout\ : std_logic;
SIGNAL \DUT_pc|Add0~14\ : std_logic;
SIGNAL \DUT_pc|Add0~17_sumout\ : std_logic;
SIGNAL \DUT_pc|Add0~18\ : std_logic;
SIGNAL \DUT_pc|Add0~21_sumout\ : std_logic;
SIGNAL \DUT_pc|Add0~22\ : std_logic;
SIGNAL \DUT_pc|Add0~25_sumout\ : std_logic;
SIGNAL \DUT_pc|Add0~26\ : std_logic;
SIGNAL \DUT_pc|Add0~29_sumout\ : std_logic;
SIGNAL \DUT_pc|O_programCounter[6]~DUPLICATE_q\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a8\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a9\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a10\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a11\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a12\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a13\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a14\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a15\ : std_logic;
SIGNAL \DUT_decoder|O_opcode[2]~feeder_combout\ : std_logic;
SIGNAL \DUT_decoder|O_opcode[3]~feeder_combout\ : std_logic;
SIGNAL \DUT_decoder|O_opcode[4]~feeder_combout\ : std_logic;
SIGNAL \DUT_decoder|O_opcode[5]~feeder_combout\ : std_logic;
SIGNAL \DUT_decoder|O_opcode[6]~feeder_combout\ : std_logic;
SIGNAL \DUT_decoder|O_regAddress[1]~feeder_combout\ : std_logic;
SIGNAL \DUT_decoder|O_regAddress[4]~feeder_combout\ : std_logic;
SIGNAL \DUT_decoder|O_regAddress[5]~feeder_combout\ : std_logic;
SIGNAL \DUT_decoder|O_regAddress[6]~feeder_combout\ : std_logic;
SIGNAL \DUT_decoder|O_regAddress[7]~feeder_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \DUT_decoder|O_regAddress[3]~DUPLICATE_q\ : std_logic;
SIGNAL \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \DUT_pc|O_programCounter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \DUT_decoder|O_opcode\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \DUT_decoder|O_regAddress\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_I_processor_reset~input_o\ : std_logic;
SIGNAL \DUT_controlUnit|ALT_INV_S_state.s0~q\ : std_logic;
SIGNAL \DUT_controlUnit|ALT_INV_S_state.s3~q\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a1\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a4\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a5\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a6\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a7\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a10\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a11\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a12\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a13\ : std_logic;
SIGNAL \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a14\ : std_logic;
SIGNAL \DUT_pc|ALT_INV_O_programCounter\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_I_processor_clock <= I_processor_clock;
ww_I_processor_reset <= I_processor_reset;
ww_I_processor_enable <= I_processor_enable;
O_pipeline_stage <= ww_O_pipeline_stage;
O_pc_programCounter <= ww_O_pc_programCounter;
O_rom_instruction <= ww_O_rom_instruction;
O_decoder_opcode <= ww_O_decoder_opcode;
O_decoder_dataImmediate <= ww_O_decoder_dataImmediate;
O_decoder_regAddress <= ww_O_decoder_regAddress;
O_memory_regReadData <= ww_O_memory_regReadData;
O_alu_data <= ww_O_alu_data;
O_alu_flags_debug <= ww_O_alu_flags_debug;
O_alu_regSelect <= ww_O_alu_regSelect;
O_alu_regWrite <= ww_O_alu_regWrite;
O_alu_shouldJump <= ww_O_alu_shouldJump;
O_memory_writeEnable_calculated <= ww_O_memory_writeEnable_calculated;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\DUT_pc|O_programCounter\(7) & \DUT_pc|O_programCounter[6]~DUPLICATE_q\ & \DUT_pc|O_programCounter\(5) & \DUT_pc|O_programCounter\(4) & \DUT_pc|O_programCounter\(3) & 
\DUT_pc|O_programCounter\(2) & \DUT_pc|O_programCounter\(1) & \DUT_pc|O_programCounter\(0));

\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a1\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a2\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a3\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a4\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a5\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a6\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a7\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a8\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a9\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a10\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(10);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a11\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(11);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a12\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(12);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a13\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(13);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a14\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(14);
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a15\ <= \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(15);

\DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\DUT_decoder|O_regAddress\(7) & \DUT_decoder|O_regAddress\(6) & \DUT_decoder|O_regAddress\(5) & \DUT_decoder|O_regAddress\(4) & \DUT_decoder|O_regAddress[3]~DUPLICATE_q\ & 
\DUT_decoder|O_regAddress\(2) & \DUT_decoder|O_regAddress\(1) & \DUT_decoder|O_regAddress\(0));

\DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a1\ <= \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a2\ <= \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a3\ <= \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a4\ <= \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a5\ <= \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a6\ <= \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a7\ <= \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\ALT_INV_I_processor_reset~input_o\ <= NOT \I_processor_reset~input_o\;
\DUT_controlUnit|ALT_INV_S_state.s0~q\ <= NOT \DUT_controlUnit|S_state.s0~q\;
\DUT_controlUnit|ALT_INV_S_state.s3~q\ <= NOT \DUT_controlUnit|S_state.s3~q\;
\DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a1\ <= NOT \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a1\;
\DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a4\ <= NOT \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a4\;
\DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a5\ <= NOT \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a5\;
\DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a6\ <= NOT \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a6\;
\DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a7\ <= NOT \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a7\;
\DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a10\ <= NOT \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a10\;
\DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a11\ <= NOT \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a11\;
\DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a12\ <= NOT \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a12\;
\DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a13\ <= NOT \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a13\;
\DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a14\ <= NOT \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a14\;
\DUT_pc|ALT_INV_O_programCounter\(7) <= NOT \DUT_pc|O_programCounter\(7);
\DUT_pc|ALT_INV_O_programCounter\(6) <= NOT \DUT_pc|O_programCounter\(6);
\DUT_pc|ALT_INV_O_programCounter\(5) <= NOT \DUT_pc|O_programCounter\(5);
\DUT_pc|ALT_INV_O_programCounter\(4) <= NOT \DUT_pc|O_programCounter\(4);
\DUT_pc|ALT_INV_O_programCounter\(3) <= NOT \DUT_pc|O_programCounter\(3);
\DUT_pc|ALT_INV_O_programCounter\(2) <= NOT \DUT_pc|O_programCounter\(2);
\DUT_pc|ALT_INV_O_programCounter\(1) <= NOT \DUT_pc|O_programCounter\(1);
\DUT_pc|ALT_INV_O_programCounter\(0) <= NOT \DUT_pc|O_programCounter\(0);

-- Location: IOOBUF_X62_Y0_N53
\O_pipeline_stage[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_controlUnit|S_state.s1~q\,
	devoe => ww_devoe,
	o => ww_O_pipeline_stage(0));

-- Location: IOOBUF_X62_Y0_N36
\O_pipeline_stage[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_controlUnit|S_state.s2~q\,
	devoe => ww_devoe,
	o => ww_O_pipeline_stage(1));

-- Location: IOOBUF_X62_Y0_N19
\O_pipeline_stage[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_controlUnit|S_state.s3~q\,
	devoe => ww_devoe,
	o => ww_O_pipeline_stage(2));

-- Location: IOOBUF_X32_Y81_N53
\O_pipeline_stage[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_pipeline_stage(3));

-- Location: IOOBUF_X26_Y0_N59
\O_pipeline_stage[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_pipeline_stage(4));

-- Location: IOOBUF_X52_Y81_N2
\O_pipeline_stage[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_pipeline_stage(5));

-- Location: IOOBUF_X66_Y0_N59
\O_pc_programCounter[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_pc|O_programCounter\(0),
	devoe => ww_devoe,
	o => ww_O_pc_programCounter(0));

-- Location: IOOBUF_X70_Y0_N53
\O_pc_programCounter[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_pc|O_programCounter\(1),
	devoe => ww_devoe,
	o => ww_O_pc_programCounter(1));

-- Location: IOOBUF_X68_Y0_N36
\O_pc_programCounter[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_pc|O_programCounter\(2),
	devoe => ww_devoe,
	o => ww_O_pc_programCounter(2));

-- Location: IOOBUF_X72_Y0_N53
\O_pc_programCounter[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_pc|O_programCounter\(3),
	devoe => ww_devoe,
	o => ww_O_pc_programCounter(3));

-- Location: IOOBUF_X72_Y0_N19
\O_pc_programCounter[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_pc|O_programCounter\(4),
	devoe => ww_devoe,
	o => ww_O_pc_programCounter(4));

-- Location: IOOBUF_X68_Y0_N2
\O_pc_programCounter[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_pc|O_programCounter\(5),
	devoe => ww_devoe,
	o => ww_O_pc_programCounter(5));

-- Location: IOOBUF_X72_Y0_N2
\O_pc_programCounter[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_pc|O_programCounter\(6),
	devoe => ww_devoe,
	o => ww_O_pc_programCounter(6));

-- Location: IOOBUF_X68_Y0_N53
\O_pc_programCounter[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_pc|O_programCounter\(7),
	devoe => ww_devoe,
	o => ww_O_pc_programCounter(7));

-- Location: IOOBUF_X89_Y4_N79
\O_rom_instruction[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0~portadataout\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(0));

-- Location: IOOBUF_X89_Y8_N39
\O_rom_instruction[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a1\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(1));

-- Location: IOOBUF_X68_Y0_N19
\O_rom_instruction[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a2\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(2));

-- Location: IOOBUF_X89_Y6_N5
\O_rom_instruction[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a3\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(3));

-- Location: IOOBUF_X89_Y6_N22
\O_rom_instruction[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a4\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(4));

-- Location: IOOBUF_X89_Y4_N96
\O_rom_instruction[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a5\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(5));

-- Location: IOOBUF_X72_Y0_N36
\O_rom_instruction[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a6\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(6));

-- Location: IOOBUF_X89_Y6_N39
\O_rom_instruction[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a7\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(7));

-- Location: IOOBUF_X70_Y0_N2
\O_rom_instruction[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a8\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(8));

-- Location: IOOBUF_X89_Y4_N62
\O_rom_instruction[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a9\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(9));

-- Location: IOOBUF_X60_Y0_N2
\O_rom_instruction[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a10\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(10));

-- Location: IOOBUF_X89_Y6_N56
\O_rom_instruction[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a11\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(11));

-- Location: IOOBUF_X70_Y0_N19
\O_rom_instruction[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a12\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(12));

-- Location: IOOBUF_X70_Y0_N36
\O_rom_instruction[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a13\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(13));

-- Location: IOOBUF_X89_Y8_N5
\O_rom_instruction[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a14\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(14));

-- Location: IOOBUF_X89_Y4_N45
\O_rom_instruction[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a15\,
	devoe => ww_devoe,
	o => ww_O_rom_instruction(15));

-- Location: IOOBUF_X66_Y0_N93
\O_decoder_opcode[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_opcode\(0),
	devoe => ww_devoe,
	o => ww_O_decoder_opcode(0));

-- Location: IOOBUF_X64_Y0_N2
\O_decoder_opcode[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_opcode\(1),
	devoe => ww_devoe,
	o => ww_O_decoder_opcode(1));

-- Location: IOOBUF_X66_Y0_N76
\O_decoder_opcode[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_opcode\(2),
	devoe => ww_devoe,
	o => ww_O_decoder_opcode(2));

-- Location: IOOBUF_X64_Y0_N19
\O_decoder_opcode[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_opcode\(3),
	devoe => ww_devoe,
	o => ww_O_decoder_opcode(3));

-- Location: IOOBUF_X64_Y0_N36
\O_decoder_opcode[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_opcode\(4),
	devoe => ww_devoe,
	o => ww_O_decoder_opcode(4));

-- Location: IOOBUF_X64_Y0_N53
\O_decoder_opcode[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_opcode\(5),
	devoe => ww_devoe,
	o => ww_O_decoder_opcode(5));

-- Location: IOOBUF_X66_Y0_N42
\O_decoder_opcode[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_opcode\(6),
	devoe => ww_devoe,
	o => ww_O_decoder_opcode(6));

-- Location: IOOBUF_X60_Y0_N36
\O_decoder_opcode[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_opcode\(7),
	devoe => ww_devoe,
	o => ww_O_decoder_opcode(7));

-- Location: IOOBUF_X56_Y0_N36
\O_decoder_dataImmediate[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(0),
	devoe => ww_devoe,
	o => ww_O_decoder_dataImmediate(0));

-- Location: IOOBUF_X54_Y0_N19
\O_decoder_dataImmediate[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(1),
	devoe => ww_devoe,
	o => ww_O_decoder_dataImmediate(1));

-- Location: IOOBUF_X52_Y0_N19
\O_decoder_dataImmediate[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(2),
	devoe => ww_devoe,
	o => ww_O_decoder_dataImmediate(2));

-- Location: IOOBUF_X89_Y8_N56
\O_decoder_dataImmediate[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(3),
	devoe => ww_devoe,
	o => ww_O_decoder_dataImmediate(3));

-- Location: IOOBUF_X60_Y0_N19
\O_decoder_dataImmediate[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(4),
	devoe => ww_devoe,
	o => ww_O_decoder_dataImmediate(4));

-- Location: IOOBUF_X50_Y0_N42
\O_decoder_dataImmediate[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(5),
	devoe => ww_devoe,
	o => ww_O_decoder_dataImmediate(5));

-- Location: IOOBUF_X89_Y9_N39
\O_decoder_dataImmediate[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(6),
	devoe => ww_devoe,
	o => ww_O_decoder_dataImmediate(6));

-- Location: IOOBUF_X58_Y0_N42
\O_decoder_dataImmediate[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(7),
	devoe => ww_devoe,
	o => ww_O_decoder_dataImmediate(7));

-- Location: IOOBUF_X56_Y0_N19
\O_decoder_regAddress[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(0),
	devoe => ww_devoe,
	o => ww_O_decoder_regAddress(0));

-- Location: IOOBUF_X54_Y0_N36
\O_decoder_regAddress[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(1),
	devoe => ww_devoe,
	o => ww_O_decoder_regAddress(1));

-- Location: IOOBUF_X52_Y0_N2
\O_decoder_regAddress[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(2),
	devoe => ww_devoe,
	o => ww_O_decoder_regAddress(2));

-- Location: IOOBUF_X89_Y8_N22
\O_decoder_regAddress[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(3),
	devoe => ww_devoe,
	o => ww_O_decoder_regAddress(3));

-- Location: IOOBUF_X60_Y0_N53
\O_decoder_regAddress[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(4),
	devoe => ww_devoe,
	o => ww_O_decoder_regAddress(4));

-- Location: IOOBUF_X38_Y0_N2
\O_decoder_regAddress[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(5),
	devoe => ww_devoe,
	o => ww_O_decoder_regAddress(5));

-- Location: IOOBUF_X89_Y9_N5
\O_decoder_regAddress[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(6),
	devoe => ww_devoe,
	o => ww_O_decoder_regAddress(6));

-- Location: IOOBUF_X58_Y0_N76
\O_decoder_regAddress[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_decoder|O_regAddress\(7),
	devoe => ww_devoe,
	o => ww_O_decoder_regAddress(7));

-- Location: IOOBUF_X56_Y0_N2
\O_memory_regReadData[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	devoe => ww_devoe,
	o => ww_O_memory_regReadData(0));

-- Location: IOOBUF_X58_Y0_N59
\O_memory_regReadData[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a1\,
	devoe => ww_devoe,
	o => ww_O_memory_regReadData(1));

-- Location: IOOBUF_X56_Y0_N53
\O_memory_regReadData[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a2\,
	devoe => ww_devoe,
	o => ww_O_memory_regReadData(2));

-- Location: IOOBUF_X54_Y0_N53
\O_memory_regReadData[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a3\,
	devoe => ww_devoe,
	o => ww_O_memory_regReadData(3));

-- Location: IOOBUF_X52_Y0_N36
\O_memory_regReadData[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a4\,
	devoe => ww_devoe,
	o => ww_O_memory_regReadData(4));

-- Location: IOOBUF_X52_Y0_N53
\O_memory_regReadData[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a5\,
	devoe => ww_devoe,
	o => ww_O_memory_regReadData(5));

-- Location: IOOBUF_X50_Y0_N59
\O_memory_regReadData[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a6\,
	devoe => ww_devoe,
	o => ww_O_memory_regReadData(6));

-- Location: IOOBUF_X58_Y0_N93
\O_memory_regReadData[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a7\,
	devoe => ww_devoe,
	o => ww_O_memory_regReadData(7));

-- Location: IOOBUF_X58_Y81_N76
\O_alu_data[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_data(0));

-- Location: IOOBUF_X6_Y0_N53
\O_alu_data[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_data(1));

-- Location: IOOBUF_X60_Y81_N19
\O_alu_data[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_data(2));

-- Location: IOOBUF_X70_Y81_N53
\O_alu_data[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_data(3));

-- Location: IOOBUF_X40_Y0_N36
\O_alu_data[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_data(4));

-- Location: IOOBUF_X60_Y81_N36
\O_alu_data[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_data(5));

-- Location: IOOBUF_X28_Y81_N2
\O_alu_data[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_data(6));

-- Location: IOOBUF_X36_Y81_N36
\O_alu_data[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_data(7));

-- Location: IOOBUF_X40_Y81_N36
\O_alu_flags_debug[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_flags_debug(0));

-- Location: IOOBUF_X32_Y0_N53
\O_alu_flags_debug[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_flags_debug(1));

-- Location: IOOBUF_X72_Y81_N53
\O_alu_flags_debug[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_flags_debug(2));

-- Location: IOOBUF_X28_Y81_N19
\O_alu_regSelect[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_regSelect(0));

-- Location: IOOBUF_X82_Y81_N93
\O_alu_regSelect[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_regSelect(1));

-- Location: IOOBUF_X62_Y81_N36
\O_alu_regSelect[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_regSelect(2));

-- Location: IOOBUF_X76_Y81_N2
\O_alu_regSelect[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_regSelect(3));

-- Location: IOOBUF_X34_Y81_N59
\O_alu_regSelect[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_regSelect(4));

-- Location: IOOBUF_X32_Y81_N19
\O_alu_regSelect[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_regSelect(5));

-- Location: IOOBUF_X40_Y81_N53
\O_alu_regSelect[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_regSelect(6));

-- Location: IOOBUF_X32_Y81_N36
\O_alu_regSelect[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_regSelect(7));

-- Location: IOOBUF_X78_Y81_N53
\O_alu_regWrite~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_regWrite);

-- Location: IOOBUF_X50_Y0_N76
\O_alu_shouldJump~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_alu_shouldJump);

-- Location: IOOBUF_X78_Y81_N2
\O_memory_writeEnable_calculated~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_O_memory_writeEnable_calculated);

-- Location: IOIBUF_X89_Y35_N61
\I_processor_clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I_processor_clock,
	o => \I_processor_clock~input_o\);

-- Location: CLKCTRL_G10
\I_processor_clock~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \I_processor_clock~input_o\,
	outclk => \I_processor_clock~inputCLKENA0_outclk\);

-- Location: IOIBUF_X62_Y0_N1
\I_processor_reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I_processor_reset,
	o => \I_processor_reset~input_o\);

-- Location: IOIBUF_X54_Y0_N1
\I_processor_enable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I_processor_enable,
	o => \I_processor_enable~input_o\);

-- Location: FF_X72_Y2_N47
\DUT_controlUnit|S_state.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	asdata => \DUT_controlUnit|S_state.s1~q\,
	clrn => \ALT_INV_I_processor_reset~input_o\,
	sload => VCC,
	ena => \I_processor_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_controlUnit|S_state.s2~q\);

-- Location: FF_X72_Y2_N44
\DUT_controlUnit|S_state.s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	asdata => \DUT_controlUnit|S_state.s2~q\,
	clrn => \ALT_INV_I_processor_reset~input_o\,
	sload => VCC,
	ena => \I_processor_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_controlUnit|S_state.s3~q\);

-- Location: MLABCELL_X72_Y2_N24
\DUT_controlUnit|S_state.s0~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_controlUnit|S_state.s0~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \DUT_controlUnit|S_state.s0~feeder_combout\);

-- Location: FF_X72_Y2_N25
\DUT_controlUnit|S_state.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_controlUnit|S_state.s0~feeder_combout\,
	clrn => \ALT_INV_I_processor_reset~input_o\,
	ena => \I_processor_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_controlUnit|S_state.s0~q\);

-- Location: MLABCELL_X72_Y2_N27
\DUT_controlUnit|WideOr0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_controlUnit|WideOr0~combout\ = ( \DUT_controlUnit|S_state.s0~q\ & ( \DUT_controlUnit|S_state.s3~q\ ) ) # ( !\DUT_controlUnit|S_state.s0~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \DUT_controlUnit|ALT_INV_S_state.s3~q\,
	dataf => \DUT_controlUnit|ALT_INV_S_state.s0~q\,
	combout => \DUT_controlUnit|WideOr0~combout\);

-- Location: FF_X72_Y2_N29
\DUT_controlUnit|S_state.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_controlUnit|WideOr0~combout\,
	clrn => \ALT_INV_I_processor_reset~input_o\,
	ena => \I_processor_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_controlUnit|S_state.s1~q\);

-- Location: MLABCELL_X72_Y2_N0
\DUT_pc|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_pc|Add0~1_sumout\ = SUM(( \DUT_pc|O_programCounter\(0) ) + ( VCC ) + ( !VCC ))
-- \DUT_pc|Add0~2\ = CARRY(( \DUT_pc|O_programCounter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \DUT_pc|ALT_INV_O_programCounter\(0),
	cin => GND,
	sumout => \DUT_pc|Add0~1_sumout\,
	cout => \DUT_pc|Add0~2\);

-- Location: FF_X72_Y2_N2
\DUT_pc|O_programCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_pc|Add0~1_sumout\,
	ena => \DUT_controlUnit|S_state.s1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_pc|O_programCounter\(0));

-- Location: MLABCELL_X72_Y2_N3
\DUT_pc|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_pc|Add0~5_sumout\ = SUM(( \DUT_pc|O_programCounter\(1) ) + ( GND ) + ( \DUT_pc|Add0~2\ ))
-- \DUT_pc|Add0~6\ = CARRY(( \DUT_pc|O_programCounter\(1) ) + ( GND ) + ( \DUT_pc|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \DUT_pc|ALT_INV_O_programCounter\(1),
	cin => \DUT_pc|Add0~2\,
	sumout => \DUT_pc|Add0~5_sumout\,
	cout => \DUT_pc|Add0~6\);

-- Location: FF_X72_Y2_N5
\DUT_pc|O_programCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_pc|Add0~5_sumout\,
	ena => \DUT_controlUnit|S_state.s1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_pc|O_programCounter\(1));

-- Location: MLABCELL_X72_Y2_N6
\DUT_pc|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_pc|Add0~9_sumout\ = SUM(( \DUT_pc|O_programCounter\(2) ) + ( GND ) + ( \DUT_pc|Add0~6\ ))
-- \DUT_pc|Add0~10\ = CARRY(( \DUT_pc|O_programCounter\(2) ) + ( GND ) + ( \DUT_pc|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \DUT_pc|ALT_INV_O_programCounter\(2),
	cin => \DUT_pc|Add0~6\,
	sumout => \DUT_pc|Add0~9_sumout\,
	cout => \DUT_pc|Add0~10\);

-- Location: FF_X72_Y2_N7
\DUT_pc|O_programCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_pc|Add0~9_sumout\,
	ena => \DUT_controlUnit|S_state.s1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_pc|O_programCounter\(2));

-- Location: MLABCELL_X72_Y2_N9
\DUT_pc|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_pc|Add0~13_sumout\ = SUM(( \DUT_pc|O_programCounter\(3) ) + ( GND ) + ( \DUT_pc|Add0~10\ ))
-- \DUT_pc|Add0~14\ = CARRY(( \DUT_pc|O_programCounter\(3) ) + ( GND ) + ( \DUT_pc|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \DUT_pc|ALT_INV_O_programCounter\(3),
	cin => \DUT_pc|Add0~10\,
	sumout => \DUT_pc|Add0~13_sumout\,
	cout => \DUT_pc|Add0~14\);

-- Location: FF_X72_Y2_N11
\DUT_pc|O_programCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_pc|Add0~13_sumout\,
	ena => \DUT_controlUnit|S_state.s1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_pc|O_programCounter\(3));

-- Location: MLABCELL_X72_Y2_N12
\DUT_pc|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_pc|Add0~17_sumout\ = SUM(( \DUT_pc|O_programCounter\(4) ) + ( GND ) + ( \DUT_pc|Add0~14\ ))
-- \DUT_pc|Add0~18\ = CARRY(( \DUT_pc|O_programCounter\(4) ) + ( GND ) + ( \DUT_pc|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \DUT_pc|ALT_INV_O_programCounter\(4),
	cin => \DUT_pc|Add0~14\,
	sumout => \DUT_pc|Add0~17_sumout\,
	cout => \DUT_pc|Add0~18\);

-- Location: FF_X72_Y2_N13
\DUT_pc|O_programCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_pc|Add0~17_sumout\,
	ena => \DUT_controlUnit|S_state.s1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_pc|O_programCounter\(4));

-- Location: MLABCELL_X72_Y2_N15
\DUT_pc|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_pc|Add0~21_sumout\ = SUM(( \DUT_pc|O_programCounter\(5) ) + ( GND ) + ( \DUT_pc|Add0~18\ ))
-- \DUT_pc|Add0~22\ = CARRY(( \DUT_pc|O_programCounter\(5) ) + ( GND ) + ( \DUT_pc|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \DUT_pc|ALT_INV_O_programCounter\(5),
	cin => \DUT_pc|Add0~18\,
	sumout => \DUT_pc|Add0~21_sumout\,
	cout => \DUT_pc|Add0~22\);

-- Location: FF_X72_Y2_N17
\DUT_pc|O_programCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_pc|Add0~21_sumout\,
	ena => \DUT_controlUnit|S_state.s1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_pc|O_programCounter\(5));

-- Location: MLABCELL_X72_Y2_N18
\DUT_pc|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_pc|Add0~25_sumout\ = SUM(( \DUT_pc|O_programCounter\(6) ) + ( GND ) + ( \DUT_pc|Add0~22\ ))
-- \DUT_pc|Add0~26\ = CARRY(( \DUT_pc|O_programCounter\(6) ) + ( GND ) + ( \DUT_pc|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \DUT_pc|ALT_INV_O_programCounter\(6),
	cin => \DUT_pc|Add0~22\,
	sumout => \DUT_pc|Add0~25_sumout\,
	cout => \DUT_pc|Add0~26\);

-- Location: FF_X72_Y2_N20
\DUT_pc|O_programCounter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_pc|Add0~25_sumout\,
	ena => \DUT_controlUnit|S_state.s1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_pc|O_programCounter\(6));

-- Location: MLABCELL_X72_Y2_N21
\DUT_pc|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_pc|Add0~29_sumout\ = SUM(( \DUT_pc|O_programCounter\(7) ) + ( GND ) + ( \DUT_pc|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \DUT_pc|ALT_INV_O_programCounter\(7),
	cin => \DUT_pc|Add0~26\,
	sumout => \DUT_pc|Add0~29_sumout\);

-- Location: FF_X72_Y2_N23
\DUT_pc|O_programCounter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_pc|Add0~29_sumout\,
	ena => \DUT_controlUnit|S_state.s1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_pc|O_programCounter\(7));

-- Location: FF_X72_Y2_N19
\DUT_pc|O_programCounter[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_pc|Add0~25_sumout\,
	ena => \DUT_controlUnit|S_state.s1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_pc|O_programCounter[6]~DUPLICATE_q\);

-- Location: M10K_X76_Y2_N0
\DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init2 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000300002000070000600005000010000100001000300D0110E0110D001000300E01002001000300D01001001000300B010ED00100001000300A010FE02005001000010003005020040100200100001000C1000A1000C0000A000031000110303000010010010003002021030100F00000000000000000000000000010003003010040000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/VHDL_microprocessor.ram0_rom_entity_3e34ded5.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "rom_entity:DUT_rom|altsyncram:S_rom_rtl_0|altsyncram_nre1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 8,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 20,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 255,
	port_a_logical_ram_depth => 256,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 8,
	port_b_data_width => 20,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \I_processor_clock~inputCLKENA0_outclk\,
	portaaddr => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: FF_X75_Y2_N25
\DUT_decoder|O_opcode[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	asdata => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a8\,
	sload => VCC,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_opcode\(0));

-- Location: FF_X75_Y2_N34
\DUT_decoder|O_opcode[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	asdata => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a9\,
	sload => VCC,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_opcode\(1));

-- Location: LABCELL_X75_Y2_N12
\DUT_decoder|O_opcode[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_decoder|O_opcode[2]~feeder_combout\ = ( \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a10\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a10\,
	combout => \DUT_decoder|O_opcode[2]~feeder_combout\);

-- Location: FF_X75_Y2_N13
\DUT_decoder|O_opcode[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_decoder|O_opcode[2]~feeder_combout\,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_opcode\(2));

-- Location: LABCELL_X75_Y2_N21
\DUT_decoder|O_opcode[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_decoder|O_opcode[3]~feeder_combout\ = ( \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a11\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a11\,
	combout => \DUT_decoder|O_opcode[3]~feeder_combout\);

-- Location: FF_X75_Y2_N22
\DUT_decoder|O_opcode[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_decoder|O_opcode[3]~feeder_combout\,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_opcode\(3));

-- Location: LABCELL_X75_Y2_N0
\DUT_decoder|O_opcode[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_decoder|O_opcode[4]~feeder_combout\ = ( \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a12\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a12\,
	combout => \DUT_decoder|O_opcode[4]~feeder_combout\);

-- Location: FF_X75_Y2_N1
\DUT_decoder|O_opcode[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_decoder|O_opcode[4]~feeder_combout\,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_opcode\(4));

-- Location: LABCELL_X75_Y2_N57
\DUT_decoder|O_opcode[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_decoder|O_opcode[5]~feeder_combout\ = ( \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a13\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a13\,
	combout => \DUT_decoder|O_opcode[5]~feeder_combout\);

-- Location: FF_X75_Y2_N58
\DUT_decoder|O_opcode[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_decoder|O_opcode[5]~feeder_combout\,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_opcode\(5));

-- Location: LABCELL_X75_Y2_N48
\DUT_decoder|O_opcode[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_decoder|O_opcode[6]~feeder_combout\ = ( \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a14\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a14\,
	combout => \DUT_decoder|O_opcode[6]~feeder_combout\);

-- Location: FF_X75_Y2_N49
\DUT_decoder|O_opcode[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_decoder|O_opcode[6]~feeder_combout\,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_opcode\(6));

-- Location: FF_X75_Y2_N10
\DUT_decoder|O_opcode[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	asdata => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a15\,
	sload => VCC,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_opcode\(7));

-- Location: FF_X75_Y2_N19
\DUT_decoder|O_regAddress[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	asdata => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a0~portadataout\,
	sload => VCC,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_regAddress\(0));

-- Location: LABCELL_X75_Y2_N39
\DUT_decoder|O_regAddress[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_decoder|O_regAddress[1]~feeder_combout\ = ( \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a1\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a1\,
	combout => \DUT_decoder|O_regAddress[1]~feeder_combout\);

-- Location: FF_X75_Y2_N40
\DUT_decoder|O_regAddress[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_decoder|O_regAddress[1]~feeder_combout\,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_regAddress\(1));

-- Location: FF_X75_Y2_N31
\DUT_decoder|O_regAddress[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	asdata => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a2\,
	sload => VCC,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_regAddress\(2));

-- Location: FF_X75_Y2_N46
\DUT_decoder|O_regAddress[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	asdata => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a3\,
	sload => VCC,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_regAddress\(3));

-- Location: LABCELL_X75_Y2_N54
\DUT_decoder|O_regAddress[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_decoder|O_regAddress[4]~feeder_combout\ = ( \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a4\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a4\,
	combout => \DUT_decoder|O_regAddress[4]~feeder_combout\);

-- Location: FF_X75_Y2_N55
\DUT_decoder|O_regAddress[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_decoder|O_regAddress[4]~feeder_combout\,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_regAddress\(4));

-- Location: LABCELL_X75_Y2_N3
\DUT_decoder|O_regAddress[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_decoder|O_regAddress[5]~feeder_combout\ = ( \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a5\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a5\,
	combout => \DUT_decoder|O_regAddress[5]~feeder_combout\);

-- Location: FF_X75_Y2_N4
\DUT_decoder|O_regAddress[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_decoder|O_regAddress[5]~feeder_combout\,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_regAddress\(5));

-- Location: LABCELL_X75_Y2_N6
\DUT_decoder|O_regAddress[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_decoder|O_regAddress[6]~feeder_combout\ = ( \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a6\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a6\,
	combout => \DUT_decoder|O_regAddress[6]~feeder_combout\);

-- Location: FF_X75_Y2_N7
\DUT_decoder|O_regAddress[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_decoder|O_regAddress[6]~feeder_combout\,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_regAddress\(6));

-- Location: LABCELL_X75_Y2_N51
\DUT_decoder|O_regAddress[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \DUT_decoder|O_regAddress[7]~feeder_combout\ = ( \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a7\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \DUT_rom|S_rom_rtl_0|auto_generated|ALT_INV_ram_block1a7\,
	combout => \DUT_decoder|O_regAddress[7]~feeder_combout\);

-- Location: FF_X75_Y2_N53
\DUT_decoder|O_regAddress[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	d => \DUT_decoder|O_regAddress[7]~feeder_combout\,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_regAddress\(7));

-- Location: LABCELL_X57_Y2_N51
\~GND\ : cyclonev_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: FF_X75_Y2_N47
\DUT_decoder|O_regAddress[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_processor_clock~inputCLKENA0_outclk\,
	asdata => \DUT_rom|S_rom_rtl_0|auto_generated|ram_block1a3\,
	sload => VCC,
	ena => \DUT_controlUnit|S_state.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DUT_decoder|O_regAddress[3]~DUPLICATE_q\);

-- Location: M10K_X58_Y2_N0
\DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/VHDL_microprocessor.ram0_memory_entity_1056524d.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "memory_entity:DUT_memory|altsyncram:S_mem_rtl_0|altsyncram_mqv1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 8,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 40,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 255,
	port_a_logical_ram_depth => 256,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 8,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 40,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 255,
	port_b_logical_ram_depth => 256,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => GND,
	clk0 => \I_processor_clock~inputCLKENA0_outclk\,
	portadatain => \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \DUT_memory|S_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);
END structure;


