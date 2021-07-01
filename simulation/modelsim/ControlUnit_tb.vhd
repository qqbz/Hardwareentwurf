LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.TEXTIO.all  ; 
USE std.textio.all  ; 
ENTITY ControlUnit_tb  IS 
END ; 

ARCHITECTURE ControlUnit_tb_arch OF ControlUnit_tb IS
  
	COMPONENT controlUnit_entity 
		PORT
		(
			-- Input ports
			I_clock		 		: in	STD_LOGIC;
			I_switchState	 	: in	STD_LOGIC;
			I_reset	 			: in	STD_LOGIC;

			-- Output ports
			O_output	 		: out	STD_LOGIC_VECTOR(1 downto 0)
		);
	END COMPONENT ; 
  
	-- Signal definitions
	signal I_clock		 		: STD_LOGIC;
	signal I_switchState	 	: STD_LOGIC;
	signal I_reset	 			: STD_LOGIC;
	signal O_output	 			: STD_LOGIC_VECTOR(1 downto 0);
  
	-- Clock period definitions
	constant clk_period 		: TIME := 10 ns;
	
BEGIN
	DUT  : controlUnit_entity  
	PORT MAP 
	( 
		I_clock   => I_clock  ,
		I_switchState   => I_switchState  ,
		I_reset   => I_reset  ,
		O_output   => O_output  
	); 



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
		wait for clk_period*10;
		

		-- Switch state 10 times
		I_switchState <= '1';
		wait for clk_period*10;		

		-- Do not switch state 
		I_switchState <= '0';
		wait for clk_period;

		-- Reset state 
		I_reset <= '1';
		wait for clk_period;
		I_reset <= '0';
		
		-- Switch state 10 times
		I_switchState <= '1';
		wait for clk_period*10;
				
		-- Reset while switching states
		I_reset <= '1';
		wait for clk_period;
		I_reset <= '0';
		
		-- Switch state 10 times
		I_switchState <= '1';
		wait for clk_period*10;

		wait;
	end process;
END;
