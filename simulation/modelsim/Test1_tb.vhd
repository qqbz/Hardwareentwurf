LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.TEXTIO.all  ; 
USE std.textio.all  ; 
library work;
use work.common.all;
ENTITY Test_tb  IS 
END ; 

ARCHITECTURE behavior OF Test_tb IS	
	
	COMPONENT VHDL_microprocessor
		PORT
		(
			-- Input ports
			I_processor_clock		 		: in	std_logic;
			I_processor_reset	 			: in	std_logic;
			I_processor_enable 				: in 	std_logic;
			
			-- Output ports to see the inner workings in the waveform		
			O_pipeline_stage				: out	STD_LOGIC_VECTOR(5 downto 0);	
			O_pc_programCounter				: out	STD_LOGIC_VECTOR (7 downto 0);	
			O_rom_instruction				: out	STD_LOGIC_VECTOR (15 downto 0);	
			O_decoder_opcode				: out	STD_LOGIC_VECTOR (7 downto 0);
			O_decoder_dataImmediate			: out	STD_LOGIC_VECTOR (7 downto 0);
			O_decoder_regAddress			: out	STD_LOGIC_VECTOR (7 downto 0);
			O_memory_regReadData			: out	STD_LOGIC_VECTOR (7 downto 0);	
			O_alu_data						: out	STD_LOGIC_VECTOR (7 downto 0);
			O_alu_flags_debug				: out	STD_LOGIC_VECTOR (2 downto 0);
			O_alu_regSelect					: out	STD_LOGIC_VECTOR (7 downto 0);
			O_alu_regWrite					: out	STD_LOGIC;	
			O_alu_shouldJump				: out	STD_LOGIC;	
			O_memory_writeEnable_calculated	: out	STD_LOGIC
		);
	END COMPONENT;
	
	signal S_clock 							: STD_LOGIC;
	signal S_reset 							: STD_LOGIC;
	signal S_enable							: STD_LOGIC;	
	-- Signals to see the inner workings in the waveform
	signal S_pipeline_stage					: STD_LOGIC_VECTOR(5 downto 0);	
	signal S_pc_programCounter				: STD_LOGIC_VECTOR (7 downto 0);	
	signal S_rom_instruction				: STD_LOGIC_VECTOR (15 downto 0);	
	signal S_decoder_opcode					: STD_LOGIC_VECTOR (7 downto 0);
	signal S_decoder_dataImmediate			: STD_LOGIC_VECTOR (7 downto 0);
	signal S_decoder_regAddress				: STD_LOGIC_VECTOR (7 downto 0);
	signal S_memory_regReadData				: STD_LOGIC_VECTOR (7 downto 0);	
	signal S_alu_data						: STD_LOGIC_VECTOR (7 downto 0);
	signal S_alu_flags_debug				: STD_LOGIC_VECTOR (2 downto 0);
	signal S_alu_regSelect					: STD_LOGIC_VECTOR (7 downto 0);
	signal S_alu_regWrite					: STD_LOGIC;	
	signal S_alu_shouldJump					: STD_LOGIC;	
	signal S_memory_writeEnable_calculated	: STD_LOGIC;	
			
	-- Clock period definitions
	constant clk_period : time := 10 ns;
	
BEGIN
	
	DUT_microprocessor  : VHDL_microprocessor
	PORT MAP
	(
		I_processor_clock   => S_clock  ,
		I_processor_reset   => S_reset  ,
		I_processor_enable   => S_enable  ,			
		O_pipeline_stage   => S_pipeline_stage  ,
		O_pc_programCounter   => S_pc_programCounter  ,
		O_rom_instruction   => S_rom_instruction  ,	
		O_decoder_opcode   => S_decoder_opcode  ,
		O_decoder_dataImmediate   => S_decoder_dataImmediate  ,
		O_decoder_regAddress   => S_decoder_regAddress  ,
		O_memory_regReadData   => S_memory_regReadData  ,	
		O_alu_data   => S_alu_data  ,
		O_alu_flags_debug   => S_alu_flags_debug  ,
		O_alu_regSelect   => S_alu_regSelect  ,
		O_alu_regWrite   => S_alu_regWrite  ,	
		O_alu_shouldJump   => S_alu_shouldJump  ,	
		O_memory_writeEnable_calculated   => S_memory_writeEnable_calculated
	) ;

	-- Clock process 
	clk_process: process
	begin
		S_clock <= '0';
		wait for clk_period/2;
		S_clock <= '1';
		wait for clk_period/2;
	end process;

	-- Stimulus process
	restart_process: process
	begin
	
		S_reset <= '1';
		wait for clk_period;
		S_reset <= '0';
		wait for clk_period;
		S_enable <= '1';
		wait;

--			Testcode which was used when only the modules Decoder, Alu and Memory were connected together in the testbench
--
--			-- Load 4 into R3
--			-- Test: ADDI (SUBI), MOVI
--			-- LOAD 4
--			S_rom_instruction <= OPCODE_ADDI & "00000100";
--			wait until S_pipeline_stage = "00001";			
--			-- MOVE into R3
--			S_rom_instruction <= OPCODE_MOVI & "00000011";
--			wait until S_pipeline_stage = "00001";			
--			-- CLEAR ACCU
--			S_rom_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			-- Contents: R3:4
--			wait until S_pipeline_stage = "00001";
--
--			-- Load 15 and subtract content of R3 (4), store result in R2 (11)
--			-- Test: SUBD (ADDD)
--			-- LOAD 15
--			S_rom_instruction <= OPCODE_ADDI & "00001111";
--			wait until S_pipeline_stage = "00001";			
--			-- SUB R3 (4)
--			S_rom_instruction <= OPCODE_SUBD & "00000011";
--			wait until S_pipeline_stage = "00001";
--			-- MOVE into R2
--			S_rom_instruction <= OPCODE_MOVI & "00000010";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_rom_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			-- Contents: R2:11 R3:4
--			wait until S_pipeline_stage = "00001";
--			
--			-- Load 1 into R0, Add content of R3 (4), store in address in R0 (R1)
--			-- Test: ADDD (SUBD), MOVD
--			-- LOAD 1
--			S_rom_instruction <= OPCODE_ADDI & "00000001";
--			wait until S_pipeline_stage = "00001";			
--			-- MOVE into R0
--			S_rom_instruction <= OPCODE_MOVI & "00000000";
--			wait until S_pipeline_stage = "00001";
--			-- ADD R3 (4)
--			S_rom_instruction <= OPCODE_ADDD & "00000011";
--			wait until S_pipeline_stage = "00001";			
--			-- MOVE into R1
--			S_rom_instruction <= OPCODE_MOVD & "00000000";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_rom_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			-- Contents: R0:1 R1:5 R2:11 R3:4
--			wait until S_pipeline_stage = "00001";
--			
--			-- Load 0xFE into R10
--			--load.h r0,0xfe
--			S_rom_instruction <= OPCODE_ADDI & "11111110";
--			wait until S_pipeline_stage = "00001";	
--			-- MOVE into R10
--			S_rom_instruction <= OPCODE_MOVI & "00001010";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_rom_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			
--			-- Load 0xED into R11
--			--load.l r1, 0xed
--			S_rom_instruction <= OPCODE_ADDI & "11101101";
--			wait until S_pipeline_stage = "00001";	
--			-- MOVE into R11
--			S_rom_instruction <= OPCODE_MOVI & "00001011";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_rom_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			 
--			-- Skip r12
--			
--			-- Load 1 into R13
--			--load.l r3, 1
--			S_rom_instruction <= OPCODE_ADDI & "00000001";
--			wait until S_pipeline_stage = "00001";	
--			-- MOVE into R13
--			S_rom_instruction <= OPCODE_MOVI & "00001101";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_rom_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			 
--			-- Load 2 into R14
--			--load.l r4, 2
--			S_rom_instruction <= OPCODE_ADDI & "00000010";
--			wait until S_pipeline_stage = "00001";	
--			-- MOVE into R14
--			S_rom_instruction <= OPCODE_MOVI & "00001110";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_rom_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			 
--			-- Add R13 and R14
--			--add.u r3, r3, r4
--			S_rom_instruction <= OPCODE_ADDD & "00001101";
--			wait until S_pipeline_stage = "00001";
--			S_rom_instruction <= OPCODE_ADDD & "00001110";
--			wait until S_pipeline_stage = "00001";	
--			-- MOVE into R13
--			S_rom_instruction <= OPCODE_MOVI & "00001101";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_rom_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			 
--			-- Skip R15
--			--or r5, r0, r3
--			
--			-- Contents: R0:1 R1:5 R2:11 R3:4
--			--			 R10:FE R11:ED R13:3 R14:2 
--			wait until S_pipeline_stage = "00001";
--			
--
--			wait;
	end process;
END;
