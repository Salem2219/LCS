library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity a_rom is
    port(addr: in std_logic_vector (2 downto 0);
    data: out std_logic_vector (4 downto 0));
    end a_rom;
    architecture rtl of a_rom is
    type letters is (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z);
    type rom_type is array (0 to 7) of letters;
    constant program : rom_type := (x, G, D, V, E, G, T, A); 
    begin
    data <= "00000" when program(conv_integer(unsigned(addr))) = A else
    "00001" when program(conv_integer(unsigned(addr))) = B else
    "00010" when program(conv_integer(unsigned(addr))) = C else
    "00011" when program(conv_integer(unsigned(addr))) = D else
    "00100" when program(conv_integer(unsigned(addr))) = E else
    "00101" when program(conv_integer(unsigned(addr))) = F else
    "00110" when program(conv_integer(unsigned(addr))) = G else
    "00111" when program(conv_integer(unsigned(addr))) = H else
    "01000" when program(conv_integer(unsigned(addr))) = I else
    "01001" when program(conv_integer(unsigned(addr))) = J else
    "01010" when program(conv_integer(unsigned(addr))) = K else
    "01011" when program(conv_integer(unsigned(addr))) = L else
    "01100" when program(conv_integer(unsigned(addr))) = M else
    "01101" when program(conv_integer(unsigned(addr))) = N else
    "01110" when program(conv_integer(unsigned(addr))) = O else
    "01111" when program(conv_integer(unsigned(addr))) = P else
    "10000" when program(conv_integer(unsigned(addr))) = Q else
    "10001" when program(conv_integer(unsigned(addr))) = R else
    "10010" when program(conv_integer(unsigned(addr))) = S else
    "10011" when program(conv_integer(unsigned(addr))) = T else
    "10100" when program(conv_integer(unsigned(addr))) = U else
    "10101" when program(conv_integer(unsigned(addr))) = V else
    "10110" when program(conv_integer(unsigned(addr))) = W else
    "10111" when program(conv_integer(unsigned(addr))) = X else
    "11000" when program(conv_integer(unsigned(addr))) = Y else
    "11001" ;

    end rtl;