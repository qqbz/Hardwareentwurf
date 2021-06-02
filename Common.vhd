library IEEE;
use IEEE.STD_LOGIC_1164.all;

package common is

constant FLAG_BIT_NEGATIVE: 			integer := 2;
constant FLAG_BIT_ZERO: 				integer := 1;
constant FLAG_BIT_CARRY:				integer := 0;

-- Opcodes

-- Inherent
constant OPCODE_CLEAR_ACCU:    		std_logic_vector(7 downto 0) :=  "00000000";
constant OPCODE_CLEAR_NEGATIVE_FLAG:	std_logic_vector(7 downto 0) :=  "00000001";
constant OPCODE_CLEAR_ZERO_FLAG:    std_logic_vector(7 downto 0) :=  "00000010";
constant OPCODE_CLEAR_CARRY_FLAG:   std_logic_vector(7 downto 0) :=  "00000011";
constant OPCODE_SET_NEGATIVE_FLAG:   std_logic_vector(7 downto 0) :=  "00000100";
constant OPCODE_SET_ZERO_FLAG:    	std_logic_vector(7 downto 0) :=  "00000101";
constant OPCODE_SET_CARRY_FLAG:    	std_logic_vector(7 downto 0) :=  "00000110";

-- Add
constant OPCODE_ADD:						std_logic_vector(7 downto 4) :=  "0001";
-- Immediate
constant OPCODE_ADDI:    				std_logic_vector(7 downto 0) :=  "00010000";
-- Direct
constant OPCODE_ADDD:					std_logic_vector(7 downto 0) :=  "00010001";
-- Register Indirect
constant OPCODE_ADDR:    				std_logic_vector(7 downto 0) :=  "00010010";

-- Sub
constant OPCODE_SUB:						std_logic_vector(7 downto 4) :=  "0010";
-- Immediate
constant OPCODE_SUBI:    				std_logic_vector(7 downto 0) :=  "00100000";
-- Direct
constant OPCODE_SUBD:					std_logic_vector(7 downto 0) :=  "00100001";
-- Register Indirect
constant OPCODE_SUBR:    				std_logic_vector(7 downto 0) :=  "00100010";

-- Move
constant OPCODE_MOV:    				std_logic_vector(7 downto 4) :=  "0011";
-- Immediate
constant OPCODE_MOVI:    				std_logic_vector(7 downto 0) :=  "00110000";
-- Direct
constant OPCODE_MOVD:					std_logic_vector(7 downto 0) :=  "00110001";

-- Jump
constant OPCODE_JMP:    				std_logic_vector(7 downto 4) :=  "1000";
-- Immediate
constant OPCODE_JMPI:    				std_logic_vector(7 downto 0) :=  "10000000";
-- Direct
constant OPCODE_JMPD:					std_logic_vector(7 downto 0) :=  "10000001";
-- Register Indirect
constant OPCODE_JMPR:    				std_logic_vector(7 downto 0) :=  "10000010";

-- Jump Negative
-- Immediate
constant OPCODE_JMPNI:    				std_logic_vector(7 downto 0) :=  "11000000";
-- Direct
constant OPCODE_JMPND:					std_logic_vector(7 downto 0) :=  "11000001";
-- Register Indirect
constant OPCODE_JMPNR:    				std_logic_vector(7 downto 0) :=  "11000010";

-- Jump Zero
-- Immediate
constant OPCODE_JMPZI:    				std_logic_vector(7 downto 0) :=  "10100000";
-- Direct
constant OPCODE_JMPZD:					std_logic_vector(7 downto 0) :=  "10100001";
-- Register Indirect
constant OPCODE_JMPZR:    				std_logic_vector(7 downto 0) :=  "10100010";





end common;

package body common is

end common;