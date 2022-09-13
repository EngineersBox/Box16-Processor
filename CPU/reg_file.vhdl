-- generated by Digital. Don't modify this file!
-- Any changes will be lost if this file is regenerated.

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity DEMUX_GATE_3 is
  port (
    out_0: out std_logic;
    out_1: out std_logic;
    out_2: out std_logic;
    out_3: out std_logic;
    out_4: out std_logic;
    out_5: out std_logic;
    out_6: out std_logic;
    out_7: out std_logic;
    sel: in std_logic_vector (2 downto 0);
    p_in: in std_logic );
end DEMUX_GATE_3;

architecture Behavioral of DEMUX_GATE_3 is
begin
    out_0 <= p_in when sel = "000" else '0';
    out_1 <= p_in when sel = "001" else '0';
    out_2 <= p_in when sel = "010" else '0';
    out_3 <= p_in when sel = "011" else '0';
    out_4 <= p_in when sel = "100" else '0';
    out_5 <= p_in when sel = "101" else '0';
    out_6 <= p_in when sel = "110" else '0';
    out_7 <= p_in when sel = "111" else '0';
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity DIG_Register_BUS is
  generic ( Bits: integer ); 
  port (
    Q: out std_logic_vector ((Bits-1) downto 0);
    D: in std_logic_vector ((Bits-1) downto 0);
    C: in std_logic;
    en: in std_logic );
end DIG_Register_BUS;

architecture Behavioral of DIG_Register_BUS is
  signal state : std_logic_vector ((Bits-1) downto 0) := (others => '0');
begin
   Q <= state;

   process ( C )
   begin
      if rising_edge(C) and (en='1') then
        state <= D;
      end if;
   end process;
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity MUX_GATE_BUS_1 is
  generic ( Bits : integer ); 
  port (
    p_out: out std_logic_vector ((Bits-1) downto 0);
    sel: in std_logic;
    
    in_0: in std_logic_vector ((Bits-1) downto 0);
    in_1: in std_logic_vector ((Bits-1) downto 0) );
end MUX_GATE_BUS_1;

architecture Behavioral of MUX_GATE_BUS_1 is
begin
  with sel select
    p_out <=
      in_0 when '0',
      in_1 when '1',
      (others => '0') when others;
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity high_mask_in is
  port (
    D_HIGH: in std_logic_vector(15 downto 0);
    D: in std_logic_vector(15 downto 0);
    EN: in std_logic;
    Q: out std_logic_vector(15 downto 0));
end high_mask_in;

architecture Behavioral of high_mask_in is
  signal s0: std_logic_vector(15 downto 0);
begin
  s0(7 downto 0) <= D(7 downto 0);
  s0(15 downto 8) <= D_HIGH(7 downto 0);
  gate0: entity work.MUX_GATE_BUS_1
    generic map (
      Bits => 16)
    port map (
      sel => EN,
      in_0 => D_HIGH,
      in_1 => s0,
      p_out => Q);
end Behavioral;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity MUX_GATE_BUS_3 is
  generic ( Bits : integer ); 
  port (
    p_out: out std_logic_vector ((Bits-1) downto 0);
    sel: in std_logic_vector (2 downto 0);
    
    in_0: in std_logic_vector ((Bits-1) downto 0);
    in_1: in std_logic_vector ((Bits-1) downto 0);
    in_2: in std_logic_vector ((Bits-1) downto 0);
    in_3: in std_logic_vector ((Bits-1) downto 0);
    in_4: in std_logic_vector ((Bits-1) downto 0);
    in_5: in std_logic_vector ((Bits-1) downto 0);
    in_6: in std_logic_vector ((Bits-1) downto 0);
    in_7: in std_logic_vector ((Bits-1) downto 0) );
end MUX_GATE_BUS_3;

architecture Behavioral of MUX_GATE_BUS_3 is
begin
  with sel select
    p_out <=
      in_0 when "000",
      in_1 when "001",
      in_2 when "010",
      in_3 when "011",
      in_4 when "100",
      in_5 when "101",
      in_6 when "110",
      in_7 when "111",
      (others => '0') when others;
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity main is
  port (
    RS1: in std_logic_vector(2 downto 0); -- The index of the register which should output its value to OUT1.
    RS2: in std_logic_vector(2 downto 0); -- The index of the register which should output its value to OUT2.
    WS: in std_logic_vector(2 downto 0); -- The index of the register which should save the value on IN on the next clock cycle (if WE is high).
    WE: in std_logic; -- Whether the register selected by WS should save the value from IN on the next cycle.
    p_IN: in std_logic_vector(15 downto 0); -- The value to be saved into the register specified by WS if WE is high,
    clk: in std_logic;
    FL_IN: in std_logic_vector(15 downto 0); -- The value to be saved into the register specified by WS if WE is high,
    FL_EN: in std_logic; -- Whether the register selected by WS should save the value from IN on the next cycle.
    PC_IN: in std_logic_vector(15 downto 0);
    HE: in std_logic;
    OUT1: out std_logic_vector(15 downto 0); -- The value in the register specified by RS1.
    OUT2: out std_logic_vector(15 downto 0); -- The value in the register specified by RS2.
    PC_S: out std_logic_vector(15 downto 0);
    PC_WE: out std_logic;
    FL_OUT: out std_logic_vector(15 downto 0));
end main;

architecture Behavioral of main is
  signal s0: std_logic;
  signal s1: std_logic_vector(15 downto 0);
  signal s2: std_logic_vector(15 downto 0);
  signal s3: std_logic;
  signal s4: std_logic_vector(15 downto 0);
  signal s5: std_logic_vector(15 downto 0);
  signal s6: std_logic;
  signal s7: std_logic_vector(15 downto 0);
  signal s8: std_logic_vector(15 downto 0);
  signal s9: std_logic;
  signal s10: std_logic_vector(15 downto 0);
  signal s11: std_logic_vector(15 downto 0);
  signal s12: std_logic;
  signal s13: std_logic_vector(15 downto 0);
  signal FL_OUT_temp: std_logic_vector(15 downto 0);
  signal s14: std_logic;
  signal PC_WE_temp: std_logic;
  signal s15: std_logic_vector(15 downto 0);
  signal s16: std_logic;
  signal s17: std_logic_vector(15 downto 0);
  signal s18: std_logic_vector(15 downto 0);
begin
  gate0: entity work.DEMUX_GATE_3
    port map (
      sel => WS,
      p_in => WE,
      out_0 => s0,
      out_1 => s3,
      out_2 => s6,
      out_3 => s9,
      out_4 => s12,
      out_5 => s14,
      out_7 => PC_WE_temp);
  gate1: entity work.DIG_Register_BUS -- RZ
    generic map (
      Bits => 16)
    port map (
      D => "0000000000000000",
      C => clk,
      en => s0,
      Q => s1);
  s16 <= (s14 OR FL_EN);
  gate2: entity work.MUX_GATE_BUS_1
    generic map (
      Bits => 16)
    port map (
      sel => PC_WE_temp,
      in_0 => PC_IN,
      in_1 => p_IN,
      p_out => s18);
  gate3: entity work.high_mask_in
    port map (
      D_HIGH => s18,
      D => PC_IN,
      EN => HE,
      Q => s17);
  gate4: entity work.MUX_GATE_BUS_1
    generic map (
      Bits => 16)
    port map (
      sel => PC_WE_temp,
      in_0 => "0000000000000000",
      in_1 => s17,
      p_out => PC_S);
  gate5: entity work.DIG_Register_BUS -- R1
    generic map (
      Bits => 16)
    port map (
      D => s2,
      C => clk,
      en => s3,
      Q => s4);
  gate6: entity work.DIG_Register_BUS -- R2
    generic map (
      Bits => 16)
    port map (
      D => s5,
      C => clk,
      en => s6,
      Q => s7);
  gate7: entity work.DIG_Register_BUS -- R3
    generic map (
      Bits => 16)
    port map (
      D => s8,
      C => clk,
      en => s9,
      Q => s10);
  gate8: entity work.DIG_Register_BUS -- R4
    generic map (
      Bits => 16)
    port map (
      D => s11,
      C => clk,
      en => s12,
      Q => s13);
  gate9: entity work.MUX_GATE_BUS_3
    generic map (
      Bits => 16)
    port map (
      sel => RS1,
      in_0 => s1,
      in_1 => s4,
      in_2 => s7,
      in_3 => s10,
      in_4 => s13,
      in_5 => FL_OUT_temp,
      in_6 => "0000000000000000",
      in_7 => PC_IN,
      p_out => OUT1);
  gate10: entity work.MUX_GATE_BUS_3
    generic map (
      Bits => 16)
    port map (
      sel => RS2,
      in_0 => s1,
      in_1 => s4,
      in_2 => s7,
      in_3 => s10,
      in_4 => s13,
      in_5 => FL_OUT_temp,
      in_6 => "0000000000000000",
      in_7 => PC_IN,
      p_out => OUT2);
  gate11: entity work.DIG_Register_BUS -- FL
    generic map (
      Bits => 16)
    port map (
      D => s15,
      C => clk,
      en => s16,
      Q => FL_OUT_temp);
  gate12: entity work.high_mask_in
    port map (
      D_HIGH => p_IN,
      D => s4,
      EN => HE,
      Q => s2);
  gate13: entity work.high_mask_in
    port map (
      D_HIGH => p_IN,
      D => s7,
      EN => HE,
      Q => s5);
  gate14: entity work.high_mask_in
    port map (
      D_HIGH => p_IN,
      D => s10,
      EN => HE,
      Q => s8);
  gate15: entity work.high_mask_in
    port map (
      D_HIGH => p_IN,
      D => s13,
      EN => HE,
      Q => s11);
  gate16: entity work.high_mask_in
    port map (
      D_HIGH => FL_IN,
      D => FL_OUT_temp,
      EN => HE,
      Q => s15);
  PC_WE <= PC_WE_temp;
  FL_OUT <= FL_OUT_temp;
end Behavioral;
