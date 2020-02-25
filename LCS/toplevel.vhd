library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port (clk, rst, start : in std_logic;
    m, n, c : in std_logic_vector(2 downto 0);
    a, b : in std_logic_vector(4 downto 0);
    c_wr : out std_logic;
    c_row, c_col, c_din, a_addr, b_addr : out std_logic_vector(2 downto 0));
end toplevel;

architecture rtl of toplevel is
    component dp is
        port (clk, rst, i_sel, i_ld, j_sel, j_ld, temp1_ld, temp2_ld, temp3_ld : in std_logic;
        crow_sel, ccol_sel, cdin_sel : in std_logic_vector(1 downto 0);
        m, n, c : in std_logic_vector(2 downto 0);
        a, b : in std_logic_vector(4 downto 0);
        ieqmplus1, jeqnplus1, aeqb, temp1grtemp2 : out std_logic;
        c_row, c_col, c_din, a_addr, b_addr : out std_logic_vector(2 downto 0));
    end component;
    component ctrl is
        port (clk, rst, start, ieqmplus1, jeqnplus1, aeqb, temp1grtemp2 : in std_logic;
        i_sel, i_ld, j_sel, j_ld, temp1_ld, temp2_ld, temp3_ld, c_wr : out std_logic;
        crow_sel, ccol_sel, cdin_sel : out std_logic_vector(1 downto 0));
    end component;
    signal i_sel, i_ld, j_sel, j_ld, temp1_ld, temp2_ld, temp3_ld, ieqmplus1, jeqnplus1, aeqb, temp1grtemp2 : std_logic;
    signal  crow_sel, ccol_sel, cdin_sel : std_logic_vector(1 downto 0);
    begin
        datapath : dp port map (clk, rst, i_sel, i_ld, j_sel, j_ld, temp1_ld, temp2_ld, temp3_ld, crow_sel, ccol_sel, cdin_sel, m, n, c, a, b, ieqmplus1, jeqnplus1, aeqb, temp1grtemp2, c_row, c_col, c_din, a_addr, b_addr);
        control : ctrl port map (clk, rst, start, ieqmplus1, jeqnplus1, aeqb, temp1grtemp2, i_sel, i_ld, j_sel, j_ld, temp1_ld, temp2_ld, temp3_ld, c_wr, crow_sel, ccol_sel, cdin_sel);
    end rtl;