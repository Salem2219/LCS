library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity test is
    port (clk, rst, start : in std_logic;
    m, n : in std_logic_vector(2 downto 0));
end test;

architecture rtl of test is
    component toplevel is
        port (clk, rst, start : in std_logic;
        m, n, c : in std_logic_vector(2 downto 0);
        a, b : in std_logic_vector(4 downto 0);
        c_wr : out std_logic;
        c_row, c_col, c_din, a_addr, b_addr : out std_logic_vector(2 downto 0));
    end component;
    component a_rom is
        port(addr: in std_logic_vector (2 downto 0);
        data: out std_logic_vector (4 downto 0));
    end component;
    component b_rom is
        port(addr: in std_logic_vector (2 downto 0);
        data: out std_logic_vector (4 downto 0));
    end component;
    component matrix is
        port(clk, wr : in std_logic;
        row_addr : in std_logic_vector(2 downto 0);
        col_addr : in std_logic_vector(2 downto 0);
        din : in std_logic_vector(2 downto 0);
        dout : out std_logic_vector(2 downto 0));
    end component;
    signal c_wr : std_logic;
    signal c, c_row, c_col, c_din, a_addr, b_addr : std_logic_vector(2 downto 0);
    signal a, b : std_logic_vector(4 downto 0);
    begin
        u1 : toplevel port map (clk, rst, start, m, n, c, a, b, c_wr, c_row, c_col, c_din, a_addr, b_addr);
        u2 : a_rom port map (a_addr, a);
        u3 : b_rom port map (b_addr, b);
        u4 : matrix port map (clk, c_wr, c_row, c_col, c_din, c);
    end rtl;