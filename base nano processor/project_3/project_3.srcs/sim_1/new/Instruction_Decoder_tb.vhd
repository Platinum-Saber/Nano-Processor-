library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use WORK.Bus_System.ALL;

entity Instruction_Decoder_tb is
end Instruction_Decoder_tb;

architecture Testbench of Instruction_Decoder_tb is
    -- Component Declaration
    component Instruction_Decoder
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
            JumpAddress    : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Input Signals
    signal clk_tb         : std_logic := '0';
    signal reset_tb       : std_logic := '0';
    signal InstructionBus_tb: BUS_13bit := (others => (others => '0'));
    signal RegForJump_tb  : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

    -- Output Signals
    signal RegisterEnable_tb: STD_LOGIC_VECTOR(2 downto 0);
    signal LoadSelect_tb  : std_logic;
    signal ImmediateValue_tb: std_logic_vector(3 downto 0);
    signal RegisterSelectA_tb: std_logic_vector(2 downto 0);
    signal RegisterSelectB_tb: std_logic_vector(2 downto 0);
    signal Add_Sub_Select_tb: std_logic;
    signal JumpFlag_tb    : std_logic;
    signal JumpAddress_tb : std_logic_vector(2 downto 0);

    -- Clock Period
    constant Clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut : Instruction_Decoder
        port map (
            clk            => clk_tb,
            reset          => reset_tb,
            InstructionBus => InstructionBus_tb,
            RegForJump     => RegForJump_tb,
            RegisterEnable => RegisterEnable_tb,
            LoadSelect     => LoadSelect_tb,
            ImmediateValue => ImmediateValue_tb,
            RegisterSelectA => RegisterSelectA_tb,
            RegisterSelectB => RegisterSelectB_tb,
            Add_Sub_Select => Add_Sub_Select_tb,
            JumpFlag       => JumpFlag_tb,
            JumpAddress    => JumpAddress_tb
        );

    -- Clock process
    Clk_process : process
    begin
        clk_tb <= '0';
        wait for Clk_period / 2;
        clk_tb <= '1';
        wait for Clk_period / 2;
    end process;

    -- Stimulus process
    stim_proc : process
    begin
        -- Reset the instruction decoder
        reset_tb <= '1';
        wait for Clk_period;
        reset_tb <= '0';

        -- Test case 1: MOVI Instruction
        InstructionBus_tb(0) <= "000" & "001" & "010" & "0011";
        RegForJump_tb <= "0000";
        wait for Clk_period;
        -- Add your assertions here

        -- Test case 2: ADD Instruction
        InstructionBus_tb(0) <= "001" & "011" & "100" & "0000";
        RegForJump_tb <= "0000";
        wait for Clk_period;
        -- Add your assertions here

        -- Test case 3: NEG Instruction
        InstructionBus_tb(0) <= "010" & "101" & "000" & "0000";
        RegForJump_tb <= "0000";
        wait for Clk_period;
        -- Add your assertions here

        -- Test case 4: JZR Instruction (Jump condition true)
        InstructionBus_tb(0) <= "011" & "000" & "000" & "111";
        RegForJump_tb <= "0000";
        wait for Clk_period;
        -- Add your assertions here

        -- Test case 5: JZR Instruction (Jump condition false)
        InstructionBus_tb(0) <= "011" & "000" & "000" & "111";
        RegForJump_tb <= "0001";
        wait for Clk_period;
        -- Add your assertions here

        -- Test case 6: SUB Instruction
        InstructionBus_tb(0) <= "100" & "110" & "111" & "0000";
        RegForJump_tb <= "0000";
        wait for Clk_period;
        -- Add your assertions here

        wait; -- End the simulation
    end process;
end Testbench;