-- ====================================================================
-- 256 register/memory with 8bit
-- ====================================================================

-- libraries decleration
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity memory_entity is
	port
	(
		-- Input ports
		I_clock				: in STD_LOGIC;
		I_enable			: in STD_LOGIC;
		I_regReadSelect		: in STD_LOGIC_VECTOR (7 downto 0);
		I_regWriteSelect	: in STD_LOGIC_VECTOR (7 downto 0);
		I_regWriteData		: in STD_LOGIC_VECTOR (7 downto 0);
		I_writeEnable		: in STD_LOGIC;

		-- Output ports
		O_regReadData		: out STD_LOGIC_VECTOR (7 downto 0)
	);
end memory_entity;

architecture memory_arch of memory_entity is

	-- Declarations
	type T_mem is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	signal S_mem: T_mem := (others => X"00");

begin

	-- Process Statement
	process(I_clock, I_enable)
	begin
		
		if rising_edge(I_clock) and I_enable = '1' then
				
			O_regReadData <= S_mem(to_integer(unsigned(I_regReadSelect)));
			
			if I_writeEnable = '1' then
				
				S_mem(to_integer(unsigned(I_regWriteSelect))) <= I_regWriteData;
				
			end if;
			
		end if;
		
	end process;

end memory_arch;
