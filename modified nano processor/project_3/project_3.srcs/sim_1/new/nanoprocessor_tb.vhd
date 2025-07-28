library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bus_system.all;

entity nanoprocessor_tb is
end entity nanoprocessor_tb;

architecture tb of nanoprocessor_tb is
    component nanoprocessor is
        port (
            clk : in std_logic;
            reset : in std_logic;
            overflow_led : out std_logic;
            zero_led : out std_logic;
            seven_seg : out std_logic_vector(6 downto 0);
            LEDs : out std_logic_vector(3 downto 0);
            compare:out std_logic_vector(2 downto 0);
            an : out std_logic_vector(3 downto 0):="1110"
--            j_flag: out std_logic;
--            j_address: out std_logic_vector(2 downto 0);
--            Reg_Zero_out : out std_logic_vector(3 downto 0)

        );
    end component nanoprocessor;

    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal overflow_led : std_logic;
    signal zero_led : std_logic;
    signal seven_seg : std_logic_vector(6 downto 0);
    signal LEDs : std_logic_vector(3 downto 0);
    signal compare:std_logic_vector( 2 downto 0);
--    signal j_flag:  std_logic;
--    signal j_address: std_logic_vector(2 downto 0);
--    signal Reg_Zero_out : std_logic_vector(3 downto 0);
    constant clock_period : time := 10 ns;
begin
    uut : nanoprocessor
        port map (
            clk => clk,
            reset => reset,
            overflow_led => overflow_led,
            zero_led => zero_led,
            seven_seg => seven_seg,
            LEDs => LEDs,
            compare=>compare
--            j_flag=>j_flag,
--            j_address=>j_address,
--            Reg_Zero_out=>Reg_Zero_out
            
        );

    clk_process : process
    begin
        clk <= '0';
        wait for clock_period / 2;
        clk <= '1';
        wait for clock_period / 2;
    end process;
    
    Reset_Process : PROCESS BEGIN
        Reset <= '1';
        WAIT FOR 25 NS;
        Reset <= '0';
        WAIT FOR 600 NS;
        Reset <= '1';
    END PROCESS;
end architecture tb;