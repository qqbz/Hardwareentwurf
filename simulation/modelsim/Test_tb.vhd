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
	
	COMPONENT Test 
		PORT
		(
			-- Input ports
			I_clock			: in  STD_LOGIC;
			I_instruction 	: in  STD_LOGIC_VECTOR (15 downto 0)
		);
	END COMPONENT ; 
	COMPONENT Decoder_entity 
		PORT
		(
			-- Input ports
			I_clock			: in  STD_LOGIC;
			I_enable		: in  STD_LOGIC;
			I_instruction 	: in  STD_LOGIC_VECTOR (15 downto 0);
			
			-- Output ports
			O_opcode		: out STD_LOGIC_VECTOR (7 downto 0);
			O_immediate		: out STD_LOGIC_VECTOR (7 downto 0);
			O_reg			: out STD_LOGIC_VECTOR (7 downto 0);
			O_regWrite		: out STD_LOGIC
		);
	END COMPONENT ; 
	COMPONENT alu_entity 
	PORT
	(
		-- Input ports
		I_clock		: in  STD_LOGIC;
		I_enable	: in  STD_LOGIC;
		I_opcode	: in  STD_LOGIC_VECTOR (7 downto 0);
		I_data		: in  STD_LOGIC_VECTOR (7 downto 0);

		-- Output ports
		O_data		: out STD_LOGIC_VECTOR (7 downto 0);
		O_flags		: out STD_LOGIC_VECTOR (2 downto 0);
		O_shouldJump: out STD_LOGIC := '0'
	);
	END COMPONENT ;
	COMPONENT memory_entity  
	PORT 
	( 
		I_regData  : in std_logic_vector (7 downto 0) ; 
		I_clock  : in STD_LOGIC ; 
		I_regSelect  : in std_logic_vector (7 downto 0) ; 
		I_writeEnable  : in STD_LOGIC ; 
		I_enable  : in STD_LOGIC ; 
		O_regData  : out std_logic_vector (7 downto 0)
	);
	END COMPONENT ; 
	
	
	signal S_clock			: STD_LOGIC;
	signal S_enable			: STD_LOGIC;
	signal S_instruction	: STD_LOGIC_VECTOR (15 downto 0);
	signal S_decoderOut_opcode_aluIn_opcode			: STD_LOGIC_VECTOR (7 downto 0);
	signal S_decoderOut_immediate_aluIn_data		: STD_LOGIC_VECTOR (7 downto 0);
	signal S_memoryOut_regData		: STD_LOGIC_VECTOR (7 downto 0);
	signal S_aluOut_data_memoryIn_regData		: STD_LOGIC_VECTOR (7 downto 0);
	signal S_aluOut_flags			: STD_LOGIC_VECTOR (2 downto 0);
	signal S_aluOut_shouldJump		: STD_LOGIC;
	signal S_decoderOut_reg_memoryIn_regSelect			: STD_LOGIC_VECTOR (7 downto 0);
	signal S_decoderOut_regWrite_memoryIn_writeEnable		: STD_LOGIC;
		
	-- Clock period definitions
	constant clk_period : time := 10 ns;
	
	BEGIN
		DUT_decoder : Decoder_entity  
		PORT MAP ( 
			I_enable   => S_enable  ,
			I_clock   => S_clock  ,
			I_instruction   => S_instruction  ,
			O_opcode   => S_decoderOut_opcode_aluIn_opcode  ,
			O_immediate   => S_decoderOut_immediate_aluIn_data  ,
			O_reg   => S_decoderOut_reg_memoryIn_regSelect  ,
			O_regWrite   => S_decoderOut_regWrite_memoryIn_writeEnable  ) ; 
			
		DUT_alu  : alu_entity  
		PORT MAP ( 
			I_enable   => S_enable  ,
			I_clock   => S_clock  ,
			I_opcode   => S_decoderOut_opcode_aluIn_opcode  ,
			I_data   => S_decoderOut_immediate_aluIn_data  ,
			O_data   => S_aluOut_data_memoryIn_regData  ,
			O_flags   => S_aluOut_flags  ,
			O_shouldJump   => S_aluOut_shouldJump  ) ; 
			
		DUT_memory  : memory_entity  
		PORT MAP ( 
			I_enable   => S_enable  ,
			I_clock   => S_clock  ,
			I_regData   => S_aluOut_data_memoryIn_regData  ,
			I_regSelect   => S_decoderOut_reg_memoryIn_regSelect  ,
			I_writeEnable   => S_decoderOut_regWrite_memoryIn_writeEnable  ,
			O_regData   => S_memoryOut_regData  ) ; 
	

		-- Clock process definitions
		clk_process: process
		begin
			S_clock <= '0';
			wait for clk_period/2;
			S_clock <= '1';
			wait for clk_period/2;
		end process;

		-- Stimulus process
		stim_process: process
		begin
			-- hold reset state for 100 ns.
			wait for clk_period*10;
			S_enable <= '1';
			
			-- LOADI 4
			S_instruction <= OPCODE_ADDI & "00000100";
			wait for clk_period;
			S_instruction <= OPCODE_NOP & "00000000";
			wait for clk_period*3;
			
			-- MOVEI into R3
			S_instruction <= OPCODE_MOVI & "00000011";
			wait for clk_period;
			S_instruction <= OPCODE_NOP & "00000000";
			wait for clk_period*3;
			
			-- CLEAR ACCU
			S_instruction <= OPCODE_CLEAR_ACCU & "00000000";
			wait for clk_period;
			S_instruction <= OPCODE_NOP & "00000000";
			wait for clk_period*3;

			-- LOADI 15
			S_instruction <= OPCODE_ADDI & "00001111";
			wait for clk_period;
			S_instruction <= OPCODE_NOP & "00000000";
			wait for clk_period*3;
			
			-- SUBD R3 (=4)
			S_instruction <= OPCODE_SUBD & "00000011";
			wait for clk_period;
			S_instruction <= OPCODE_NOP & "00000000";
			wait for clk_period*3;

			-- MOVEI into R2
			S_instruction <= OPCODE_MOVI & "00000010";
			wait for clk_period;
			S_instruction <= OPCODE_NOP & "00000000";
			wait for clk_period*3;

			wait;
		end process;
END;
