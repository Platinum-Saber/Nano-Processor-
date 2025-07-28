library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end slow_Clk;

architecture Behavioral of slow_Clk is

    signal clk_status : std_logic := '0';
    signal count : integer := 1;

begin

    process(Clk_in)
    begin
        if (rising_edge(Clk_in)) then
            count <= count + 1;
            if (count = 50000000) then
                clk_status <= not clk_status;
                Clk_out <= clk_status;
                count <= 1;
            end if;
        end if;
    end process;

end Behavioral;
