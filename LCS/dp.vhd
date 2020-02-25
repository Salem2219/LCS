library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, i_sel, i_ld, j_sel, j_ld, temp1_ld, temp2_ld, temp3_ld : in std_logic;
    crow_sel, ccol_sel, cdin_sel : in std_logic_vector(1 downto 0);
    m, n, c : in std_logic_vector(2 downto 0);
    a, b : in std_logic_vector(4 downto 0);
    ieqmplus1, jeqnplus1, aeqb, temp1grtemp2 : out std_logic;
    c_row, c_col, c_din, a_addr, b_addr : out std_logic_vector(2 downto 0));
end dp;

architecture rtl of dp is
    component adder3 is
        port (a, b : in std_logic_vector(2 downto 0);
        y : out std_logic_vector(2 downto 0));
    end component;
    component adder4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic_vector(3 downto 0));
    end component;
    component comp4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic);
    end component;
    component comp5 is
        port (a, b : in std_logic_vector(4 downto 0);
        y : out std_logic);
    end component;
    component compgr is
        port (a, b : in std_logic_vector(2 downto 0);
        y : out std_logic);
    end component;
    component mux2 is
        port (s: in std_logic;
        a, b : in std_logic_vector(3 downto 0);
        y: out std_logic_vector(3 downto 0)) ;
    end component;
    component mux4 is
        port (sel: in std_logic_vector (1 downto 0);
        a, b, c, d: in std_logic_vector(2 downto 0);
        y: out std_logic_vector(2 downto 0));
    end component;
    component reg3 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(2 downto 0);
        reg_out: out std_logic_vector(2 downto 0));
    end component;
    component reg4 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(3 downto 0);
        reg_out: out std_logic_vector(3 downto 0));
    end component;
    component sub3 is
        port (a, b : in std_logic_vector(2 downto 0);
        y : out std_logic_vector(2 downto 0));
    end component;
    signal x : std_logic_vector(3 downto 0);
    signal cplus1, iminus1, jminus1, temp1, temp2, temp3 : std_logic_vector(2 downto 0);
    signal iplus1, jplus1, i_in, i, j_in, j, mplus1, nplus1, m_ex, n_ex : std_logic_Vector(3 downto 0);  
    begin
        x <= "0000";
        m_ex(3) <= '0';
        m_ex(2 downto 0) <= m;
        n_ex(3) <= '0';
        n_ex(2 downto 0) <= n;
        i_reg : reg4 port map (clk, rst, i_ld, i_in, i);
        i_mux : mux2 port map (i_sel, iplus1, "0001", i_in);
        i_adder : adder4 port map (i, "0001", iplus1);
        j_reg : reg4 port map (clk, rst, j_ld, j_in, j);
        j_mux : mux2 port map (j_sel, "0001", jplus1, j_in);
        j_adder : adder4 port map (j, "0001", jplus1);
        temp1_reg : reg3 port map (clk, rst, temp1_ld, c, temp1);
        temp2_reg : reg3 port map (clk, rst, temp2_ld, c, temp2);
        temp3_reg : reg3 port map (clk, rst, temp3_ld, cplus1, temp3);
        c_adder : adder3 port map (c, "001", cplus1);
        row_mux : mux4 port map (crow_sel, i(2 downto 0), "000", iminus1, "000", c_row);
        i_sub : sub3 port map (i(2 downto 0), "001", iminus1);
        col_mux : mux4 port map (ccol_sel, "000", j(2 downto 0), jminus1, "000", c_col);
        j_sub : sub3 port map (j(2 downto 0), "001", jminus1);
        din_mux : mux4 port map (cdin_sel, temp2, temp1, "000", temp3, c_din);
        i_comp : comp4 port map (i, mplus1, ieqmplus1);
        m_adder : adder4 port map (m_ex, "0001", mplus1);
        j_comp : comp4 port map (j, nplus1, jeqnplus1);
        n_adder : adder4 port map (n_ex, "0001", nplus1);
        ab_comp : comp5 port map (a, b, aeqb);
        temp_comp : compgr port map (temp1, temp2, temp1grtemp2);        
        a_addr <= i(2 downto 0);
        b_addr <= j(2 downto 0);
    end rtl;


