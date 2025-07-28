library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
PACKAGE Bus_System IS
        TYPE BUS_8_4bit IS ARRAY(0 to 7) of STD_LOGIC_VECTOR(3 downto 0);
        TYPE BUS_2_3bit IS ARRAY(0 to 1) of STD_LOGIC_VECTOR(2 downto 0);
        TYPE BUS_2_4bit IS ARRAY(0 to 1) of STD_LOGIC_VECTOR(3 downto 0);
        TYPE BUS_1_4bit IS ARRAY(0 to 3) of STD_LOGIC;
        TYPE BUS_3_4bit IS ARRAY(0 to 2) of STD_LOGIC_VECTOR(3 downto 0);
        
        TYPE BUS_13bit IS ARRAY(0 to 0) of   STD_LOGIC_VECTOR(12 downto 0);
        TYPE BUS_1_12bit IS ARRAY(0 to 11) of   STD_LOGIC;
        TYPE BUS_2bit IS ARRAY(0 to 1) of STD_LOGIC;
        TYPE BUS_1_3bit IS ARRAY(0 to 2) of STD_LOGIC;
       
END PACKAGE;