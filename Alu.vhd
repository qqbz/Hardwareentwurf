library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.common.all;

entity entity_alu is

	port
	(
		-- Input ports
		I_clock		: in  STD_LOGIC;
		I_enable		: in  STD_LOGIC;
		I_opcode		: in	STD_LOGIC_VECTOR (7 downto 0);
		I_data		: in  STD_LOGIC_VECTOR (7 downto 0);

		-- Output ports
		O_data		: out STD_LOGIC_VECTOR (7 downto 0);
		O_jump		: out	STD_LOGIC
	);
	
end entity_alu;

architecture arch_alu of entity_alu is

	-- Declarations
	signal S_accu	: STD_LOGIC_VECTOR (8 downto 0);
	signal S_flags	: STD_LOGIC_VECTOR (2 downto 0);

begin

	process (I_clock)
	begin
		if rising_edge(I_clock) and I_enable = '1' then
		
			case I_opcode(7 downto 4) is
				when OPCODE_ADD =>
				
					S_accu <= std_logic_vector(signed(S_accu) + signed(I_data(7) & I_data));
					
					if S_accu(8) = '0' then
						S_flags(FLAG_BIT_CARRY) <= S_accu(7);
					else
						
					end if;
					
					O_jump <= '0';
					
				when OPCODE_SUB =>
				
					S_accu <= std_logic_vector(signed(S_accu) - signed(I_data(7) & I_data));
					O_jump <= '0';
					
				when OPCODE_MOV =>
				
					O_data <= S_accu;
					O_jump <= '0';
					
				when OPCODE_JMP =>
				
					O_data <= I_data;
					O_jump <= '1';
				
				
				
				when others =>
					
			end case;
		end if;
	end process;

	-- Process Statement (optional)

	-- Concurrent Procedure Call (optional)

	-- Concurrent Signal Assignment (optional)

	-- Conditional Signal Assignment (optional)

	-- Selected Signal Assignment (optional)

	-- Component Instantiation Statement (optional)

	-- Generate Statement (optional)

end arch_alu;
