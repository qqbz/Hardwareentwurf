library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PROGRAM_COUNTER is

	port
	(
		-- Input ports
		I_clock		 		: in	STD_LOGIC;
		I_jump				: in 	STD_LOGIC;
		I_new_address		: in 	STD_LOGIC_VECTOR (7 downto 0);
		
		-- Output ports
		O_program_counter	: out STD_LOGIC_VECTOR (7 downto 0)
	);
	
end PROGRAM_COUNTER;


architecture PC of PROGRAM_COUNTER is

	-- Declarations
	signal S_internal_program_counter: STD_LOGIC_VECTOR (7 downto 0)  :=	X"00";

begin

	process (I_clock)
	begin
	
		if (rising_edge(I_clock)) then
		
			if I_jump = '1' then
				S_internal_program_counter <= I_new_address;
			else
				S_internal_program_counter <= std_logic_vector(unsigned(S_internal_program_counter) + 1);
			end if;
			
			O_program_counter <= S_internal_program_counter;
			
		end if;
		
	end process;

end pc;





