library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.Bus_System.ALL;

entity Mux_2_3bit is
    port (
           D: in BUS_2_3bit;
           S : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(2 downto 0));
end Mux_2_3bit;

architecture Behavioral of Mux_2_3bit is
signal D0: STD_LOGIC_VECTOR(2 downto 0);
signal D1: STD_LOGIC_VECTOR(2 downto 0);



begin
    D0 <= D(0);
    D1 <= D(1);
    
    process(D0,D1, S, EN)
    
    begin
        if (EN = '1') then
            if (S = '0') then
                Y <=D0;
            else if (S='1') then
                Y <= D1;
            end if;
            end if;
        else
            Y<="000";
        end if;
    end process;
end Behavioral;