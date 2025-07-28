library ieee;
use ieee.std_logic_1164.all;

entity addsub4_tb is
end addsub4_tb;

architecture testbench of addsub4_tb is
    component addsub4
        port (
            a        : in  std_logic_vector(3 downto 0);
            b        : in  std_logic_vector(3 downto 0);
            sub      : in  std_logic;
            result   : out std_logic_vector(3 downto 0);
            carry_out: out std_logic;
            zero     : out std_logic
        );
    end component;

    signal a_tb        : std_logic_vector(3 downto 0);
    signal b_tb        : std_logic_vector(3 downto 0);
    signal sub_tb      : std_logic;
    signal result_tb   : std_logic_vector(3 downto 0);
    signal carry_out_tb: std_logic;
    signal zero_tb     : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut : addsub4
        port map (
            a        => a_tb,
            b        => b_tb,
            sub      => sub_tb,
            result   => result_tb,
            carry_out=> carry_out_tb,
            zero     => zero_tb
        );

    -- Stimulus process
    stim_proc : process
    begin
        -- Test cases for addition
        sub_tb <= '0';

        -- Test case 1: 0000 + 0000
        a_tb    <= "0000";
        b_tb    <= "0000";
        wait for 10 ns;
        assert result_tb = "0000" and carry_out_tb = '0' and zero_tb = '1'
            report "Test case 1 failed" severity error;

        -- Test case 2: 1010 + 0101
        a_tb    <= "1010";
        b_tb    <= "0101";
        wait for 10 ns;
        assert result_tb = "1111" and carry_out_tb = '0' and zero_tb = '0'
            report "Test case 2 failed" severity error;

        -- Test case 3: 1111 + 0001
        a_tb    <= "1111";
        b_tb    <= "0001";
        wait for 10 ns;
        assert result_tb = "0000" and carry_out_tb = '1' and zero_tb = '1'
            report "Test case 3 failed" severity error;

        -- Test cases for subtraction
        sub_tb <= '1';

        -- Test case 4: 1000 - 0010
        a_tb    <= "1000";
        b_tb    <= "0010";
        wait for 10 ns;
        assert result_tb = "0110" and carry_out_tb = '0' and zero_tb = '0'
            report "Test case 4 failed" severity error;

        -- Test case 5: 0101 - 0111
        a_tb    <= "0101";
        b_tb    <= "0111";
        wait for 10 ns;
        assert result_tb = "1110" and carry_out_tb = '1' and zero_tb = '0'
            report "Test case 5 failed" severity error;

        -- Test case 6: 0100 - 0100
        a_tb    <= "0100";
        b_tb    <= "0100";
        wait for 10 ns;
        assert result_tb = "0000" and carry_out_tb = '0' and zero_tb = '1'
            report "Test case 6 failed" severity error;

        wait; -- End the simulation
    end process;
end testbench;