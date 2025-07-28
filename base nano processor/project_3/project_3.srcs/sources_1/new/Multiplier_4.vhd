library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Multiplier_4;

architecture Behavioral of Multiplier_4 is

component fulladder
        Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Sum : out STD_LOGIC);
end component;

signal b0a0, b0a1, b0a2, b0a3 : std_logic;
signal b1a0, b1a1, b1a2, b1a3 : std_logic;
signal b2a0, b2a1, b2a2, b2a3 : std_logic;
signal b3a0, b3a1, b3a2, b3a3 : std_logic;

signal  C_0_0, S_0_0 : std_logic;
signal  C_0_1, S_0_1 : std_logic;
signal  C_0_2, S_0_2 : std_logic;
signal  C_0_3, S_0_3 : std_logic;

signal  C_1_0, S_1_0 : std_logic;
signal  C_1_1, S_1_1 : std_logic;
signal  C_1_2, S_1_2 : std_logic;
signal  C_1_3, S_1_3 : std_logic;

signal  C_2_0, S_2_0 : std_logic;
signal  C_2_1, S_2_1 : std_logic;
signal  C_2_2, S_2_2 : std_logic;
signal  C_2_3, S_2_3 : std_logic;

begin

FA_0_0 : fulladder
    port map(
    A => b0a1,
    B => b1a0,
    Cin => '0',
    Cout => C_0_0,
    Sum => S_0_0);
    
FA_0_1 : fulladder
    port map(
    A => b0a2,
    B => b1a1,
    Cin => C_0_0,
    Cout => C_0_1,
    Sum => S_0_1);

FA_0_2 : fulladder
    port map(
    A => b0a3,
    B => b1a2,
    Cin => C_0_1,
    Cout => C_0_2,
    Sum => S_0_2);
    
FA_0_3 : fulladder
    port map(
    A => '0',
    B => b1a3,
    Cin => C_0_2,
    Cout => C_0_3,
    Sum => S_0_3);
    
FA_1_0 : fulladder
    port map(
    A => S_0_1,
    B => b2a0,
    Cin => '0',
    Cout => C_1_0,
    Sum => S_1_0);
    
FA_1_1 : fulladder
    port map(
    A => S_0_2,
    B => b2a1,
    Cin => C_1_0,
    Cout => C_1_1,
    Sum => S_1_1);
    
FA_1_2 : fulladder
    port map(
    A => S_0_3,
    B => b2a2,
    Cin => C_1_1,
    Cout => C_1_2,
    Sum => S_1_2);
    
FA_1_3 : fulladder
    port map(
    A => C_0_3,
    B => b2a3,
    Cin => C_1_2,
    Cout => C_1_3,
    Sum => S_1_3);
    
FA_2_0 : fulladder
    port map(
    A => S_1_1,
    B => b3a0,
    Cin => '0',
    Cout => C_2_0,
    Sum => S_2_0);
    
FA_2_1 : fulladder
    port map(
    A => S_1_2,
    B => b3a1,
    Cin => C_2_0,
    Cout => C_2_1,
    Sum => S_2_1);
    
FA_2_2 : fulladder
    port map(
    A => S_1_3,
    B => b3a2,
    Cin => C_2_1,
    Cout => C_2_2,
    Sum => S_2_2);
    
FA_2_3 : fulladder
    port map(
    A => C_1_3,
    B => b3a3,
    Cin => C_2_2,
    Cout => C_2_3,
    Sum => S_2_3);
    
    b0a0 <= B(0) AND A(0);
    b0a1 <= B(0) AND A(1);
    b0a2 <= B(0) AND A(2);
    b0a3 <= B(0) AND A(3);
    b1a0 <= B(1) AND A(0);
    b1a1 <= B(1) AND A(1);
    b1a2 <= B(1) AND A(2);
    b1a3 <= B(1) AND A(3);
    b2a0 <= B(2) AND A(0);
    b2a1 <= B(2) AND A(1);
    b2a2 <= B(2) AND A(2);
    b2a3 <= B(2) AND A(3);
    b3a0 <= B(3) AND A(0);
    b3a1 <= B(3) AND A(1);
    b3a2 <= B(3) AND A(2);
    b3a3 <= B(3) AND A(3);
     
    Y(0) <= b0a0;
    Y(1) <= S_0_0;
    Y(2) <= S_1_0;
    Y(3) <= S_2_0;
    Y(4) <= S_2_1;
    Y(5) <= S_2_2;
    Y(6) <= S_2_3;
    Y(7) <= C_2_3;
    
end Behavioral;
