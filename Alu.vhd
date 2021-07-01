library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.common.all;

entity alu_entity is

	port
	(
		-- Input ports
		I_clock				: in  STD_LOGIC;
		I_enable			: in  STD_LOGIC;
		I_opcode			: in  STD_LOGIC_VECTOR (7 downto 0);
		I_dataReg			: in  STD_LOGIC_VECTOR (7 downto 0);
		I_dataImm			: in  STD_LOGIC_VECTOR (7 downto 0);

		-- Output ports
		O_data				: out STD_LOGIC_VECTOR (7 downto 0);
		O_flags				: out STD_LOGIC_VECTOR (2 downto 0);
		O_regWriteSelect 	: out STD_LOGIC_VECTOR (7 downto 0);
		O_regWriteEnable	: out STD_LOGIC;
		O_shouldJump		: out STD_LOGIC := '0'
	);
	
end alu_entity;

architecture alu_arch of alu_entity is

begin

	process (I_clock)
	
	variable V_accu				: STD_LOGIC_VECTOR (8 downto 0) := (others => '0');
	variable V_flags			: STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
	
	begin
		if rising_edge(I_clock) and I_enable = '1' then
		
			O_regWriteEnable <= '0';
			O_shouldJump <= '0';
		
			case I_opcode is
			
				when OPCODE_CLEAR_ACCU =>					
					V_accu := (others => '0');					

				when OPCODE_CLEAR_NEGATIVE_FLAG =>					
					V_flags(FLAG_BIT_NEGATIVE) := '0';					

				when OPCODE_CLEAR_ZERO_FLAG =>					
					V_flags(FLAG_BIT_ZERO) := '0';					

				when OPCODE_CLEAR_CARRY_FLAG =>					
					V_flags(FLAG_BIT_CARRY) := '0';					

				when OPCODE_SET_NEGATIVE_FLAG =>					
					V_flags(FLAG_BIT_NEGATIVE) := '1';					

				when OPCODE_SET_ZERO_FLAG =>					
					V_flags(FLAG_BIT_ZERO) := '1';					

				when OPCODE_SET_CARRY_FLAG =>				
					V_flags(FLAG_BIT_CARRY) := '1';	
			
				when OPCODE_ADDI | OPCODE_ADDD | OPCODE_ADDR =>
				
					-- Perform addition; I_data has to be sign-extended for that					
					if I_opcode = OPCODE_ADDI then
						V_accu := std_logic_vector(signed(V_accu) + signed(I_dataImm(7) & I_dataImm));
					elsif I_opcode = OPCODE_ADDD then
						V_accu := std_logic_vector(signed(V_accu) + signed(I_dataReg(7) & I_dataReg));
					else -- I_opcode = OPCODE_ADDR
						-- ToDo
					end if;
					
					-- Set carry flag if sign bit changes because of over-/underflow
					if V_accu(8) = '0' then -- positiv case
						V_flags(FLAG_BIT_CARRY) := V_accu(7);
					else -- negative case
						V_flags(FLAG_BIT_CARRY) := not V_accu(7);
					end if;
					
					-- Set zero flag
					if V_accu = "000000000" then
						V_flags(FLAG_BIT_ZERO) := '1';
					else
						V_flags(FLAG_BIT_ZERO) := '0';
					end if;
					
					-- Set negative flag
					V_flags(FLAG_BIT_NEGATIVE) := V_accu(8);
										
				when OPCODE_SUBI | OPCODE_SUBD | OPCODE_SUBR =>
					
					if I_opcode = OPCODE_SUBI then
						V_accu := std_logic_vector(signed(V_accu) - signed(I_dataImm(7) & I_dataImm));
					elsif I_opcode = OPCODE_SUBD then
						V_accu := std_logic_vector(signed(V_accu) - signed(I_dataReg(7) & I_dataReg));
					else -- I_opcode = OPCODE_SUBR
						-- ToDo
					end if;	
					
					-- Set carry flag if sign bit changes because of over-/underflow
					if V_accu(8) = '0' then
						V_flags(FLAG_BIT_CARRY) := V_accu(7);
					else
						V_flags(FLAG_BIT_CARRY) := not V_accu(7);
					end if;
					
					-- Set zero flag
					if V_accu = "000000000" then
						V_flags(FLAG_BIT_ZERO) := '1';
					else
						V_flags(FLAG_BIT_ZERO) := '0';
					end if;
					
					-- Set negative flag
					V_flags(FLAG_BIT_NEGATIVE) := V_accu(8);
								
				when OPCODE_MOVI | OPCODE_MOVD =>
				
					O_regWriteEnable <= '1';
					if I_opcode = OPCODE_MOVI then
						O_regWriteSelect <= I_dataImm;
					else -- I_opcode = OPCODE_MOVD
						O_regWriteSelect <= I_dataReg;
					end if;					
					
				when OPCODE_JMPI | OPCODE_JMPD | OPCODE_JMPR =>
				
					O_shouldJump <= '1';
					if I_opcode = OPCODE_JMPI then
						V_accu := '0' & I_dataImm;
					elsif I_opcode = OPCODE_JMPD then
						V_accu := '0' & I_dataReg;
					else -- I_opcode = OPCODE_JMPR
						-- ToDo
					end if;
					
				when OPCODE_JMPNI | OPCODE_JMPND | OPCODE_JMPNR =>
					
					if I_opcode = OPCODE_JMPNI then
						if V_flags(FLAG_BIT_NEGATIVE) = '1' then
							V_accu := '0' & I_dataImm;
							O_shouldJump <= '1';
						end if;	
					elsif I_opcode = OPCODE_JMPND then
						if V_flags(FLAG_BIT_NEGATIVE) = '1' then
							V_accu := '0' & I_dataReg;
							O_shouldJump <= '1';
						end if;						
					else -- I_opcode = OPCODE_JMPNR
						-- ToDo
					end if;	
				
				when OPCODE_JMPZI | OPCODE_JMPZD | OPCODE_JMPZR =>
					
					if I_opcode = OPCODE_JMPZI then
						if V_flags(FLAG_BIT_ZERO) = '1' then
							V_accu := '0' & I_dataImm;
							O_shouldJump <= '1';
						end if;	
					elsif I_opcode = OPCODE_JMPZD then
						if V_flags(FLAG_BIT_ZERO) = '1' then
							V_accu := '0' & I_dataReg;
							O_shouldJump <= '1';
						end if;						
					else -- I_opcode = OPCODE_JMPZR
						-- ToDo
					end if;				

				when others =>	
					
			end case;
			
			O_data <= V_accu(7 downto 0);
			O_flags <= V_flags;
					
		end if;
	end process;

end alu_arch;
