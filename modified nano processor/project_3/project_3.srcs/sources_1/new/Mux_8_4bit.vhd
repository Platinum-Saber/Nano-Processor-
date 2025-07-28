library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.Bus_System.ALL;

entity Mux_8_4bit is
    port ( D : in BUS_8_4bit;
           S : in STD_LOGIC_VECTOR(2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(3 downto 0));
end Mux_8_4bit;

architecture Behavioral of Mux_8_4bit is
begin
    process(D, S, EN)
    begin
        if (EN = '1') then
            if (S = "000") then
                Y <= D(0);
            else if (S = "001") then
                Y <= D(1);
            else if (S = "010") then
                Y <= D(2);
            else if (S = "011") then
                Y <= D(3);
            else if (S = "100") then
                Y <= D(4);
            else if (S = "101") then
                Y <= D(5);
            else if (S = "110") then
                Y <= D(6);
            else
                Y <= D(7);
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
        else
            Y <= "0000";
        end if;
    end process;
end Behavioral;