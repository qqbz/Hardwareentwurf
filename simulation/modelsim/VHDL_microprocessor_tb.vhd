LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY VHDL_microprocessor_tb  IS 
END ; 
 
ARCHITECTURE VHDL_microprocessor_tb_arch OF VHDL_microprocessor_tb IS
  SIGNAL clk   :  STD_LOGIC  ; 
  COMPONENT VHDL_microprocessor  
    PORT ( 
      clk  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : VHDL_microprocessor  
    PORT MAP ( 
      clk   => clk   ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 1 ns, Period = 100 ps
  Process
	Begin
	 clk  <= '0'  ;
	wait for 50 ps ;
-- 50 ps, single loop till start period.
	for Z in 1 to 9
	loop
	    clk  <= '1'  ;
	   wait for 50 ps ;
	    clk  <= '0'  ;
	   wait for 50 ps ;
-- 950 ps, repeat pattern in loop.
	end  loop;
	 clk  <= '1'  ;
	wait for 50 ps ;
-- dumped values till 1 ns
	wait;
 End Process;
END;
