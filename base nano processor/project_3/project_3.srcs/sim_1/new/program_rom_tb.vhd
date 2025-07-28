library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bus_system.all;

entity program_rom_tb is
end entity program_rom_tb;

architecture tb of program_rom_tb is
    component program_rom is
        port (
            address : in std_logic_vector(2 downto 0);
            instruction : out BUS_13bit
        );
    end component program_rom;

    signal address : std_logic_vector(2 downto 0) := (others => '0');
    signal instruction : BUS_13bit;

begin
    uut : program_rom
        port map (
            address => address,
            instruction => instruction
        );

    test_proc : process
    begin
        -- Test the program ROM
        address <= "000";
        wait for 10 ns;
        --assert instruction = "0000010000001" report "Instruction at address 000 is incorrect" severity error;

        address <= "001";
        wait for 10 ns;
        --assert instruction = "0000000100010" report "Instruction at address 001 is incorrect" severity error;

        address <= "010";
        wait for 10 ns;
        --assert instruction = "0010010100000" report "Instruction at address 010 is incorrect" severity error;

        address <= "011";
        wait for 10 ns;
        --assert instruction = "0001001000100" report "Instruction at address 011 is incorrect" severity error;

        address <= "100";
        wait for 10 ns;
        --assert instruction = "0010000000110" report "Instruction at address 100 is incorrect" severity error;

        address <= "101";
        wait for 10 ns;
        --assert instruction = "0010100000000" report "Instruction at address 101 is incorrect" severity error;

        address <= "110";
        wait for 10 ns;
        --assert instruction = "0011000001010" report "Instruction at address 110 is incorrect" severity error;

        address <= "111";
        wait for 10 ns;
        --assert instruction = "0000010000001" report "Instruction at address 111 is incorrect" severity error;

        wait;
    end process test_proc;
end architecture tb;