-- Quartus Prime VHDL Template
-- Single-Port ROM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.common.all;

entity rom_entity is

	port 
	(
		-- Input ports
		I_clock			: in  STD_LOGIC;
		I_address		: in  STD_LOGIC_VECTOR(7 downto 0);
		
		-- Output ports
		O_instruction	: out STD_LOGIC_VECTOR(15 downto 0)
	);

end entity;

architecture rom_arch of rom_entity is

	-- Build a 2-D array type for the ROM
	type T_rom is array(0 to 255) of STD_LOGIC_VECTOR(15 downto 0);
	signal S_rom : T_rom := 
	(
		OPCODE_NOP & OPCODE_NOP,
		OPCODE_NOP & OPCODE_NOP,
		OPCODE_NOP & OPCODE_NOP,
		OPCODE_NOP & OPCODE_NOP,
		OPCODE_NOP & OPCODE_NOP,
		
		-- Load 4 into R3
		-- Test: ADDI (SUBI), MOVI
		OPCODE_ADDI & X"04", -- PC = 5
		OPCODE_MOVI & X"03",
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		-- Contents: R3:4
		
		-- Load 15 and subtract content of R3 (4), store result in R2 (11)
		-- Test: SUBD (ADDD)
		OPCODE_ADDI & X"0F", -- PC = 9
		OPCODE_SUBD & X"03",
		OPCODE_MOVI & X"02",
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		-- Contents: R2:11 R3:4
		
		-- Load 1 into R0, Add content of R3 (4), store in address in R0 (R1)
		-- Test: ADDD (SUBD), MOVD, JMPZI
		OPCODE_ADDI & X"01", -- PC = 14
		OPCODE_MOVI & X"00",
		OPCODE_ADDD & X"03",
		OPCODE_MOVD & X"00",	
		-- Conditional jump but the condition is false
		OPCODE_JMPZI & X"00", -- PC = 18
		OPCODE_JMPNI & X"00",
		OPCODE_JMPZD & X"00",
		OPCODE_JMPND & X"00", -- PC = 21
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		-- Contents: R0:1 R1:5 R2:11 R3:4
		
		-- Jump to address 0 --> Code before is forever repeated, code after is never reached
		-- Test: JMPI
--		OPCODE_JMPI & X"00", -- PC = 24
		-- Contents: R0:1 R1:5 R2:11 R3:4
		
		-- Jump to address 4 of R3 --> Code before is forever repeated, code after is never reached
		-- Test: JMPD
--		OPCODE_JMPD & X"03", -- PC = 24
		-- Contents: R0:1 R1:5 R2:11 R3:4
				
		-- Jump to address 0 --> Code before is forever repeated, code after is never reached
		-- Test: OPCODE_JMPZI
--		OPCODE_ADDI & X"00",
--		OPCODE_JMPZI & X"00", -- PC = 25
		-- Contents: R0:1 R1:5 R2:11 R3:4
		
		-- Subtract 4 from 2 and store result (-2) in R5
		-- Test: Negative numbers, SUBI
		OPCODE_ADDI & X"02", -- PC = 24
		OPCODE_SUBI & X"04",
		OPCODE_MOVI & X"05",
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		-- Contents: R0:1 R1:5 R2:11 R3:4 R5:-2
		
		-- Prepare for JMPNI jump
		OPCODE_SUBI & X"05",
		-- Jump to address 0 --> Code before is forever repeated, code after is never reached
		-- Test: JMPNI
--		OPCODE_JMPNI & X"00", -- PC = 30
		-- Contents: R0:1 R1:5 R2:11 R3:4 R5:-2		
		
		-- Add 0xFE (-5 + 0xFE(=-2) = 0xF9(=-7)), move into R10 
		OPCODE_ADDI & X"FE", -- PC = 30
		OPCODE_MOVI & X"0A",
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		-- Load 0xED into R11
		OPCODE_ADDI & X"ED",
		OPCODE_MOVI & X"0B",
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		-- Load 1 into R13 but it will be overwritten
		OPCODE_ADDI & X"01",
		OPCODE_MOVI & X"0D",
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		-- Load 2 into R14
		OPCODE_ADDI & X"02",
		OPCODE_MOVI & X"0E",
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		-- Add R13 and R14 and store in R13
		OPCODE_ADDD & X"0D",
		OPCODE_ADDD & X"0E",
		OPCODE_MOVI & X"0D",
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		OPCODE_CLEAR_ACCU & OPCODE_NOP,
		-- Contents: R0:1 R1:5 R2:11 R3:4 R5:-2
		--			 R10:F9 R11:ED R13:3 R14:2 
		
		-- Successful conditional jump to address 5 of R1
		-- Test: JMPND
--		OPCODE_SUBD & X"01",
--		OPCODE_JMPND & X"01", -- PC = 50
		-- or
		-- Test: JMPZD
--		OPCODE_ADDI & X"00",
--		OPCODE_JMPZD & X"01", -- PC = 50
		
		-- Flag operation codes (tested: conditional jumps directly afterwards work)
		OPCODE_SET_NEGATIVE_FLAG & OPCODE_NOP,
		OPCODE_SET_ZERO_FLAG & OPCODE_NOP,
		OPCODE_SET_CARRY_FLAG & OPCODE_NOP,
		OPCODE_CLEAR_NEGATIVE_FLAG & OPCODE_NOP,
		OPCODE_CLEAR_ZERO_FLAG & OPCODE_NOP,
		OPCODE_CLEAR_CARRY_FLAG & OPCODE_NOP,
		
				
		others => X"0000"
	);

begin

	process(I_clock)
	begin
	
		if(rising_edge(I_clock)) then
		
			O_instruction <= S_rom(to_integer(unsigned(I_address)));
			
		end if;
		
	end process;

end rom_arch;
