----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2024 20:33:16
-- Design Name: 
-- Module Name: 4_bit_Comparator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Comparator_4_bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           EN:in std_logic;
           Equal : out STD_LOGIC;
           Greater : out STD_LOGIC;
           Smaller : out STD_LOGIC);
end Comparator_4_bit;

architecture Behavioral of Comparator_4_bit is

--begin

--Equal <= ( A(3) XNOR B(3) ) AND ( A(2) XNOR B(2) ) AND ( A(1) XNOR B(1) ) AND ( A(0) XNOR B(0) );
--AG  <= ( A(3) AND NOT B(3) ) OR (  (A(3) XNOR B(3) ) AND A(2) AND NOT B(2)) OR ((A(3) XNOR B(3)) AND (A(2) XNOR B(2))AND (A(1) AND NOT B(1))); 
--BG  <= (NOT A(3) AND B(3)) OR ((A(3) XNOR B(3)) AND NOT A(2) AND B(2)) OR ((A(3) XNOR B(3)) AND (A(2) XNOR B(2))AND (NOT A(1) AND B(1))); 
 
begin
 
Greater <= '1' when (en = '1') AND(A > B)
else '0';
Equal <= '1' when (en = '1') AND(A = B)
else '0';
Smaller <= '1' when (en = '1') AND (A < B)
else '0';

end Behavioral;