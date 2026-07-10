# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DIGIT_X" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DIGIT_Y" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SCALE" -parent ${Page_0}


}

proc update_PARAM_VALUE.DIGIT_X { PARAM_VALUE.DIGIT_X } {
	# Procedure called to update DIGIT_X when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DIGIT_X { PARAM_VALUE.DIGIT_X } {
	# Procedure called to validate DIGIT_X
	return true
}

proc update_PARAM_VALUE.DIGIT_Y { PARAM_VALUE.DIGIT_Y } {
	# Procedure called to update DIGIT_Y when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DIGIT_Y { PARAM_VALUE.DIGIT_Y } {
	# Procedure called to validate DIGIT_Y
	return true
}

proc update_PARAM_VALUE.SCALE { PARAM_VALUE.SCALE } {
	# Procedure called to update SCALE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SCALE { PARAM_VALUE.SCALE } {
	# Procedure called to validate SCALE
	return true
}


proc update_MODELPARAM_VALUE.DIGIT_X { MODELPARAM_VALUE.DIGIT_X PARAM_VALUE.DIGIT_X } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DIGIT_X}] ${MODELPARAM_VALUE.DIGIT_X}
}

proc update_MODELPARAM_VALUE.DIGIT_Y { MODELPARAM_VALUE.DIGIT_Y PARAM_VALUE.DIGIT_Y } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DIGIT_Y}] ${MODELPARAM_VALUE.DIGIT_Y}
}

proc update_MODELPARAM_VALUE.SCALE { MODELPARAM_VALUE.SCALE PARAM_VALUE.SCALE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SCALE}] ${MODELPARAM_VALUE.SCALE}
}

