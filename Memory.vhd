-- ====================================================================
-- 256 register/memory with 8bit
-- ====================================================================

-- libraries decleration
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity entity_memory is
	port
	(
		-- Input ports
		I_clock			: in  STD_LOGIC;
		I_enable			: in STD_LOGIC;
		I_write_enable	: in STD_LOGIC;
		I_reg_select	: in STD_LOGIC_VECTOR (7 downto 0);
		I_reg_data		: in STD_LOGIC_VECTOR (7 downto 0);

		-- Output ports
		O_reg_data		: out STD_LOGIC_VECTOR (7 downto 0)
	);
end entity_memory;


-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture arch_memory of entity_memory is

	-- Declarations (optional)
	type T_store is array (0 to 255) of std_logic_vector(7 downto 0);
	signal S_regs: T_store := (others => X"00");

begin

	-- Process Statement (optional)
	process(I_clock)
	begin
		
		if rising_edge(I_clock) and I_enable = '1' then
		
			O_reg_data <= S_regs(to_integer(unsigned(I_reg_select)));
			
			if I_write_enable = '1' then
				
				S_regs(to_integer(unsigned(I_reg_select))) <= I_reg_data;
			
			end if;
			
		end if;
		
	end process;

end arch_memory;
