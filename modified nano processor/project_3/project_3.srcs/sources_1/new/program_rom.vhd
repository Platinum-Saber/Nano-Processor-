library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use WORK.Bus_System.ALL;

entity program_rom is
    port (
        address : in std_logic_vector(2 downto 0);
        instruction : out BUS_13bit
    );
end entity program_rom;

architecture rtl of program_rom is
    type program_memory is array (0 to 7) of std_logic_vector(12 downto 0);
    constant program : program_memory := (
          

        "0000010000001",  -- Load 1 int register 1
        "0000100000010",  -- Load 2 into register 2
        "0010010100000",  -- Add the contents of registers 1 and 2,
        
        
        "0000110000101",  -- Load 5 int register 3
        "0001000000011",  -- Load 3 int register 4
        "1000111000000",  -- MUL the contents of registers 1 and 2,
        --"1100111000000",  -- MUL the contents of registers 1 and 2,
        "1010010100000", -- comparator
        "0110000000001"  -- Jump to address,
        
                 
    );
begin
    instruction(0) <= program(to_integer(unsigned(address)));
end architecture rtl;