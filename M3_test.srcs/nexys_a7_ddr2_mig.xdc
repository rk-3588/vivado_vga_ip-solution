# Nexys A7-100T DDR2 SDRAM Pin Constraints
# Based on Digilent Nexys A7 Schematic Rev. C
# Device: XC7A100T-1CSG324C
# Memory: MT47H64M16HR-25E (128MB, x16, DDR2-800)

######################################################################################
# DDR2 SDRAM - Bank 34 & 35 (Data + Some Control)
######################################################################################

## Data Bus DQ[15:0] - x16 configuration
# Bank 34: DQ[0:7]
set_property -dict {PACKAGE_PIN R7  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[0]}]
set_property -dict {PACKAGE_PIN V6  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[1]}]
set_property -dict {PACKAGE_PIN R8  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[2]}]
set_property -dict {PACKAGE_PIN U7  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[3]}]
set_property -dict {PACKAGE_PIN V7  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[4]}]
set_property -dict {PACKAGE_PIN R6  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[5]}]
set_property -dict {PACKAGE_PIN U6  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[6]}]
set_property -dict {PACKAGE_PIN R5  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[7]}]

# Bank 35: DQ[8:15]
set_property -dict {PACKAGE_PIN T5  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[8]}]
set_property -dict {PACKAGE_PIN U3  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[9]}]
set_property -dict {PACKAGE_PIN V5  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[10]}]
set_property -dict {PACKAGE_PIN U4  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[11]}]
set_property -dict {PACKAGE_PIN V4  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[12]}]
set_property -dict {PACKAGE_PIN T4  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[13]}]
set_property -dict {PACKAGE_PIN V1  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[14]}]
set_property -dict {PACKAGE_PIN T3  IOSTANDARD SSTL18_II} [get_ports {ddr2_dq[15]}]

## Data Strobes DQS (Differential)
# Bank 34: Lower byte
set_property -dict {PACKAGE_PIN V9  IOSTANDARD DIFF_SSTL18_II} [get_ports {ddr2_dqs_p[0]}]
set_property -dict {PACKAGE_PIN V8  IOSTANDARD DIFF_SSTL18_II} [get_ports {ddr2_dqs_n[0]}]

# Bank 35: Upper byte
set_property -dict {PACKAGE_PIN U2  IOSTANDARD DIFF_SSTL18_II} [get_ports {ddr2_dqs_p[1]}]
set_property -dict {PACKAGE_PIN V2  IOSTANDARD DIFF_SSTL18_II} [get_ports {ddr2_dqs_n[1]}]

## Data Mask
set_property -dict {PACKAGE_PIN T6  IOSTANDARD SSTL18_II} [get_ports {ddr2_dm[0]}]
set_property -dict {PACKAGE_PIN U1  IOSTANDARD SSTL18_II} [get_ports {ddr2_dm[1]}]

######################################################################################
# DDR2 SDRAM - Bank 15 & 35 (Address/Control)
######################################################################################

## Address Bus ADDR[12:0]
set_property -dict {PACKAGE_PIN M4  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[0]}]
set_property -dict {PACKAGE_PIN P4  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[1]}]
set_property -dict {PACKAGE_PIN M6  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[2]}]
set_property -dict {PACKAGE_PIN T1  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[3]}]
set_property -dict {PACKAGE_PIN L3  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[4]}]
set_property -dict {PACKAGE_PIN P5  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[5]}]
set_property -dict {PACKAGE_PIN M2  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[6]}]
set_property -dict {PACKAGE_PIN N1  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[7]}]
set_property -dict {PACKAGE_PIN L4  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[8]}]
set_property -dict {PACKAGE_PIN N5  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[9]}]
set_property -dict {PACKAGE_PIN R2  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[10]}]
set_property -dict {PACKAGE_PIN K5  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[11]}]
set_property -dict {PACKAGE_PIN N6  IOSTANDARD SSTL18_II} [get_ports {ddr2_addr[12]}]

## Bank Address BA[2:0] - 修正后
set_property -dict {PACKAGE_PIN P2  IOSTANDARD SSTL18_II} [get_ports {ddr2_ba[0]}]  # DDR_BA0
set_property -dict {PACKAGE_PIN P3  IOSTANDARD SSTL18_II} [get_ports {ddr2_ba[1]}]  # DDR_BA1
set_property -dict {PACKAGE_PIN R1  IOSTANDARD SSTL18_II} [get_ports {ddr2_ba[2]}]  # DDR_BA2

## Control Signals - Bank 34
set_property -dict {PACKAGE_PIN K6  IOSTANDARD SSTL18_II} [get_ports {ddr2_cs_n[0]}]
set_property -dict {PACKAGE_PIN N4  IOSTANDARD SSTL18_II} [get_ports {ddr2_ras_n}]
set_property -dict {PACKAGE_PIN L1  IOSTANDARD SSTL18_II} [get_ports {ddr2_cas_n}]
set_property -dict {PACKAGE_PIN N2  IOSTANDARD SSTL18_II} [get_ports {ddr2_we_n}]
set_property -dict {PACKAGE_PIN M1  IOSTANDARD SSTL18_II} [get_ports {ddr2_cke[0]}]
set_property -dict {PACKAGE_PIN M3  IOSTANDARD SSTL18_II} [get_ports {ddr2_odt[0]}]

## Clock (Differential) - Bank 15
set_property -dict {PACKAGE_PIN L6  IOSTANDARD DIFF_SSTL18_II} [get_ports {ddr2_ck_p[0]}]
set_property -dict {PACKAGE_PIN L5  IOSTANDARD DIFF_SSTL18_II} [get_ports {ddr2_ck_n[0]}]