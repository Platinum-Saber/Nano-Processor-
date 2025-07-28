library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.ALL;
use WORK.Bus_System.ALL;

entity Mux_3_4bit_tb is
end Mux_3_4bit_tb;

architecture Behavioral of Mux_3_4bit_tb is
    signal s_D : BUS_3_4bit := (others => (others => '0'));
    signal s_S : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
    signal s_Y : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    --signal EN:std_logic;
    component Mux_3_4bit is
        port (
            D : in BUS_3_4bit;
            S : in STD_LOGIC_VECTOR(1 downto 0);
            --EN:in STD_logic;
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

begin
    uut : Mux_3_4bit port map (
        D => s_D,
        S => s_S,
        Y => s_Y
    );

    stim_proc : process
    begin
        
        -- Test case 1: Select D(0)
        s_D <= (X"1", X"2", X"3");
        s_S <= "00";
        wait for 10 ns;
        assert s_Y = X"1" report "Test case 1 failed" severity error;

        -- Test case 2: Select D(1)
        s_S <= "01";
        wait for 10 ns;
        assert s_Y = X"2" report "Test case 2 failed" severity error;
        
        -- Test case 3: Select D(2)
        s_S <= "10";
        wait for 10 ns;
        assert s_Y = X"3" report "Test case 3 failed" severity error;

        -- Test case 4: Invalid selection
        s_S <= "11";
        wait for 10 ns;
        assert s_Y = X"0" report "Test case 4 failed" severity error;

        report "All tests passed";
        wait;
    end process;
end Behavioral;