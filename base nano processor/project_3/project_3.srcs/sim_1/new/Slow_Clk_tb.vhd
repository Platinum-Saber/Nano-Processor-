library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Slow_Clk_tb is
end Slow_Clk_tb;

architecture Behavioral of Slow_Clk_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component Slow_Clk
        Port ( Clk_in : in STD_LOGIC;
               Clk_out : out STD_LOGIC);
    end component;

    -- Input signal declaration
    signal Clk_in : std_logic := '0';

    -- Output signal declaration
    signal Clk_out : std_logic;

    -- Clock period definitions
    constant clk_period : time := 10 ns; -- 100 MHz clock

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Slow_Clk port map (
        Clk_in => Clk_in,
        Clk_out => Clk_out
    );

    -- Clock process definition
    clk_process: process
    begin
        Clk_in <= '0';
        wait for clk_period/2;
        Clk_in <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Wait for some time to allow the clock to stabilize
        wait for 100 ns;

        -- Check if the output clock is half the frequency of the input clock
        for i in 1 to 10 loop
            wait until rising_edge(Clk_out);
            wait for clk_period;
        end loop;

        -- Finish the simulation
        wait;
    end process;

end Behavioral;