library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity matrix is
    port(clk, wr : in std_logic;
    row_addr : in std_logic_vector(2 downto 0);
    col_addr : in std_logic_vector(2 downto 0);
    din : in std_logic_vector(2 downto 0);
    dout : out std_logic_vector(2 downto 0));
end matrix;
    
architecture rtl of matrix is
    type ram_type is array (0 to 7, 0 to 7) of
    std_logic_vector(2 downto 0);
    signal program: ram_type;
    begin
    process(clk)
    begin
    if (rising_edge(clk)) then
    if (wr = '1') then
    program(conv_integer(unsigned(row_addr)), conv_integer(unsigned(col_addr))) <= din;
    end if;
    end if;
    end process;
    dout <= program(conv_integer(unsigned(row_addr)), conv_integer(unsigned(col_addr)));
    end rtl;