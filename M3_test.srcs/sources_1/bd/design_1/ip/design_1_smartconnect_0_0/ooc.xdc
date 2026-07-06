# aclk {FREQ_HZ 83333333 CLK_DOMAIN design_1_mig_7series_0_0_ui_clk PHASE 0} aclk1 {FREQ_HZ 40000000 CLK_DOMAIN /clk_wiz_0_clk_out1 PHASE 0.0}
# Clock Domain: design_1_mig_7series_0_0_ui_clk
create_clock -name aclk -period 12.000 [get_ports aclk]
# Clock Domain: /clk_wiz_0_clk_out1
create_clock -name aclk1 -period 25.000 [get_ports aclk1]
# Generated clocks
