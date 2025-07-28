library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.Bus_System.all;

entity program_counter is
    port (
        clk : in std_logic;
        reset : in std_logic;
        nextaddress : out std_logic_vector(2 downto 0);
        jump_flag : in std_logic;
        address_to_jump : in std_logic_vector(2 downto 0)
    );
end program_counter;

architecture behavioral of program_counter is

    component adder3
        port (
            a : in std_logic_vector(2 downto 0);
            b : in std_logic_vector(2 downto 0);
            result : out std_logic_vector(2 downto 0);
            carry_out : out std_logic
        );
    end component;

    component Mux_2_3bit is
        port (
            D : in BUS_2_3bit;
            S : in STD_LOGIC;
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    signal current_address : std_logic_vector(2 downto 0);
    signal next_address : std_logic_vector(2 downto 0);
    signal jflag : std_logic;
    signal mux_in : BUS_2_3bit;
    signal mux_out : std_logic_vector(2 downto 0);

begin

    u_adder : adder3
        port map (
            a => current_address,
            b => "001",
            result => next_address,
            carry_out => open
        );

    u_mux2x3 : Mux_2_3bit
        port map (
            D => mux_in,
            S => jflag,
            EN => '1',
            Y => mux_out
        );

    mux_in(0) <= next_address;
    mux_in(1) <= address_to_jump;
    jflag <= jump_flag;

    process (clk, reset)
    begin
        if reset = '1' then
            current_address <= "000";
        elsif rising_edge(clk) then
            current_address <= mux_out;
        end if;
    end process;

    nextaddress <= current_address;

end behavioral;