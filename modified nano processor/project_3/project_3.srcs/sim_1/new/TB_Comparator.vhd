----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2024 20:44:41
-- Design Name: 
-- Module Name: TB_Comparator - Behavioral
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

entity TB_Comparator is
--  Port ( );
end TB_Comparator;

architecture Behavioral of TB_Comparator is
Component Comparator_4_bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Equal : out STD_LOGIC;
           Greater : out STD_LOGIC;
           Smaller : out STD_LOGIC);
End Component;

SIGNAL A,B : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Equal,Greater,Smaller: STD_LOGIC;

begin
UUT : Comparator_4_bit
Port Map( A => A,
          B => B,
          Equal => Equal,
          Greater => Greater,
          Smaller => Smaller);

process
begin        
--Initialize all values to 0
A <= "0000";
B <= "0000";

WAIT FOR 100ns;
A <= "0001";
B <= "0000";

WAIT FOR 100ns;
A <= "0000";
B <= "0001";

WAIT FOR 100ns;
A <= "0001";
B <= "0001";

WAIT FOR 100ns;
A <= "1000";
B <= "1001";

WAIT FOR 100ns;

A <= "1000";
B <= "0001";

WAIT; -- Will wait forever

end process;

end Behavioral;