-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Mon Jun 29 19:00:46 2026
-- Host        : LAPTOP-A50L20VJ running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               f:/vivado_project/M3_test/M3_test.srcs/sources_1/bd/design_1/ip/design_1_swdio_tri_buffer_0_0/design_1_swdio_tri_buffer_0_0_sim_netlist.vhdl
-- Design      : design_1_swdio_tri_buffer_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_swdio_tri_buffer_0_0_swdio_tri_buffer is
  port (
    swd_i : out STD_LOGIC;
    swd_io : inout STD_LOGIC;
    swd_o : in STD_LOGIC;
    swd_oe : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_swdio_tri_buffer_0_0_swdio_tri_buffer : entity is "swdio_tri_buffer";
end design_1_swdio_tri_buffer_0_0_swdio_tri_buffer;

architecture STRUCTURE of design_1_swdio_tri_buffer_0_0_swdio_tri_buffer is
  signal T0 : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of swd_iobuf_inst : label is "PRIMITIVE";
begin
swd_iobuf_inst: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => swd_o,
      IO => swd_io,
      O => swd_i,
      T => T0
    );
swd_iobuf_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => swd_oe,
      O => T0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_swdio_tri_buffer_0_0 is
  port (
    swd_o : in STD_LOGIC;
    swd_i : out STD_LOGIC;
    swd_oe : in STD_LOGIC;
    swd_io : inout STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_swdio_tri_buffer_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_swdio_tri_buffer_0_0 : entity is "design_1_swdio_tri_buffer_0_0,swdio_tri_buffer,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_swdio_tri_buffer_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_swdio_tri_buffer_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_swdio_tri_buffer_0_0 : entity is "swdio_tri_buffer,Vivado 2019.2";
end design_1_swdio_tri_buffer_0_0;

architecture STRUCTURE of design_1_swdio_tri_buffer_0_0 is
begin
inst: entity work.design_1_swdio_tri_buffer_0_0_swdio_tri_buffer
     port map (
      swd_i => swd_i,
      swd_io => swd_io,
      swd_o => swd_o,
      swd_oe => swd_oe
    );
end STRUCTURE;
