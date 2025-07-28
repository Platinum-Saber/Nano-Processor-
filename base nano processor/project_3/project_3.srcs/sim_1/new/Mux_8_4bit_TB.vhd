library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.Bus_System.ALL;

entity Mux_8_4bit_TB is
end Mux_8_4bit_TB;

architecture Behavioral of Mux_8_4bit_TB is
    component Mux_8_4bit
        port (
            D : in BUS_8_4bit;
            S : in STD_LOGIC_VECTOR(2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal D : BUS_8_4bit;
    signal S : STD_LOGIC_VECTOR(2 downto 0);
    signal EN : STD_LOGIC;
    signal Y : STD_LOGIC_VECTOR(3 downto 0);

begin
    UUT : Mux_8_4bit
        port map (
            D => D,
            S => S,
            EN => EN,
            Y => Y
        );

    stimulus : process
    begin
        -- Test case 1: S = "000", EN = '1'
        D <= ("0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000");
        S <= "000";
        EN <= '1';
        wait for 10 ns;
        assert (Y = "0001") report "Test case 1 failed" severity error;

        -- Test case 2: S = "011", EN = '1'
        D <= ("0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000");
        S <= "011";
        EN <= '1';
        wait for 10 ns;
        assert (Y = "0100") report "Test case 2 failed" severity error;

        -- Test case 3: S = "111", EN = '1'
        D <= ("0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000");
        S <= "111";
        EN <= '1';
        wait for 10 ns;
        assert (Y = "1000") report "Test case 3 failed" severity error;

        -- Test case 4: EN = '0'
        D <= ("0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000");
        S <= "010";
        EN <= '0';
        wait for 10 ns;
        assert (Y = "0000") report "Test case 4 failed" severity error;

        wait;
    end process;
end Behavioral;