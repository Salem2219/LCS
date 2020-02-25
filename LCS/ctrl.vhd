library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ctrl is
    port (clk, rst, start, ieqmplus1, jeqnplus1, aeqb, temp1grtemp2 : in std_logic;
    i_sel, i_ld, j_sel, j_ld, temp1_ld, temp2_ld, temp3_ld, c_wr : out std_logic;
    crow_sel, ccol_sel, cdin_sel : out std_logic_vector(1 downto 0));
end ctrl;

architecture rtl of ctrl is
    type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9, s10, s11, s12);
    signal current_state, next_state: state_type; 
    signal x : std_logic;
    begin
        x <= aeqb or temp1grtemp2;
        process (rst, clk)
        begin
            if (rst ='1') then
            current_state <= s0;
            elsif (rising_edge(clk)) then
            current_state <= next_state;
            end if;
        end process;
        process(current_state, start, ieqmplus1, jeqnplus1, aeqb, x)
        begin
            case current_state is
                when s0 =>
                i_sel <= '0';
                i_ld <= '0';
                j_sel <= '0';
                j_ld <= '0';
                temp1_ld <= '0';
                temp2_ld <= '0';
                temp3_ld <= '0';
                c_wr <= '0';
                crow_sel <= "00";
                ccol_sel <= "00";
                cdin_sel <= "00";
                next_state <= s1;
                when s1 =>
                i_sel <= '0';
                i_ld <= '0';
                j_sel <= '0';
                j_ld <= '1';
                temp1_ld <= '0';
                temp2_ld <= '0';
                temp3_ld <= '0';
                c_wr <= '0';
                crow_sel <= "00";
                ccol_sel <= "00";
                cdin_sel <= "00";
                if (start = '1') then
                next_state <= s2;
                else
                next_state <= s1;
                end if;
                when s2 =>
                i_sel <= '0';
                i_ld <= '0';
                j_sel <= '0';
                j_ld <= '0';
                temp1_ld <= '0';
                temp2_ld <= '0';
                temp3_ld <= '0';
                c_wr <= '0';
                crow_sel <= "00";
                ccol_sel <= "00";
                cdin_sel <= "00";
                if (ieqmplus1 = '0') then
                next_state <= s3;
                else
                next_state <= s4;
                end if;
                when s3 =>
                i_sel <= '0';
                i_ld <= '1';
                j_sel <= '0';
                j_ld <= '0';
                temp1_ld <= '0';
                temp2_ld <= '0';
                temp3_ld <= '0';
                c_wr <= '1';
                crow_sel <= "00";
                ccol_sel <= "00";
                cdin_sel <= "10";
                next_state <= s2;
                when s4 =>
                i_sel <= '1';
                i_ld <= '1';
                j_sel <= '0';
                j_ld <= '0';
                temp1_ld <= '0';
                temp2_ld <= '0';
                temp3_ld <= '0';
                c_wr <= '0';
                crow_sel <= "00";
                ccol_sel <= "00";
                cdin_sel <= "00";
                if (jeqnplus1 = '0') then
                next_state <= s5;
                else
                next_state <= s6;
                end if;
                when s5 =>
                i_sel <= '0';
                i_ld <= '0';
                j_sel <= '1';
                j_ld <= '1';
                temp1_ld <= '0';
                temp2_ld <= '0';
                temp3_ld <= '0';
                c_wr <= '1';
                crow_sel <= "01";
                ccol_sel <= "01";
                cdin_sel <= "10";
                next_state <= s4;
                when s6 =>
                i_sel <= '0';
                i_ld <= '0';
                j_sel <= '0';
                j_ld <= '1';
                temp1_ld <= '0';
                temp2_ld <= '0';
                temp3_ld <= '0';
                c_wr <= '0';
                crow_sel <= "00";
                ccol_sel <= "00";
                cdin_sel <= "00";
                if (ieqmplus1 = '0') then
                next_state <= s7;
                else
                next_state <= s1;
                end if;
                when s7 =>
                i_sel <= '0';
                i_ld <= '0';
                j_sel <= '0';
                j_ld <= '0';
                temp1_ld <= '0';
                temp2_ld <= '0';
                temp3_ld <= '0';
                c_wr <= '0';
                crow_sel <= "00";
                ccol_sel <= "00";
                cdin_sel <= "00";
                if (jeqnplus1 = '0') then
                next_state <= s8;
                else
                next_state <= s12;
                end if;
                when s8 =>
                i_sel <= '0';
                i_ld <= '0';
                j_sel <= '0';
                j_ld <= '0';
                temp1_ld <= '1';
                temp2_ld <= '0';
                temp3_ld <= '0';
                c_wr <= '0';
                crow_sel <= "10";
                ccol_sel <= "01";
                cdin_sel <= "00";
                next_state <= s9;
                when s9 =>
                i_sel <= '0';
                i_ld <= '0';
                j_sel <= '0';
                j_ld <= '0';
                temp1_ld <= '0';
                temp2_ld <= '1';
                temp3_ld <= '0';
                c_wr <= '0';
                crow_sel <= "00";
                ccol_sel <= "10";
                cdin_sel <= "00";
                next_state <= s10;
                when s10 =>
                i_sel <= '0';
                i_ld <= '0';
                j_sel <= '0';
                j_ld <= '0';
                temp1_ld <= '0';
                temp2_ld <= '0';
                temp3_ld <= '1';
                c_wr <= '0';
                crow_sel <= "10";
                ccol_sel <= "10";
                cdin_sel <= "00";
                next_state <= s11;
                when s11 =>
                i_sel <= '0';
                i_ld <= '0';
                j_sel <= '1';
                j_ld <= '1';
                temp1_ld <= '0';
                temp2_ld <= '0';
                temp3_ld <= '0';
                c_wr <= '1';
                crow_sel <= "00";
                ccol_sel <= "01";
                cdin_sel(1) <= aeqb;
                cdin_sel(0) <= x;
                next_state <= s7;
                when others =>
                i_sel <= '0';
                i_ld <= '1';
                j_sel <= '0';
                j_ld <= '0';
                temp1_ld <= '0';
                temp2_ld <= '0';
                temp3_ld <= '0';
                c_wr <= '0';
                crow_sel <= "00";
                ccol_sel <= "00";
                cdin_sel <= "00";
                next_state <= s6;
            end case;
        end process;
    end rtl;


