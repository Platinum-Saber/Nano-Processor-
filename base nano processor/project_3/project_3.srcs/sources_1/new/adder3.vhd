library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity adder3 is
    port (
        a : in std_logic_vector(2 downto 0);
        b : in std_logic_vector(2 downto 0);
        result : out std_logic_vector(2 downto 0);
        carry_out : out std_logic
    );
end adder3;

architecture behavioral of adder3 is

    component fulladder
        port (
            a, b, cin : in std_logic;
            sum, cout : out std_logic
        );
    end component;

    signal c : std_logic_vector(3 downto 0);

begin

    u_fa0 : fulladder
        port map (
            a => a(0),
            b => b(0),
            cin => '0',
            sum => result(0),
            cout => c(1)
        );

    u_fa1 : fulladder
        port map (
            a => a(1),
            b => b(1),
            cin => c(1),
            sum => result(1),
            cout => c(2)
        );

    u_fa2 : fulladder
        port map (
            a => a(2),
            b => b(2),
            cin => c(2),
            sum => result(2),
            cout => c(3)
        );

    carry_out <= c(3);

end behavioral;