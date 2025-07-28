library ieee;
use ieee.std_logic_1164.all;

entity addsub4 is
    port (
        a     : in  std_logic_vector(3 downto 0);
        b     : in  std_logic_vector(3 downto 0);
        sub   : in  std_logic;
        en : in std_logic;
        result: out std_logic_vector(3 downto 0);
        carry_out: out std_logic;
        zero  : out std_logic
    );
end addsub4;

architecture behavioral of addsub4 is
    component fulladder
        port (
            a   : in  std_logic;
            b   : in  std_logic;
            cin : in  std_logic;
            sum : out std_logic;
            cout: out std_logic
        );
    end component;

    signal c   : std_logic_vector(4 downto 0);
    signal b_xor: std_logic_vector(3 downto 0);
    signal sum : std_logic_vector(3 downto 0);
    signal zeroflag : std_logic;

begin
    -- XOR b with the sub signal to perform addition or subtraction
    b_xor <= b xor (sub & sub & sub & sub);

    -- Instantiate full adders
    u_fa0 : fulladder
        port map (
            a   => a(0),
            b   => b_xor(0),
            cin => sub,
            sum => sum(0),
            cout=> c(1)
        );

    u_fa1 : fulladder
        port map (
            a   => a(1),
            b   => b_xor(1),
            cin => c(1),
            sum => sum(1),
            cout=> c(2)
        );

    u_fa2 : fulladder
        port map (
            a   => a(2),
            b   => b_xor(2),
            cin => c(2),
            sum => sum(2),
            cout=> c(3)
        );

    u_fa3 : fulladder
        port map (
            a   => a(3),
            b   => b_xor(3),
            cin => c(3),
            sum => sum(3),
            cout=> c(4)
        );

    -- Assign outputs
    
     result   <= sum when en='1' else (others => '0');
     
    carry_out<= c(4) when en='1' else '0';

    -- Optimize zero flag calculation
    process(Sum, C(4))
    begin
        if (Sum = "0000" and C(4) = '0') then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
    end process;

   

end behavioral;