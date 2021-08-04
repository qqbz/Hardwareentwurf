library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_entity is

	port
	(
		-- Input ports
		I_enable			: in  STD_LOGIC;
		I_clock		 		: in  STD_LOGIC;
		I_jump				: in  STD_LOGIC;
		I_newAddress		: in  STD_LOGIC_VECTOR (7 downto 0);
		
		-- Output ports
		O_programCounter	: out STD_LOGIC_VECTOR (7 downto 0) := X"00"
	);
	
end pc_entity;


architecture pc_arch of pc_entity is

begin

	process (I_clock, I_enable)
	
	variable V_programCounter	: STD_LOGIC_VECTOR (7 downto 0) := X"00";

	begin
	
		if (rising_edge(I_clock) and I_enable = '1') then
				
			if I_jump = '1' then
				V_programCounter := I_newAddress;
			else
				V_programCounter := std_logic_vector(unsigned(V_programCounter) + 1);
			end if;	
			
			O_programCounter <= V_programCounter;
			
		end if;
		
	end process;

end pc_arch;
