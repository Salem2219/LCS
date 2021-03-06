library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity compgr is
    port (a, b : in std_logic_vector(2 downto 0);
    y : out std_logic);
end compgr;

architecture rtl of compgr is
    begin
    y <= '1' when unsigned(a) > unsigned(b) else '0';
end rtl;