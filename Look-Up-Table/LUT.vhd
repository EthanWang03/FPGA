library ieee;
use ieee.std_logic_1164.all

entity Look_Up_Table is
    port (
        i_Switch_1 : in std_logic;
        i_Switch_2 : in std_logic;
        i_Switch_3 : in std_logic;
        i_Switch_4 : in std_logic;
        o_LED_1 : out std_logic;
        o_LED_2 : out std_logic);

end entity Look_Up_Table;

architecture RTL of Look_Up_Table is

begin
    o_LED_1 <= i_Switch_1 and i_Switch_2;
    o_LED_2 <= i_Switch_3 or i_Switch_4;

end architecture RTL;
