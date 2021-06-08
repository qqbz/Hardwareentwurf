-- ====================================================================
--
--	File Name:		VHDL_microprocessor.vhd
--	Description: FPGA_design
--	Designers:  Lukas Becker, Simon Fella
--
-- ====================================================================

-- libraries decleration
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

 -- entity Definition
entity VHDL_microprocessor is
--    generic(N: positive := 8); --defualt value for N is 8
    port (
       clk:     in  STD_LOGIC
		 );
end VHDL_microprocessor;

 -- Architecture Definition
architecture structural of VHDL_microprocessor is

	component Memory
	port (
		-- Input ports
		clk: in  STD_LOGIC;
		enable: in STD_LOGIC;
		write_enable: in STD_LOGIC;
		reg_select: in STD_LOGIC_VECTOR (7 downto 0);
		in_data: in STD_LOGIC_VECTOR (7 downto 0);
		-- Output ports
		out_data: out STD_LOGIC_VECTOR (7 downto 0)
		);
	end component;


	signal nbl : STD_LOGIC;
	signal w_nbl : STD_LOGIC;
	signal slct : STD_LOGIC_VECTOR (7 downto 0);
	signal dt : STD_LOGIC_VECTOR (7 downto 0);

	begin

		--nbl = 0;

		regs_memory: Memory port map (clk, nbl, w_nbl, slct, dt);
		
	end;

end structural;

--EndOfFile
