library IEEE;
use IEEE.STD_LOGIC_1164.all;

package common is

constant FLAG_BIT_NEGATIVE: 				INTEGER := 2;
constant FLAG_BIT_ZERO: 					INTEGER := 1;
constant FLAG_BIT_CARRY:					INTEGER := 0;

-- Opcodes

-- Inherent
constant OPCODE_NOP:    					STD_LOGIC_VECTOR(7 downto 0) :=  "00000000"; -- tested

constant OPCODE_CLEAR_ACCU:    				STD_LOGIC_VECTOR(7 downto 0) :=  "00000001"; -- tested
constant OPCODE_CLEAR_NEGATIVE_FLAG:		STD_LOGIC_VECTOR(7 downto 0) :=  "00000010"; -- tested
constant OPCODE_CLEAR_ZERO_FLAG:    		STD_LOGIC_VECTOR(7 downto 0) :=  "00000011"; -- tested
constant OPCODE_CLEAR_CARRY_FLAG:   		STD_LOGIC_VECTOR(7 downto 0) :=  "00000100"; -- tested
constant OPCODE_SET_NEGATIVE_FLAG:   		STD_LOGIC_VECTOR(7 downto 0) :=  "00000101"; -- tested
constant OPCODE_SET_ZERO_FLAG:    			STD_LOGIC_VECTOR(7 downto 0) :=  "00000110"; -- tested
constant OPCODE_SET_CARRY_FLAG:    			STD_LOGIC_VECTOR(7 downto 0) :=  "00000111"; -- tested

-- Add
-- Immediate
constant OPCODE_ADDI:    					STD_LOGIC_VECTOR(7 downto 0) :=  "00010000"; -- tested
-- Direct
constant OPCODE_ADDD:						STD_LOGIC_VECTOR(7 downto 0) :=  "00010001"; -- tested
-- Register Indirect
constant OPCODE_ADDR:    					STD_LOGIC_VECTOR(7 downto 0) :=  "00010010";

-- Sub
-- Immediate
constant OPCODE_SUBI:    					STD_LOGIC_VECTOR(7 downto 0) :=  "00100000"; -- tested
-- Direct
constant OPCODE_SUBD:						STD_LOGIC_VECTOR(7 downto 0) :=  "00100001"; -- tested
-- Register Indirect
constant OPCODE_SUBR:    					STD_LOGIC_VECTOR(7 downto 0) :=  "00100010";

-- Move
-- Immediate
constant OPCODE_MOVI:    					STD_LOGIC_VECTOR(7 downto 0) :=  "00110000"; -- tested
-- Direct
constant OPCODE_MOVD:						STD_LOGIC_VECTOR(7 downto 0) :=  "00110001"; -- tested

-- Jump
-- Immediate
constant OPCODE_JMPI:    					STD_LOGIC_VECTOR(7 downto 0) :=  "10000000"; -- tested
-- Direct
constant OPCODE_JMPD:						STD_LOGIC_VECTOR(7 downto 0) :=  "10000001"; -- tested
-- Register Indirect
constant OPCODE_JMPR:    					STD_LOGIC_VECTOR(7 downto 0) :=  "10000010";

-- Jump Negative
-- Immediate
constant OPCODE_JMPNI:    					STD_LOGIC_VECTOR(7 downto 0) :=  "11000000"; -- tested
-- Direct
constant OPCODE_JMPND:						STD_LOGIC_VECTOR(7 downto 0) :=  "11000001"; -- tested
-- Register Indirect
constant OPCODE_JMPNR:    					STD_LOGIC_VECTOR(7 downto 0) :=  "11000010";

-- Jump Zero
-- Immediate
constant OPCODE_JMPZI:    					STD_LOGIC_VECTOR(7 downto 0) :=  "10100000"; -- tested
-- Direct
constant OPCODE_JMPZD:						STD_LOGIC_VECTOR(7 downto 0) :=  "10100001"; -- tested
-- Register Indirect
constant OPCODE_JMPZR:    					STD_LOGIC_VECTOR(7 downto 0) :=  "10100010";




end common;


package body common is

end common;