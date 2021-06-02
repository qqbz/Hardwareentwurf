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
		O_data		: out STD_LOGIC_VECTOR (7 downto 0) := X"00";
		O_flags		: out STD_LOGIC_VECTOR (2 downto 0) := "000"
	);
	
end entity_alu;

architecture arch_alu of entity_alu is

	-- Declarations
	signal S_accu	: STD_LOGIC_VECTOR (8 downto 0);

begin

	process (I_clock)
	
	variable V_updateFlags : boolean := false;
	
	begin
		if rising_edge(I_clock) and I_enable = '1' then
		
			case I_opcode(7 downto 4) is
				when OPCODE_ADD =>
					-- Perform addition; I_data has to be sign-extended for that
					S_accu <= std_logic_vector(signed(S_accu) + signed(I_data(7) & I_data));					
					V_updateFlags := true;
					
				when OPCODE_SUB =>
				
					S_accu <= std_logic_vector(signed(S_accu) - signed(I_data(7) & I_data));
					V_updateFlags := true;
					
				when OPCODE_MOV =>
				
					O_data <= S_accu(7 downto 0);
					
				when OPCODE_JMP =>
				
					O_data <= I_data;				
				
				when others =>
				
					-- TODO:
					
			end case;
			
						
			if V_updateFlags = true then		
			
				-- Set carry flag if sign bit changes because of over-/underflow
				if S_accu(8) = '0' then
					O_flags(FLAG_BIT_CARRY) <= S_accu(7);
				else
					O_flags(FLAG_BIT_CARRY) <= not S_accu(7);
				end if;
				
				-- Set zero flag
				if S_accu = "000000000" then
					O_flags(FLAG_BIT_ZERO) <= '1';
				else
					O_flags(FLAG_BIT_ZERO) <= '0';
				end if;
				
				-- Set negative flag
				O_flags(FLAG_BIT_NEGATIVE) <= S_accu(8);
				
			end if;
					
		end if;
	end process;

end arch_alu;
