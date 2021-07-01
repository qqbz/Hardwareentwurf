library ieee;
use ieee.std_logic_1164.all;
entity decoder_entity is

	port
	(
		-- Input ports
		I_clock			: in  STD_LOGIC;
		I_enable		: in  STD_LOGIC;
		I_instruction 	: in  STD_LOGIC_VECTOR (15 downto 0);
		
		-- Output ports
		O_opcode		: out STD_LOGIC_VECTOR (7 downto 0);
		O_dataImmediate	: out STD_LOGIC_VECTOR (7 downto 0);
		O_regAddress	: out STD_LOGIC_VECTOR (7 downto 0)
	);
	
end decoder_entity;

architecture decoder_arch of decoder_entity is

begin

	process (I_clock)
	begin
		
		if rising_edge(I_clock) and I_enable = '1' then
		
			O_opcode <= I_instruction(15 downto 8);
			O_dataImmediate <= I_instruction(7 downto 0);
			O_regAddress <= I_instruction(7 downto 0);
		
		end if;
		
	end process;

end decoder_arch;
