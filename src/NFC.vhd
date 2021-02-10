Library IEEE;
use IEEE.std_Logic_1164.all;
use IEEE.numeric_std.all;

entity NFC is
  port (
    clk        : in std_logic;
    rst        : in std_logic;
    cmd        : in std_logic_vector(32 downto 0);
    done       : out std_logic;
    M_RW       : out std_logic;
    M_A        : out std_logic_vector(6 downto 0);
    M_D        : inout std_logic_vector(7 downto 0);
    F_IO       : inout std_logic_vector(7 downto 0);
    F_CLE      : out std_logic;
    F_ALE      : out std_logic;
    F_REN      : out std_logic;
    F_WEN      : out std_logic;
    F_RB       : in std_logic
  );
end NFC;

architecture NFC_arc of NFC is

begin

end NFC_arc;  