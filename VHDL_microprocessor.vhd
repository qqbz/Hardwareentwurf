-- ====================================================================
--
--	File Name:		VHDL_microprocessor.vhd
--	Description: FPGA_design
--	Designers:  Lukas Becker, Simon Fella
--
-- ====================================================================

-- libraries decleration
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
library work;
use work.common.all;

 -- entity Definition
entity VHDL_microprocessor is
--    generic(N: positive := 8); --defualt value for N is 8
    port (
	
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
end VHDL_microprocessor;

 -- Architecture Definition
architecture VHDL_microprocessor_arch of VHDL_microprocessor is

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
	
BEGIN
	
	DUT_controlUnit : controlUnit_entity
	PORT MAP
	(
		I_clock   => I_processor_clock  ,
		I_switchState	   => I_processor_enable  ,
		I_reset   => I_processor_reset  ,
		O_output   => S_pipeline_stage  
	) ;

	O_pipeline_stage <= S_pipeline_stage; 
	
	
	DUT_pc : pc_entity
	PORT MAP 
	(
		I_enable   => S_pipeline_stage(0)  ,
		I_clock   => I_processor_clock  ,
		I_jump   => S_aluOut_shouldJump_pcIn_jump  ,
		I_newAddress   => S_aluOut_data_memoryIn_regWriteData_pcIn_newAddress  ,
		O_programCounter   => S_pcOut_programCounter_romIn_address
	);
	
	O_pc_programCounter <= S_pcOut_programCounter_romIn_address;
	
	
	DUT_rom : rom_entity
	PORT MAP
	(
		I_clock   => I_processor_clock  ,
		I_address   => S_pcOut_programCounter_romIn_address  ,
		O_instruction   => S_romOut_instruction_decoderIn_instruction
	);
	
	O_rom_instruction <= S_romOut_instruction_decoderIn_instruction;
	
	
	DUT_decoder : decoder_entity
	PORT MAP 
	( 
		I_enable   => S_pipeline_stage(2)  ,
		I_clock   => I_processor_clock  ,
		I_instruction   => S_romOut_instruction_decoderIn_instruction  ,
		O_opcode   => S_decoderOut_opcode_aluIn_opcode  ,
		O_dataImmediate   => S_decoderOut_dataImmediate_aluIn_dataImm  ,
		O_regAddress   => S_decoderOut_regAddress_memoryIn_regReadSelect 
	) ; 
	
	O_decoder_opcode <= S_decoderOut_opcode_aluIn_opcode;
	O_decoder_dataImmediate <= S_decoderOut_dataImmediate_aluIn_dataImm;
	O_decoder_regAddress <= S_decoderOut_regAddress_memoryIn_regReadSelect;
		
		
	DUT_alu  : alu_entity  
	PORT MAP 
	( 
		I_enable   => S_pipeline_stage(4)  ,
		I_clock   => I_processor_clock  ,
		I_opcode   => S_decoderOut_opcode_aluIn_opcode  ,
		I_dataReg   => S_memoryOut_regReadData_aluIn_dataReg  ,
		I_dataImm   => S_decoderOut_dataImmediate_aluIn_dataImm  ,
		O_data   => S_aluOut_data_memoryIn_regWriteData_pcIn_newAddress  ,
		O_flags   => O_alu_flags_debug  ,
		O_regWriteSelect   => S_aluOut_regSelect_memoryIn_regWriteSelect  ,
		O_regWriteEnable   => S_aluOut_regWrite_memoryIn_writeEnableCalculated  ,
		O_shouldJump   => S_aluOut_shouldJump_pcIn_jump  
	) ; 
	
	O_alu_data <= S_aluOut_data_memoryIn_regWriteData_pcIn_newAddress;
	O_alu_regSelect <= S_aluOut_regSelect_memoryIn_regWriteSelect;
	O_alu_regWrite <= S_aluOut_regWrite_memoryIn_writeEnableCalculated;
	O_alu_shouldJump <= S_aluOut_shouldJump_pcIn_jump;
		
		
	DUT_memory  : memory_entity  
	PORT MAP 
	( 
		I_enable   => S_pipeline_stage(3)  ,
		I_clock   => I_processor_clock  ,
		I_regWriteData   => S_aluOut_data_memoryIn_regWriteData_pcIn_newAddress  ,
		I_regReadSelect   => S_decoderOut_regAddress_memoryIn_regReadSelect  ,
		I_regWriteSelect   => S_aluOut_regSelect_memoryIn_regWriteSelect  ,
		I_writeEnable   => S_memory_writeEnableCalculated  ,
		O_regReadData   => S_memoryOut_regReadData_aluIn_dataReg  
	) ; 
	
	O_memory_regReadData <= S_memoryOut_regReadData_aluIn_dataReg;
	
	
	-- signal S_memory_writeEnableCalculated has to be a combination of 2 signals, which cannot be done in the port mapping
	process(S_aluOut_regWrite_memoryIn_writeEnableCalculated, S_pipeline_stage)
	begin		
		S_memory_writeEnableCalculated <= S_aluOut_regWrite_memoryIn_writeEnableCalculated and S_pipeline_stage(5);
	end process;
	
	O_memory_writeEnable_calculated <= S_memory_writeEnableCalculated;
	

end VHDL_microprocessor_arch;

--EndOfFile
