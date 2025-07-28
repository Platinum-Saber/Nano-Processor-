library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.Bus_System.ALL;

entity Mux_2_4bit is
    port ( --D0 : in BUS_1_4bit;
            --D1 : in BUS_1_4bit;
            D: in BUS_2_4bit;
           S : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(3 downto 0));
end Mux_2_4bit;

architecture Behavioral of Mux_2_4bit is
begin
    process(D, S, EN)
    begin
        if (EN = '1') then
            if (S = '0') then
                Y <= D(0);
            else
                Y <= D(1);
            end if;
        else
            Y <= "0000";
        end if;
    end process;
end Behavioral;