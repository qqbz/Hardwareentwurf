-- Quartus Prime VHDL Template
-- Four-state Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (state
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity controlUnit_entity is

	port(
		-- Input ports
		I_clock		 		: in	std_logic;
		I_switchState	 	: in	std_logic;
		I_reset	 			: in	std_logic;
		
		-- Output ports
		O_output	 		: out	std_logic_vector(5 downto 0)
	);

end entity;

architecture controlUnit_arch of controlUnit_entity is

	-- Build an enumerated type for the state machine
	type T_state is (s0, s1, s2, s3);

	-- Register to hold the current state
	signal S_state : T_state;

begin

	-- Logic to advance to the next state
	process (I_clock, I_reset)
	begin
		if I_reset = '1' then
			S_state <= s0;
		elsif (rising_edge(I_clock)) then
			case S_state is
				when s0=>
					if I_switchState = '1' then
						S_state <= s1;
					else
						S_state <= s0;
					end if;
				when s1=>
					if I_switchState = '1' then
						S_state <= s2;
					else
						S_state <= s1;
					end if;
				when s2=>
					if I_switchState = '1' then
						S_state <= s3;
					else
						S_state <= s2;
					end if;
				when s3 =>
					if I_switchState = '1' then
						S_state <= s1;
					else
						S_state <= s3;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (S_state)
	begin
		case S_state is
			when s0 =>
				O_output <= "000000"; -- Restart
			when s1 =>
				O_output <= "001001"; -- PC and MemoryRead
			when s2 =>
				O_output <= "010010"; -- ROM and ALU
			when s3 =>
				O_output <= "101100"; -- Decoder and MemoryWrite
		end case;
	end process;

end controlUnit_arch;
