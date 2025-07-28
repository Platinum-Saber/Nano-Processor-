library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use WORK.Bus_System.ALL;

entity nanoprocessor is
    port (
        clk : in std_logic;
        reset : in std_logic;
        overflow_led : out std_logic;
        zero_led : out std_logic;
        seven_seg:out std_logic_vector(6 downto 0);
        LEDs :out std_logic_vector(3 downto 0);
        an : out std_logic_vector(3 downto 0):="1110"
        
        
        
    );
end entity nanoprocessor;

architecture rtl of nanoprocessor is
    component LUT_16_7 is
        port(
            I : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (6 downto 0)
           );
    end component;
           
    component slow_Clk is
        port(
        Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC
        );
    end component;
    component addsub4 is
        port (
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        sub : in std_logic;
        en: in std_logic;
        result : out std_logic_vector(3 downto 0);
        carry_out : out std_logic;
        zero:out std_logic
        
    );
    end component;

    component adder3 is
        port (
        a : in std_logic_vector(2 downto 0);
        b : in std_logic_vector(2 downto 0);
        result : out std_logic_vector(2 downto 0);
        carry_out : out std_logic
    );
    end component;
  

    component program_counter is
        port (
        clk :in std_logic; 
        reset : in std_logic;
--        currentaddress: in STD_LOGIC_VECTOR(2 downto 0);
        nextaddress : out std_logic_vector(2 downto 0);
        jump_flag : in std_logic;
        address_to_jump :  in std_logic_vector(2 downto 0)
    );
    end component;

    

    component Mux_2_4bit is
        port (D : in BUS_2_4bit;
           S : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    component Mux_8_4bit is
        port ( D : in BUS_8_4bit;
           S : in STD_LOGIC_VECTOR(2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    component RegBank is
        Port ( RegSel :  in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Data_IN : in STD_LOGIC_VECTOR(3 downto 0);
           Data_Bus : out BUS_8_4bit);     
    end component;

    component instruction_decoder is
        Port ( 
        clk : in std_logic;
        reset : in std_logic;
        InstructionBus : in BUS_13bit;
        RegForJump : in STD_LOGIC_VECTOR(3 downto 0);
        RegisterEnable :out STD_LOGIC_VECTOR (2 downto 0);
        LoadSelect : out std_logic;
        ImmediateValue : out std_logic_vector(3 downto 0);
        RegisterSelectA : out std_logic_vector(2 downto 0);
        RegisterSelectB : out std_logic_vector(2 downto 0);
        Add_Sub_Select : out std_logic;
        JumpFlag : out std_logic;
        JumpAddress : out std_logic_vector(2 downto 0);
        Add_Sub_En : out std_logic
        
        
    );
    end component;

    component program_rom is
        port (
            address : in std_logic_vector(2 downto 0);
            instruction : out BUS_13bit
        );
    end component;

    signal muxoutput0 : std_logic_vector(3 downto 0);
    signal muxoutput1: std_logic_vector(3 downto 0);
    signal instruction_bus : BUS_13bit;
    
    signal reg_enable : STD_LOGIC_VECTOR (2 downto 0);
    signal add_sub_select : std_logic;
    signal mux3_select : bus_1_4bit;
    signal mux33_select : std_logic;
    signal load_select: std_logic;
    signal jump_flag : std_logic;
    signal zero_flag : std_logic;
    signal reg_a_data : bus_1_4bit;
    signal reg_b_data : bus_1_4bit;
    signal alu_result : bus_1_4bit;
    signal alu_overflow : std_logic;
    signal pc_next : std_logic_vector(2 downto 0);
    --signal pc_current :std_logic_vector(2 downto 0);
    signal regA:std_logic_vector(2 downto 0);
    signal regB:std_logic_vector(2 downto 0);
    signal jumpAddress:std_logic_vector(2 downto 0);
    signal regdata: bus_1_4bit;
    signal Databus0 :std_logic_vector(3 downto 0);
    signal regoutput: BUS_8_4bit;
    signal mux_2_4bus : BUS_2_4bit;
    signal mux_2_3bus : BUS_2_3bit;
    signal slw_clk : STD_LOGIC;
    signal seven_seg_out : std_logic_vector(6 downto 0);
    signal seven_seg_in : STD_LOGIC_VECTOR (3 downto 0);
    signal compare0 : std_logic_vector(2 downto 0);
    signal add_sub_enable:std_logic;
    signal comparator_enable : std_logic;
begin
    Seven_Segment_Display : LUT_16_7
    port map(
           I =>seven_seg_in,
           O =>seven_seg_out
           );
           
    Slow_Clk0 : slow_Clk
    port map(
        Clk_in => clk,
        Clk_out => slw_clk
        );
        

    four_bit_add_sub : addsub4
        port map (
            a =>muxoutput0,
            b =>muxoutput1,
            sub =>add_sub_select,
            en=>'1',
            result =>mux_2_4bus(1),
            carry_out =>alu_overflow,
            zero=>zero_flag
        );

            

    pc : program_counter
        port map (
            clk=> slw_clk , 
            reset => reset ,
            nextaddress => pc_next,
            jump_flag => jump_flag ,
            address_to_jump => jumpAddress 
        );

    two_way_4bit_mux : Mux_2_4bit
        port map 
          ( D =>mux_2_4bus,
           S =>load_select,
           EN=>'1',
           Y => databus0);
        

    eight_way_4bit_mux0 : Mux_8_4bit
        port map (
           D => regoutput,
           S =>regA,
           EN =>'1',
           Y=>muxoutput0
        );
        
       eight_way_4bit_mux1 : Mux_8_4bit
        port map (
           D => regoutput,
           S =>regB,
           EN =>'1',
           Y=>muxoutput1
        );

    register_bank : RegBank
        port map ( 
           RegSel => reg_enable,
           Clk =>slw_clk,
           En =>'1',
           Reset =>reset,
           Data_IN =>databus0,
           Data_Bus =>regoutput
           );

    instruction_decoder0 : instruction_decoder
        port map (
        clk =>slw_clk,
        reset=>reset,
        InstructionBus=>instruction_bus,
        RegForJump =>regoutput(0),
        RegisterEnable=>reg_enable,
        LoadSelect =>load_select,
        ImmediateValue =>mux_2_4bus(0),
        RegisterSelectA=>regA,
        RegisterSelectB=>regB,
        Add_Sub_Select =>add_sub_select,
        JumpFlag =>jump_flag,
        JumpAddress =>jumpAddress,
        Add_Sub_En=>add_sub_enable
        );

    program_rom_inst : program_rom
        port map (
            address => pc_next,
            instruction => instruction_bus
        );
        
    overflow_led <= alu_overflow;
    zero_led <= zero_flag;
    seven_seg_in <= regoutput(7);
    
    LEDs <= regoutput(7);
    seven_seg <= seven_seg_out;
 
    

end architecture rtl;