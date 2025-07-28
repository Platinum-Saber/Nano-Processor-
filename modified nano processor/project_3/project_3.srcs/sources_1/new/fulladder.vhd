library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
    port (
        a, b, cin : in std_logic;
        sum, cout : out std_logic
    );
end fulladder;

architecture behavioral of fulladder is

    component halfadder
        port (
            a, b : in std_logic;
            sum, carry : out std_logic
        );
    end component;

    signal s1, c1, c2 : std_logic;

begin

    u_ha1 : halfadder
        port map (
            a => a,
            b => b,
            sum => s1,
            carry => c1
        );

    u_ha2 : halfadder
        port map (
            a => s1,
            b => cin,
            sum => sum,
            carry => c2
        );

    cout <= c1 or c2;

end behavioral;