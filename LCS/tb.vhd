library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb is
end tb ;

architecture behav of tb is
  constant clockperiod: time:= 0.1 ns;
  signal clk: std_logic:='0';
  signal rst,start: std_logic;
  signal n, m : std_logic_vector(2 downto 0);
  component test
    port (clk, rst, start : in std_logic;
    m, n : in std_logic_vector(2 downto 0));
  end component ;
  begin
    clk <= not clk after clockperiod /2;
    rst <= '1' , '0' after 0.1 ns;
    start <= '0' , '1' after 0.1 ns, '0' after 0.5 ns;
    n <= "111";
    m <= "111";
    dut: test port map(clk,rst,start,m,n);
  end behav;