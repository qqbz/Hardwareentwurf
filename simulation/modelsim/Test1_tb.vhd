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
	
	COMPONENT controlUnit_entity 
		PORT
		(
			-- Input ports
			I_clock		 		: in	STD_LOGIC;
			I_switchState	 	: in	STD_LOGIC;
			I_reset	 			: in	STD_LOGIC;

			-- Output ports
			O_output	 		: out	STD_LOGIC_VECTOR(5 downto 0)
		);
	END COMPONENT ;
	
	COMPONENT pc_entity
		PORT
		(
			-- Input ports
			I_enable			: in  STD_LOGIC;
			I_clock		 		: in  STD_LOGIC;
			I_jump				: in  STD_LOGIC;
			I_newAddress		: in  STD_LOGIC_VECTOR (7 downto 0);
			
			-- Output ports
			O_programCounter	: out STD_LOGIC_VECTOR (7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT rom_entity
		PORT
		(
			-- Input ports
			I_clock				: in  STD_LOGIC;
			I_address			: in  STD_LOGIC_VECTOR (7 downto 0);
			
			-- Output ports
			O_instruction		: out STD_LOGIC_VECTOR(15 downto 0)
		);
	END COMPONENT;
	
	COMPONENT decoder_entity 
		PORT
		(
			-- Input ports
			I_clock				: in  STD_LOGIC;
			I_enable			: in  STD_LOGIC;
			I_instruction 		: in  STD_LOGIC_VECTOR (15 downto 0);
			
			-- Output ports
			O_opcode			: out STD_LOGIC_VECTOR (7 downto 0);
			O_dataImmediate		: out STD_LOGIC_VECTOR (7 downto 0);
			O_regAddress		: out STD_LOGIC_VECTOR (7 downto 0)
		);
	END COMPONENT ; 
	
	COMPONENT alu_entity 
		PORT
		(
			-- Input ports
			I_clock				: in  STD_LOGIC;
			I_enable			: in  STD_LOGIC;
			I_opcode			: in  STD_LOGIC_VECTOR (7 downto 0);
			I_dataReg			: in  STD_LOGIC_VECTOR (7 downto 0);
			I_dataImm			: in  STD_LOGIC_VECTOR (7 downto 0);

			-- Output ports
			O_data				: out STD_LOGIC_VECTOR (7 downto 0);
			O_flags				: out STD_LOGIC_VECTOR (2 downto 0);
			O_regWriteSelect	: out STD_LOGIC_VECTOR (7 downto 0);
			O_regWriteEnable	: out STD_LOGIC;
			O_shouldJump		: out STD_LOGIC := '0'
		);
	END COMPONENT ;
	
	COMPONENT memory_entity  
		PORT 
		( 
			I_regWriteData  	: in STD_LOGIC_VECTOR (7 downto 0);
			I_clock  			: in STD_LOGIC ; 
			I_regReadSelect  	: in std_logic_vector (7 downto 0) ; 
			I_regWriteSelect  	: in std_logic_vector (7 downto 0) ; 
			I_writeEnable  		: in STD_LOGIC ; 
			I_enable  			: in STD_LOGIC ; 
			O_regReadData  		: out STD_LOGIC_VECTOR (7 downto 0)
		);
	END COMPONENT ; 
	
	
	signal S_controlUnitIn_reset								: STD_LOGIC;
	signal S_controlUnit_enable									: STD_LOGIC;
	signal S_clock												: STD_LOGIC;
	signal S_pipeline_stage										: STD_LOGIC_VECTOR(5 downto 0);	
	signal S_pcOut_programCounter_romIn_address					: STD_LOGIC_VECTOR (7 downto 0);	
	signal S_romOut_instruction_decoderIn_instruction			: STD_LOGIC_VECTOR (15 downto 0);	
	signal S_decoderOut_opcode_aluIn_opcode						: STD_LOGIC_VECTOR (7 downto 0);
	signal S_decoderOut_dataImmediate_aluIn_dataImm				: STD_LOGIC_VECTOR (7 downto 0);
	signal S_decoderOut_regAddress_memoryIn_regReadSelect		: STD_LOGIC_VECTOR (7 downto 0);
	signal S_memoryOut_regReadData_aluIn_dataReg				: STD_LOGIC_VECTOR (7 downto 0);	
	signal S_aluOut_data_memoryIn_regWriteData_pcIn_newAddress	: STD_LOGIC_VECTOR (7 downto 0);
	signal S_aluOut_flags_debug									: STD_LOGIC_VECTOR (2 downto 0);
	signal S_aluOut_regSelect_memoryIn_regWriteSelect			: STD_LOGIC_VECTOR (7 downto 0);
	signal S_aluOut_regWrite_memoryIn_writeEnableCalculated		: STD_LOGIC;	
	signal S_aluOut_shouldJump_pcIn_jump						: STD_LOGIC;	
	signal S_memory_writeEnableCalculated						: STD_LOGIC;	
	 
		
	-- Clock period definitions
	constant clk_period : time := 10 ns;
	
	BEGIN
		
		DUT_controlUnit  : controlUnit_entity  
		PORT MAP 
		( 
			I_clock   => S_clock  ,
			I_switchState   => S_controlUnit_enable  ,
			I_reset   => S_controlUnitIn_reset  ,
			O_output   => S_pipeline_stage  
		) ; 
			
		DUT_pc : pc_entity
		PORT MAP 
		(
			I_enable   => S_pipeline_stage(0)  ,
			I_clock   => S_clock  ,
			I_jump   => S_aluOut_shouldJump_pcIn_jump  ,
			I_newAddress   => S_aluOut_data_memoryIn_regWriteData_pcIn_newAddress  ,
			O_programCounter   => S_pcOut_programCounter_romIn_address
		);
		
		DUT_rom : rom_entity
		PORT MAP
		(
			I_clock   => S_clock  ,
			I_address   => S_pcOut_programCounter_romIn_address  ,
			O_instruction   => S_romOut_instruction_decoderIn_instruction
		);
		
		DUT_decoder : decoder_entity
		PORT MAP 
		( 
			I_enable   => S_pipeline_stage(2)  ,
			I_clock   => S_clock  ,
			I_instruction   => S_romOut_instruction_decoderIn_instruction  ,
			O_opcode   => S_decoderOut_opcode_aluIn_opcode  ,
			O_dataImmediate   => S_decoderOut_dataImmediate_aluIn_dataImm  ,
			O_regAddress   => S_decoderOut_regAddress_memoryIn_regReadSelect 
		) ; 
			
		DUT_alu  : alu_entity  
		PORT MAP 
		( 
			I_enable   => S_pipeline_stage(4)  ,
			I_clock   => S_clock  ,
			I_opcode   => S_decoderOut_opcode_aluIn_opcode  ,
			I_dataReg   => S_memoryOut_regReadData_aluIn_dataReg  ,
			I_dataImm   => S_decoderOut_dataImmediate_aluIn_dataImm  ,
			O_data   => S_aluOut_data_memoryIn_regWriteData_pcIn_newAddress  ,
			O_flags   => S_aluOut_flags_debug  ,
			O_regWriteSelect   => S_aluOut_regSelect_memoryIn_regWriteSelect  ,
			O_regWriteEnable   => S_aluOut_regWrite_memoryIn_writeEnableCalculated  ,
			O_shouldJump   => S_aluOut_shouldJump_pcIn_jump  
		) ; 
			
		DUT_memory  : memory_entity  
		PORT MAP 
		( 
			I_enable   => S_pipeline_stage(3)  ,
			I_clock   => S_clock  ,
			I_regWriteData   => S_aluOut_data_memoryIn_regWriteData_pcIn_newAddress  ,
			I_regReadSelect   => S_decoderOut_regAddress_memoryIn_regReadSelect  ,
			I_regWriteSelect   => S_aluOut_regSelect_memoryIn_regWriteSelect  ,
			I_writeEnable   => S_memory_writeEnableCalculated  ,
			O_regReadData   => S_memoryOut_regReadData_aluIn_dataReg  
		) ; 
			

		-- Clock process 
		clk_process: process
		begin
			S_clock <= '0';
			wait for clk_period/2;
			S_clock <= '1';
			wait for clk_period/2;
		end process;
		
		-- Memory input process
		mem_process: process
		begin
			S_memory_writeEnableCalculated <= S_aluOut_regWrite_memoryIn_writeEnableCalculated and S_pipeline_stage(5);
			wait for clk_period;		
		end process;

		-- Stimulus process
		restart_process: process
		begin
			-- hold reset state
			S_pipeline_stage <= "LLLLLL";
			wait for clk_period*2;
			S_controlUnitIn_reset <= '1';
			wait for clk_period;
			S_controlUnitIn_reset <= '0';
			wait for clk_period;
			S_controlUnit_enable <= '1';
			wait;
--			
--			-- Load 4 into R3
--			-- Test: ADDI (SUBI), MOVI
--			-- LOAD 4
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_ADDI & "00000100";
--			wait until S_pipeline_stage = "00001";			
--			-- MOVE into R3
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_MOVI & "00000011";
--			wait until S_pipeline_stage = "00001";			
--			-- CLEAR ACCU
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			-- Contents: R3:4
--			wait until S_pipeline_stage = "00001";
--
--			-- Load 15 and subtract content of R3 (4), store result in R2 (11)
--			-- Test: SUBD (ADDD)
--			-- LOAD 15
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_ADDI & "00001111";
--			wait until S_pipeline_stage = "00001";			
--			-- SUB R3 (4)
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_SUBD & "00000011";
--			wait until S_pipeline_stage = "00001";
--			-- MOVE into R2
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_MOVI & "00000010";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			-- Contents: R2:11 R3:4
--			wait until S_pipeline_stage = "00001";
--			
--			-- Load 1 into R0, Add content of R3 (4), store in address in R0 (R1)
--			-- Test: ADDD (SUBD), MOVD
--			-- LOAD 1
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_ADDI & "00000001";
--			wait until S_pipeline_stage = "00001";			
--			-- MOVE into R0
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_MOVI & "00000000";
--			wait until S_pipeline_stage = "00001";
--			-- ADD R3 (4)
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_ADDD & "00000011";
--			wait until S_pipeline_stage = "00001";			
--			-- MOVE into R1
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_MOVD & "00000000";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			-- Contents: R0:1 R1:5 R2:11 R3:4
--			wait until S_pipeline_stage = "00001";
--			
--			-- Load 0xFE into R10
--			--load.h r0,0xfe
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_ADDI & "11111110";
--			wait until S_pipeline_stage = "00001";	
--			-- MOVE into R10
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_MOVI & "00001010";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			
--			-- Load 0xED into R11
--			--load.l r1, 0xed
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_ADDI & "11101101";
--			wait until S_pipeline_stage = "00001";	
--			-- MOVE into R11
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_MOVI & "00001011";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			 
--			-- Skip r12
--			
--			-- Load 1 into R13
--			--load.l r3, 1
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_ADDI & "00000001";
--			wait until S_pipeline_stage = "00001";	
--			-- MOVE into R13
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_MOVI & "00001101";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			 
--			-- Load 2 into R14
--			--load.l r4, 2
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_ADDI & "00000010";
--			wait until S_pipeline_stage = "00001";	
--			-- MOVE into R14
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_MOVI & "00001110";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
--			wait until S_pipeline_stage = "00001";
--			 
--			-- Add R13 and R14
--			--add.u r3, r3, r4
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_ADDD & "00001101";
--			wait until S_pipeline_stage = "00001";
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_ADDD & "00001110";
--			wait until S_pipeline_stage = "00001";	
--			-- MOVE into R13
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_MOVI & "00001101";
--			wait until S_pipeline_stage = "00001";
--			-- CLEAR ACCU
--			S_romOut_instruction_decoderIn_instruction <= OPCODE_CLEAR_ACCU & OPCODE_NOP;
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
