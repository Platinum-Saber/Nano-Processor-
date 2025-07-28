library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.Bus_System.all;

entity program_counter_tb is
end program_counter_tb;

architecture behavioral of program_counter_tb is
    component program_counter
        port (
            clk : in std_logic;
            reset : in std_logic;
            nextaddress : out std_logic_vector(2 downto 0);
            jump_flag : in std_logic;
            address_to_jump : in std_logic_vector(2 downto 0)
        );
    end component;

    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal nextaddress : std_logic_vector(2 downto 0);
    signal jump_flag : std_logic := '0';
    signal address_to_jump : std_logic_vector(2 downto 0) := (others => '0');

    constant clock_period : time := 10 ns;
begin
    uut : program_counter
        port map (
            clk => clk,
            reset => reset,
            nextaddress => nextaddress,
            jump_flag => jump_flag,
            address_to_jump => address_to_jump
        );

    clk_process : process
    begin
        clk <= '0';
        wait for clock_period / 2;
        clk <= '1';
        wait for clock_period / 2;
    end process;

    test_process : process
    begin
        -- Reset the program counter
        reset <= '1';
        wait for 2 * clock_period;
        reset <= '0';

        -- Test normal operation
        wait for 6 * clock_period;
        assert nextaddress = "110" report "Normal operation test failed" severity error;

        -- Test jump operation
        jump_flag <= '1';
        address_to_jump <= "010";
        wait for clock_period;
        assert nextaddress = "010" report "Jump operation test failed" severity error;

        -- Test incrementing after jump
        jump_flag <= '0';
        wait for 3 * clock_period;
        assert nextaddress = "011" report "Increment after jump test failed" severity error;

        wait;
    end process;
end behavioral;