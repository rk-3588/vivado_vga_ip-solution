# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "FIFO_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HREF_ACTIVE_HIGH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_ACTIVE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RGB565_BYTE_ORDER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SWAP_RB" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VSYNC_ACTIVE_HIGH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_ACTIVE" -parent ${Page_0}


}

proc update_PARAM_VALUE.FIFO_ADDR_WIDTH { PARAM_VALUE.FIFO_ADDR_WIDTH } {
	# Procedure called to update FIFO_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_ADDR_WIDTH { PARAM_VALUE.FIFO_ADDR_WIDTH } {
	# Procedure called to validate FIFO_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.HREF_ACTIVE_HIGH { PARAM_VALUE.HREF_ACTIVE_HIGH } {
	# Procedure called to update HREF_ACTIVE_HIGH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HREF_ACTIVE_HIGH { PARAM_VALUE.HREF_ACTIVE_HIGH } {
	# Procedure called to validate HREF_ACTIVE_HIGH
	return true
}

proc update_PARAM_VALUE.H_ACTIVE { PARAM_VALUE.H_ACTIVE } {
	# Procedure called to update H_ACTIVE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_ACTIVE { PARAM_VALUE.H_ACTIVE } {
	# Procedure called to validate H_ACTIVE
	return true
}

proc update_PARAM_VALUE.RGB565_BYTE_ORDER { PARAM_VALUE.RGB565_BYTE_ORDER } {
	# Procedure called to update RGB565_BYTE_ORDER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RGB565_BYTE_ORDER { PARAM_VALUE.RGB565_BYTE_ORDER } {
	# Procedure called to validate RGB565_BYTE_ORDER
	return true
}

proc update_PARAM_VALUE.SWAP_RB { PARAM_VALUE.SWAP_RB } {
	# Procedure called to update SWAP_RB when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SWAP_RB { PARAM_VALUE.SWAP_RB } {
	# Procedure called to validate SWAP_RB
	return true
}

proc update_PARAM_VALUE.VSYNC_ACTIVE_HIGH { PARAM_VALUE.VSYNC_ACTIVE_HIGH } {
	# Procedure called to update VSYNC_ACTIVE_HIGH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VSYNC_ACTIVE_HIGH { PARAM_VALUE.VSYNC_ACTIVE_HIGH } {
	# Procedure called to validate VSYNC_ACTIVE_HIGH
	return true
}

proc update_PARAM_VALUE.V_ACTIVE { PARAM_VALUE.V_ACTIVE } {
	# Procedure called to update V_ACTIVE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_ACTIVE { PARAM_VALUE.V_ACTIVE } {
	# Procedure called to validate V_ACTIVE
	return true
}


proc update_MODELPARAM_VALUE.H_ACTIVE { MODELPARAM_VALUE.H_ACTIVE PARAM_VALUE.H_ACTIVE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_ACTIVE}] ${MODELPARAM_VALUE.H_ACTIVE}
}

proc update_MODELPARAM_VALUE.V_ACTIVE { MODELPARAM_VALUE.V_ACTIVE PARAM_VALUE.V_ACTIVE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_ACTIVE}] ${MODELPARAM_VALUE.V_ACTIVE}
}

proc update_MODELPARAM_VALUE.FIFO_ADDR_WIDTH { MODELPARAM_VALUE.FIFO_ADDR_WIDTH PARAM_VALUE.FIFO_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_ADDR_WIDTH}] ${MODELPARAM_VALUE.FIFO_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.VSYNC_ACTIVE_HIGH { MODELPARAM_VALUE.VSYNC_ACTIVE_HIGH PARAM_VALUE.VSYNC_ACTIVE_HIGH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VSYNC_ACTIVE_HIGH}] ${MODELPARAM_VALUE.VSYNC_ACTIVE_HIGH}
}

proc update_MODELPARAM_VALUE.HREF_ACTIVE_HIGH { MODELPARAM_VALUE.HREF_ACTIVE_HIGH PARAM_VALUE.HREF_ACTIVE_HIGH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HREF_ACTIVE_HIGH}] ${MODELPARAM_VALUE.HREF_ACTIVE_HIGH}
}

proc update_MODELPARAM_VALUE.RGB565_BYTE_ORDER { MODELPARAM_VALUE.RGB565_BYTE_ORDER PARAM_VALUE.RGB565_BYTE_ORDER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RGB565_BYTE_ORDER}] ${MODELPARAM_VALUE.RGB565_BYTE_ORDER}
}

proc update_MODELPARAM_VALUE.SWAP_RB { MODELPARAM_VALUE.SWAP_RB PARAM_VALUE.SWAP_RB } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SWAP_RB}] ${MODELPARAM_VALUE.SWAP_RB}
}

