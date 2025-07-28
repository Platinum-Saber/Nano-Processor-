library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.ALL;
use WORK.Bus_System.ALL;

entity Mux_3_4bit is
    port ( 
           D: in BUS_3_4bit;
           S : in STD_LOGIC_VECTOR(1 downto 0);
             --EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(3 downto 0));
end Mux_3_4bit;

architecture Behavioral of Mux_3_4bit is
begin

Y <= D(TO_INTEGER(UNSIGNED(S)));
--    process(D, S, EN)
--    begin
--        if (EN = '1') then
--            if (S = "00") then
--                Y <= D(0);
--            else if (S = "01") then
--                Y <= D(1);
--            else if(S = "10") then
--                Y <= D(2);
--            end if;
--            end if;
--            end if;
--        else
--            Y <= "0000";
--        end if;
--    end process;
end Behavioral;