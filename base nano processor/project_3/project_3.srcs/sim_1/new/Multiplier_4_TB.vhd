library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiplier_4_TB is
end Multiplier_4_TB;

architecture Behavioral of Multiplier_4_TB is

    component Multiplier_4 is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal Y : STD_LOGIC_VECTOR(7 downto 0);

begin

    UUT : Multiplier_4
        port map (
            A => A,
            B => B,
            Y => Y
        );

    stim_proc : process
    begin
        -- Test case 1: A = 4, B = 3
        A <= "0100";
        B <= "0011";
        wait for 10 ns;
        assert Y = "00001100" report "Test case 1 failed" severity error;

        -- Test case 2: A = 7, B = 8
        A <= "0111";
        B <= "1000";
        wait for 10 ns;
        assert Y = "00111000" report "Test case 2 failed" severity error;

        -- Test case 3: A = 15, B = 15
        A <= "1111";
        B <= "1111";
        wait for 10 ns;
        assert Y = "11100001" report "Test case 3 failed" severity error;

        wait;
    end process;

end Behavioral;