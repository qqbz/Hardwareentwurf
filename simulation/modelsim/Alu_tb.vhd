LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.TEXTIO.all  ; 
USE std.textio.all  ; 
ENTITY Alu_tb  IS 
END ; 

ARCHITECTURE Alu_tb_arch OF Alu_tb IS
	signal I_clock		: STD_LOGIC;
	signal I_enable		: STD_LOGIC;
	signal I_opcode		: STD_LOGIC_VECTOR (7 downto 0);
	signal I_data		: STD_LOGIC_VECTOR (7 downto 0);
	signal O_data		: STD_LOGIC_VECTOR (7 downto 0);
	signal O_flags		: STD_LOGIC_VECTOR (2 downto 0);
	signal O_shouldJump	: STD_LOGIC := '0';
	
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
  -- Clock period definitions
  constant clk_period : time := 10 ns;
BEGIN
  DUT  : alu_entity  
    PORT MAP ( 
      I_enable   => I_enable  ,
      I_clock   => I_clock  ,
      I_opcode   => I_opcode  ,
      I_data   => I_data  ,
      O_data   => O_data  ,
      O_flags   => O_flags  ,
      O_shouldJump   => O_shouldJump  ) ; 
	


	-- Clock process definitions
	clk_process :process
	begin
		I_clock <= '0';
		wait for clk_period/2;
		I_clock <= '1';
		wait for clk_period/2;
	end process;
	
	-- Stimulus process
	stim_proc: process
	begin
		-- hold reset state for 100 ns.
		wait for clk_period*10;

		-- insert stimulus here 

		I_enable <= '1';
		
		-- Perform 10 consecutive operations
		wait for clk_period*10;

		

		wait;
	end process;
END;
