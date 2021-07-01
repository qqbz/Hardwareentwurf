LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY Memory_tb  IS 
END ; 
     
ARCHITECTURE Memory_tb_arch OF Memory_tb IS

	SIGNAL I_regData   :  std_logic_vector (7 downto 0)  ; 
	SIGNAL I_clock   :  STD_LOGIC  ; 
	SIGNAL O_regData   :  std_logic_vector (7 downto 0)  ; 
	SIGNAL I_regSelect   :  std_logic_vector (7 downto 0)  ; 
	SIGNAL I_writeEnable   :  STD_LOGIC  ; 
	SIGNAL I_enable   :  STD_LOGIC  ; 
	
	COMPONENT memory_entity  
	PORT 
	( 
		-- Input ports
		I_regData  : in std_logic_vector (7 downto 0) ; 
		I_clock  : in STD_LOGIC ; 
		I_regSelect  : in std_logic_vector (7 downto 0) ; 
		I_writeEnable  : in STD_LOGIC ; 
		I_enable  : in STD_LOGIC; 
		
		-- Output ports
		O_regData  : out std_logic_vector (7 downto 0) 
	); 
	END COMPONENT ; 
	
	-- Clock period definitions
	constant I_clk_period : time := 10 ns;
  
	BEGIN
		DUT  : memory_entity  
		PORT MAP ( 
			I_regData   => I_regData  ,
			I_clock   => I_clock  ,
			O_regData   => O_regData  ,
			I_regSelect   => I_regSelect  ,
			I_writeEnable   => I_writeEnable  ,
			I_enable   => I_enable   ) ; 



		-- Clock process definitions
		clk_process: process
		begin
			I_clock <= '0';
			wait for I_clk_period/2;
			I_clock <= '1';
			wait for I_clk_period/2;
		end process;

		-- Stimulus process
		stim_process: process
		begin
			-- hold reset state for 100 ns.
			wait for I_clk_period*10;

			I_enable <= '1';

			-- test for writing.
			-- r1 = 0x11
			I_regSelect <= X"01";
			I_regData <= X"11";
			I_writeEnable <= '1';
			wait for I_clk_period;

			-- r2 = 0x22
			I_regSelect <= X"02";
			I_regData <= X"22";
			I_writeEnable <= '1';
			wait for I_clk_period;

			-- r3 = 0x33
			I_regSelect <= X"03";
			I_regData <= X"33";
			I_writeEnable <= '1';
			wait for I_clk_period;

			--test just reading, with no write
			I_regSelect <= X"01";
			I_regData <= X"FD";
			I_writeEnable <= '0';
			wait for I_clk_period;

			--at this point r1 should not be 'fd'
			I_regSelect <= X"02";
			I_regData <= X"FD";
			I_writeEnable <= '0';
			wait for I_clk_period;

			--at this point r2 should not be 'fd'
			I_regSelect <= X"03";
			I_regData <= X"FD";
			I_writeEnable <= '0';
			wait for I_clk_period;

			--at this point r3 should not be 'fd'
			I_regSelect <= X"04";
			I_regData <= X"FD";
			I_writeEnable <= '0';
			wait for I_clk_period;
			--at this point r4 should be '00'


			-- test for writing.
			-- r1 = 0x71
			I_regSelect <= X"01";
			I_regData <= X"71";
			I_writeEnable <= '1';
			wait for I_clk_period;

			-- r2 = 0x72
			I_regSelect <= X"02";
			I_regData <= X"72";
			I_writeEnable <= '1';
			wait for I_clk_period;

			-- r3 = 0x73
			I_regSelect <= X"03";
			I_regData <= X"73";
			I_writeEnable <= '1';
			wait for I_clk_period;

			wait;
		end process;
END;
