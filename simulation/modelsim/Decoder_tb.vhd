LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.TEXTIO.all  ; 
USE std.textio.all  ; 
ENTITY Decoder_tb  IS 
END ; 

ARCHITECTURE Decoder_tb_arch OF Decoder_tb IS
	signal I_clock		: STD_LOGIC;
	signal I_enable		: STD_LOGIC;
	signal I_instruction: STD_LOGIC_VECTOR (7 downto 0);
	signal O_opcode		: STD_LOGIC_VECTOR (7 downto 0);
	signal O_data		: STD_LOGIC_VECTOR (7 downto 0);
	
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
	-- Clock period definitions
	constant clk_period : time := 10 ns;
	BEGIN
		DUT  : Decoder_entity  
		PORT MAP ( 
			I_enable   => I_enable  ,
			I_clock   => I_clock  ,
			I_opcode   => I_opcode  ,
			I_data   => I_data  ,
			O_data   => O_data  ,
			O_flags   => O_flags  ,
			O_shouldJump   => O_shouldJump  ) ; 

		-- Clock process definitions
		clk_process: process
		begin
			I_clock <= '0';
			wait for clk_period/2;
			I_clock <= '1';
			wait for clk_period/2;
		end process;

		-- Stimulus process
		stim_process: process
		begin
			-- hold reset state for 100 ns.
			wait for I_clk_period*10;
			I_enable <= '1';
			
			-- LOADI 4
			I_instruction <= OPCODE_ADDI & "00000100";
			wait for I_clk_period;
			
			-- MOVEI into R3
			I_instruction <= OPCODE_MOVI & "00000011";
			wait for I_clk_period;
			
			-- CLEAR ACCU
			I_instruction <= OPCODE_CLEAR_ACCU & "00000000";
			wait for I_clk_period;

			-- LOADI 15
			I_instruction <= OPCODE_ADDI & "00001111";
			wait for I_clk_period;
			
			-- SUBD R3 (=4)
			I_instruction <= OPCODE_SUBD & "00000011";
			wait for I_clk_period;

			-- MOVEI into R2
			I_instruction <= OPCODE_MOVI & "00000010";
			wait for I_clk_period;

			wait;
		end process;
END;
