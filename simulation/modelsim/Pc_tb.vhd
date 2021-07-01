LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.TEXTIO.all  ; 
USE std.textio.all  ; 
ENTITY Pc_tb  IS 
END ; 

ARCHITECTURE Pc_tb_arch OF Pc_tb IS
  SIGNAL I_enable   :  STD_LOGIC  ;
  SIGNAL I_clock   :  STD_LOGIC  ; 
  SIGNAL I_jump   :  STD_LOGIC  ; 
  SIGNAL I_newAddress   :  STD_LOGIC_VECTOR (7 downto 0)  ; 
  SIGNAL O_programCounter   :  STD_LOGIC_VECTOR (7 downto 0)  ; 
  COMPONENT pc_entity 
	PORT
	(
		-- Input ports
		I_enable			: in    STD_LOGIC;
		I_clock		 		: in	STD_LOGIC;
		I_jump				: in 	STD_LOGIC;
		I_newAddress		: in 	STD_LOGIC_VECTOR (7 downto 0);
		
		-- Output ports
		O_programCounter	: out STD_LOGIC_VECTOR (7 downto 0)
	);
  END COMPONENT ; 
  -- Clock period definitions
  constant I_clk_period : time := 10 ns;
BEGIN
  DUT  : pc_entity  
    PORT MAP ( 
      I_enable   => I_enable  ,
      I_clock   => I_clock  ,
      I_jump   => I_jump  ,
      I_newAddress   => I_newAddress  ,
      O_programCounter   => O_programCounter  ) ; 
	


	-- Clock process definitions
	I_clk_process :process
	begin
		I_clock <= '0';
		wait for I_clk_period/2;
		I_clock <= '1';
		wait for I_clk_period/2;
	end process;
	
	-- Stimulus process
	stim_proc: process
	begin
		-- hold reset state for 100 ns.
		wait for I_clk_period*10;

		-- insert stimulus here 

		I_enable <= '1';
		
		-- Perform 10 consecutive operations
		wait for I_clk_period*10;

		-- Jump
		I_jump <= '1';
		I_newAddress <= X"12";
		wait for I_clk_period;
		
		-- Perform 10 consecutive operations
		I_jump <= '0';
		wait for I_clk_period*10;

		-- Jump
		I_jump <= '1';
		I_newAddress <= X"34";
		wait for I_clk_period;
		
		-- Perform 10 consecutive operations
		I_jump <= '0';
		wait for I_clk_period*10;
		

		wait;
	end process;
END;
