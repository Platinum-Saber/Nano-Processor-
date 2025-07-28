library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.Bus_System.ALL;

entity Mux_2_4bit_TB is
end Mux_2_4bit_TB;

architecture Behavioral of Mux_2_4bit_TB is
    component Mux_2_4bit
        port (
            D : in BUS_2_4bit;
            S : in STD_LOGIC;
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal D : BUS_2_4bit;
    signal S : STD_LOGIC;
    signal EN : STD_LOGIC;
    signal Y : STD_LOGIC_VECTOR(3 downto 0);

begin
    UUT : Mux_2_4bit
        port map (
            D => D,
            S => S,
            EN => EN,
            Y => Y
        );

    stimulus : process
    begin
        -- Test case 1: S = '0', EN = '1'
        D <= ("0001", "0010");
        S <= '0';
        EN <= '1';
        wait for 10 ns;
        assert (Y = "0001") report "Test case 1 failed" severity error;

        -- Test case 2: S = '1', EN = '1'
        D <= ("0001", "0010");
        S <= '1';
        EN <= '1';
        wait for 10 ns;
        assert (Y = "0010") report "Test case 2 failed" severity error;

        -- Test case 3: EN = '0'
        D <= ("0001", "0010");
        S <= '0';
        EN <= '0';
        wait for 10 ns;
        assert (Y = "0000") report "Test case 3 failed" severity error;

        wait;
    end process;
end Behavioral;