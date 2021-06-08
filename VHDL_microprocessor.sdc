# Created file and insert template due to compilation warnings:
# "Synopsys Design Constraints File file not found: 'VHDL_microprocessor.sdc'. 
# A SDC File is req. by the TimeQuest Timing Analyzer to get proper timing..."

# TimeQuest -> SDC Commands -> Clocks -> Auto-Generated PLL Clocks
derive_pll_clocks

# TimeQuest -> SDC Commands -> Clocks -> Simple 50/50 Clock
# Orginal: create_clock -name __name -period __period [get_ports __port]
create_clock -period 1 [get_ports clk]

# TimeQuest -> SDC Commands -> Clock Attributes -> Clock Uncertainty
derive_clock_uncertainty