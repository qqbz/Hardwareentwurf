library ieee;
use ieee.std_logic_1164.all;

entity entity_decoder is

	port
	(
		-- Input ports
		I_clock			: in  STD_LOGIC;
		I_enable			: in  STD_LOGIC;
		I_instruction 	: in  STD_LOGIC_VECTOR (15 downto 0);
		
		-- Output ports
		O_opcode			: out STD_LOGIC_VECTOR (7 downto 0);
		O_data			: out STD_LOGIC_VECTOR (7 downto 0)
	);
	
end entity_decoder;

architecture arch_decoder of entity_decoder is

	-- Declarations

begin

	process (I_clock)
	begin
		
		if rising_edge(I_clock) and I_enable = '1' then
		
			O_opcode <= I_instruction(15 downto 8);
			O_data <= I_instruction(7 downto 0);
		
		end if;
		
	end process;

end arch_decoder;
