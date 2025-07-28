library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier_4_TB is
end Multiplier_4_TB;

architecture Behavioral of Multiplier_4_TB is

    -- Component declaration for the DUT (Device Under Test)
    component Multiplier_4
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               EN : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    -- Signal declarations
    signal A_TB : STD_LOGIC_VECTOR (3 downto 0);
    signal B_TB : STD_LOGIC_VECTOR (3 downto 0);
    signal EN_TB : STD_LOGIC;
    signal Y_TB : STD_LOGIC_VECTOR (7 downto 0);
    
begin

    -- Instantiate the DUT
    uut : Multiplier_4
        port map (A => A_TB,
                  B => B_TB,
                  EN => EN_TB,
                  Y => Y_TB);
    
    -- Stimulus process
    stimulus_proc: process
    begin
        -- Initialize inputs
        A_TB <= "0000";
        B_TB <= "0000";
        EN_TB <= '0';
        
        -- Apply stimulus
        wait for 10 ns;
        A_TB <= "0010";
        B_TB <= "0010";
        EN_TB <= '1';
        
        wait for 10 ns;
        A_TB <= "0011";
        B_TB <= "0001";
        
        wait for 10 ns;
        A_TB <= "0110";
        B_TB <= "0010";
        
        -- Add more test cases as needed
        
        wait;
    end process;
    
end Behavioral;