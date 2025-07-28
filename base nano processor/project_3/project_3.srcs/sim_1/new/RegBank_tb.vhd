library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.Bus_System.ALL;

entity RegBank_tb is
end RegBank_tb;

architecture Behavioral of RegBank_tb is
    -- Component Declaration
    component RegBank
        Port (RegSel  : in STD_LOGIC_VECTOR (2 downto 0);
              Clk     : in STD_LOGIC;
              En      : in STD_LOGIC;
              Reset   : in STD_LOGIC;
              Data_IN : in STD_LOGIC_VECTOR (3 downto 0);
              Data_Bus: out BUS_8_4bit);
    end component;

    -- Signals
    signal RegSel_tb   : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal Clk_tb      : STD_LOGIC := '0';
    signal En_tb       : STD_LOGIC := '0';
    signal Reset_tb    : STD_LOGIC := '0';
    signal Data_IN_tb  : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal Data_Bus_tb : BUS_8_4bit;

    -- Clock Period
    constant Clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut : RegBank
        port map (
            RegSel  => RegSel_tb,
            Clk     => Clk_tb,
            En      => En_tb,
            Reset   => Reset_tb,
            Data_IN => Data_IN_tb,
            Data_Bus => Data_Bus_tb
        );

    -- Clock process
    Clk_process : process
    begin
        Clk_tb <= '0';
        wait for Clk_period / 2;
        Clk_tb <= '1';
        wait for Clk_period / 2;
    end process;

    -- Stimulus process
    stim_proc : process
    begin
        -- Reset the register bank
        Reset_tb <= '1';
        wait for Clk_period;
        Reset_tb <= '0';

        -- Write data to register 1
        RegSel_tb <= "001";
        Data_IN_tb <= "1010";
        En_tb <= '1';
        wait for Clk_period;
        En_tb <= '0';

        -- Write data to register 2
        RegSel_tb <= "010";
        Data_IN_tb <= "0101";
        En_tb <= '1';
        wait for Clk_period;
        En_tb <= '0';

        -- Read data from register 1
        RegSel_tb <= "001";
        En_tb <= '1';
        wait for Clk_period;
        En_tb <= '0';

        -- Read data from register 2
        RegSel_tb <= "010";
        En_tb <= '1';
        wait for Clk_period;
        En_tb <= '0';

        wait; -- Wait forever
    end process;

end Behavioral;