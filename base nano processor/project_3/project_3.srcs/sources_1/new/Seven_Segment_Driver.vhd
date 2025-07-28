library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use WORK.Bus_System.ALL;

entity Seven_Segment_Driver is
    Port ( 
        clk : in std_logic;
        reset : in std_logic;
        input : in std_logic_vector(4 downto 0);
        segments : out std_logic_vector(6 downto 0);
        an : out std_logic_vector(1 downto 0) -- Anode enable signals for the two displays
    );
end Seven_Segment_Driver;

architecture Behavioral of Seven_Segment_Driver is

    component LUT_16_7_2 is
        Port ( I : in STD_LOGIC_VECTOR(4 downto 0);
               O : out STD_LOGIC_VECTOR(13 downto 0)
        );
    end component;

    signal lut_output : std_logic_vector(13 downto 0);
    signal display_select : std_logic := '0'; -- '0' for left display, '1' for right display
    signal display_counter : unsigned(1 downto 0) := (others => '0');

begin

    LUT_Inst : LUT_16_7_2 port map (
        I => input,
        O => lut_output
    );

    process(clk, reset)
    begin
        if reset = '1' then
            display_counter <= (others => '0');
            display_select <= '0';
        elsif rising_edge(clk) then
            display_counter <= display_counter + 1;
            display_select <= not display_select;
        end if;
    end process;

    -- Control the individual 7-segment displays
    an <= "01" when display_select = '0' else "10";
    segments <= lut_output(6 downto 0) when display_select = '0' else lut_output(13 downto 7);

end Behavioral;