library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.Bus_System.ALL;

entity RegBank is
    Port (RegSel : in STD_LOGIC_VECTOR (2 downto 0);
          Clk : in STD_LOGIC;
          En : in STD_LOGIC;
          Reset : in STD_LOGIC;
          Data_IN : in STD_LOGIC_VECTOR (3 downto 0);
          Data_Bus : out BUS_8_4bit);
end RegBank;

architecture Behavioral of RegBank is
    component Reg
        Port (D : in STD_LOGIC_VECTOR (3 downto 0);
              En : in STD_LOGIC;
              Reset : in STD_LOGIC;
              Clk : in STD_LOGIC;
              Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component Decoder_3_to_8
        Port (I : in STD_LOGIC_VECTOR (2 downto 0);
              EN : in STD_LOGIC;
              Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    signal regsel_signal : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal reg_outputs : BUS_8_4bit; -- Array to hold register outputs

begin
    Decoder_3_to_8_0 : Decoder_3_to_8
    port map (
        I => RegSel,
        En => En,
        Y => regsel_signal
    );

    -- Register R0 is to be hardcoded to 0000
    Reg_0 : Reg
    port map (
        D => "0000",
        En => '1',
        Reset => '0',
        Clk => Clk,
        Q => reg_outputs(0)
    );

    Reg_1 : Reg
    port map (
        D => Data_IN,
        En => regsel_signal(1),
        Reset => Reset,
        Clk => Clk,
        Q => reg_outputs(1)
    );

    Reg_2 : Reg
    port map (
        D => Data_IN,
        En => regsel_signal(2),
        Reset => Reset,
        Clk => Clk,
        Q => reg_outputs(2)
    );

    Reg_3 : Reg
    port map (
        D => Data_IN,
        En => regsel_signal(3),
        Reset => Reset,
        Clk => Clk,
        Q => reg_outputs(3)
    );

    Reg_4 : Reg
    port map (
        D => Data_IN,
        En => regsel_signal(4),
        Reset => Reset,
        Clk => Clk,
        Q => reg_outputs(4)
    );

    Reg_5 : Reg
    port map (
        D => Data_IN,
        En => regsel_signal(5),
        Reset => Reset,
        Clk => Clk,
        Q => reg_outputs(5)
    );

    Reg_6 : Reg
    port map (
        D => Data_IN,
        En => regsel_signal(6),
        Reset => Reset,
        Clk => Clk,
        Q => reg_outputs(6)
    );

    Reg_7 : Reg
    port map (
        D => Data_IN,
        En => regsel_signal(7),
        Reset => Reset,
        Clk => Clk,
        Q => reg_outputs(7)
    );

    Data_Bus <= reg_outputs; -- Assign the array of register outputs to Data_Bus

end Behavioral;