----------------------------------------------------------------------------------
-- Company: Ratner Engineering
-- Engineer: bryan mealy
-- 
-- Create Date:    15:27:40 05/28/2007 
-- Design Name: 
-- Module Name:    SEQ_DVR
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: This model uses the switches as the input sequence. Each
--  switch value is chosen one at a time and sent out. The corresponding 
--  LED is actuated for a sanity check. 
--
-- Dependencies: 
--
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--------------------------------------------------------------------------------

-----------------------------------------------------------------------
-----------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------------------------------------
-- Drive each of the switch inputs to the output one by one. 
--------------------------------------------------------------
entity SEQ2 is
    Port (      CLK : in std_logic;   
           SWITCHES : in std_logic_vector(7 downto 0); 
                  X : out std_logic);
end SEQ2;

-------------------------------------------------------------
-- description of ssegment decoder
-------------------------------------------------------------
architecture SEQ2 of SEQ2 is

   -- intermediate signal declaration -----------------------
   signal   cnt_dig : std_logic_vector(2 downto 0); 

begin

   -- advance the count (used for display multiplexing) -----
   process (CLK)
   begin
      if (rising_edge(CLK)) then 
         cnt_dig <= cnt_dig + 1; 
      end if; 
   end process; 

   with cnt_dig select
	X <= SWITCHES(7) when "011",
	     SWITCHES(6) when "010",
	     SWITCHES(5) when "001",
	     SWITCHES(4) when "000",
	     '0' when others; 
	     


         
end SEQ2;
