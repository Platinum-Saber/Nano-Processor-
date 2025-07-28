library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use WORK.Bus_System.ALL;

entity Instruction_Decoder is
    Port (
        clk            : in std_logic;
        reset          : in std_logic;
        InstructionBus : in BUS_13bit;
        RegForJump     : in STD_LOGIC_VECTOR(3 downto 0);
        RegisterEnable : out STD_LOGIC_VECTOR(2 downto 0);
        LoadSelect     : out std_logic;
        ImmediateValue : out std_logic_vector(3 downto 0);
        RegisterSelectA: out std_logic_vector(2 downto 0);
        RegisterSelectB: out std_logic_vector(2 downto 0);
        Add_Sub_Select : out std_logic;
        JumpFlag       : out std_logic;
        JumpAddress    : out std_logic_vector(2 downto 0);
        Add_Sub_En     : out std_logic;
        Compare_En     : out std_logic
        --Mul_En         : out std_logic
    );
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
    signal opcode    : std_logic_vector(2 downto 0);
    signal reg_a     : std_logic_vector(2 downto 0);
    signal reg_b     : std_logic_vector(2 downto 0);
    signal Jaddress  : std_logic_vector(2 downto 0);
    signal J_flag    : std_logic;
begin
    opcode <= InstructionBus(0)(12 downto 10);
    reg_a  <= InstructionBus(0)(9 downto 7);
    reg_b  <= InstructionBus(0)(6 downto 4);

    -- Calculate jump address
    J_flag    <=  '1' when RegForJump = "0000" else '0';
    Jaddress  <=  InstructionBus(0)(2 downto 0);

    process (clk, reset)
    begin
        if reset = '1' then
            JumpFlag        <= '0';
            JumpAddress     <= (others => '0');
            RegisterEnable  <= (others => '0');
            LoadSelect      <= '0';
            ImmediateValue  <= (others => '0');
            RegisterSelectA <= (others => '0');
            RegisterSelectB <= (others => '0');
            Add_Sub_Select  <= '0';
            Add_Sub_En      <= '0';
            Compare_En      <= '0';
            
        elsif rising_edge(clk) then
            case opcode is
                when "000" => -- MOVI Instruction
                    RegisterEnable  <= reg_a;
                    LoadSelect      <= '0';
                    ImmediateValue  <= InstructionBus(0)(3 downto 0);
                    RegisterSelectA <= reg_a;
                    RegisterSelectB <= reg_b;
                    Add_Sub_Select  <= '0';
                    Add_Sub_En      <= '0';
                    Compare_En      <= '0';
                    JumpFlag        <= '0';
                    
                when "001" => -- ADD Instruction
                    RegisterEnable  <= "111";
                    LoadSelect      <= '1';
                    ImmediateValue  <= (others => '0');
                    RegisterSelectA <= reg_a;
                    RegisterSelectB <= reg_b;
                    Add_Sub_Select  <= '0';
                    Add_Sub_En      <= '1';
                    Compare_En      <= '0';
                    JumpFlag        <= '0';
                    
                when "010" => -- NEG Instruction
                    RegisterEnable  <= reg_a;
                    LoadSelect      <= '1';
                    ImmediateValue  <= (others => '0');
                    RegisterSelectA <= (others => '0');
                    RegisterSelectB <= reg_a;
                    Add_Sub_Select  <= '1';
                    Add_Sub_En      <= '1';
                    Compare_En      <= '0';
                    JumpFlag        <= '0';
                    
                when "011" => -- JZR Instruction
                    RegisterEnable  <= "000";
                    LoadSelect      <= '0';
                    ImmediateValue  <= (others => '0');
                    RegisterSelectA <= (others => '0');
                    RegisterSelectB <= (others => '0');
                    Add_Sub_Select  <= '0';
                    JumpFlag        <= J_flag;
                    JumpAddress     <= Jaddress;
                    Add_Sub_En      <= '0';
                    Compare_En      <= '0';
                    
                when "100" => -- SUB Instruction
                    RegisterEnable  <= "111";
                    LoadSelect      <= '1';
                    ImmediateValue  <= (others => '0');
                    RegisterSelectA <= reg_a;
                    RegisterSelectB <= reg_b;
                    Add_Sub_Select  <= '1';
                    Add_Sub_En      <= '1';
                    Compare_En      <= '0';
                    JumpFlag        <= '0';
                    
                when "101" => -- COM Instruction
                    RegisterEnable  <= "000";
                    LoadSelect      <= '1';
                    ImmediateValue  <= (others => '0');
                    RegisterSelectA <= reg_a;
                    RegisterSelectB <= reg_b;
                    Add_Sub_Select  <= '0'; 
                    Add_Sub_En      <='0';
                    Compare_En      <='1';
                    JumpFlag        <= '0';
                
--                when "110" => -- MUL Instruction
--                    RegisterEnable  <= "111";
--                    LoadSelect      <= '1';
--                    ImmediateValue  <= (others => '0');
--                    RegisterSelectA <= reg_a;
--                    RegisterSelectB <= reg_b;
--                    Add_Sub_Select  <= '0';
--                    Add_Sub_En      <= '0';
--                    Mul_En          <= '0';
--                    Compare_En      <= '0';
--                    JumpFlag        <= '0';
                        
                when others =>
                    null;
            end case;
        end if;
    end process;
end Behavioral;