opcode_select_s <= "110111";
sA_s <= "00000000";
wait for waitTime;
assert sALU_s = "10000000" and sZERO_s = '1' and sCarry_s='0'
	 report "SR1 error at 00000000" severity error;

sA_s <= "00000000";
wait for waitTime;
assert sALU_s = "10000000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00000000" severity error;

sA_s <= "00000001";
wait for waitTime;
assert sALU_s = "10000000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00000001" severity error;

sA_s <= "00000010";
wait for waitTime;
assert sALU_s = "10000001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00000010" severity error;

sA_s <= "00000011";
wait for waitTime;
assert sALU_s = "10000001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00000011" severity error;

sA_s <= "00000100";
wait for waitTime;
assert sALU_s = "10000010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00000100" severity error;

sA_s <= "00000101";
wait for waitTime;
assert sALU_s = "10000010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00000101" severity error;

sA_s <= "00000110";
wait for waitTime;
assert sALU_s = "10000011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00000110" severity error;

sA_s <= "00000111";
wait for waitTime;
assert sALU_s = "10000011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00000111" severity error;

sA_s <= "00001000";
wait for waitTime;
assert sALU_s = "10000100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00001000" severity error;

sA_s <= "00001001";
wait for waitTime;
assert sALU_s = "10000100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00001001" severity error;

sA_s <= "00001010";
wait for waitTime;
assert sALU_s = "10000101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00001010" severity error;

sA_s <= "00001011";
wait for waitTime;
assert sALU_s = "10000101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00001011" severity error;

sA_s <= "00001100";
wait for waitTime;
assert sALU_s = "10000110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00001100" severity error;

sA_s <= "00001101";
wait for waitTime;
assert sALU_s = "10000110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00001101" severity error;

sA_s <= "00001110";
wait for waitTime;
assert sALU_s = "10000111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00001110" severity error;

sA_s <= "00001111";
wait for waitTime;
assert sALU_s = "10000111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00001111" severity error;

sA_s <= "00010000";
wait for waitTime;
assert sALU_s = "10001000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00010000" severity error;

sA_s <= "00010001";
wait for waitTime;
assert sALU_s = "10001000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00010001" severity error;

sA_s <= "00010010";
wait for waitTime;
assert sALU_s = "10001001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00010010" severity error;

sA_s <= "00010011";
wait for waitTime;
assert sALU_s = "10001001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00010011" severity error;

sA_s <= "00010100";
wait for waitTime;
assert sALU_s = "10001010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00010100" severity error;

sA_s <= "00010101";
wait for waitTime;
assert sALU_s = "10001010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00010101" severity error;

sA_s <= "00010110";
wait for waitTime;
assert sALU_s = "10001011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00010110" severity error;

sA_s <= "00010111";
wait for waitTime;
assert sALU_s = "10001011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00010111" severity error;

sA_s <= "00011000";
wait for waitTime;
assert sALU_s = "10001100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00011000" severity error;

sA_s <= "00011001";
wait for waitTime;
assert sALU_s = "10001100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00011001" severity error;

sA_s <= "00011010";
wait for waitTime;
assert sALU_s = "10001101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00011010" severity error;

sA_s <= "00011011";
wait for waitTime;
assert sALU_s = "10001101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00011011" severity error;

sA_s <= "00011100";
wait for waitTime;
assert sALU_s = "10001110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00011100" severity error;

sA_s <= "00011101";
wait for waitTime;
assert sALU_s = "10001110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00011101" severity error;

sA_s <= "00011110";
wait for waitTime;
assert sALU_s = "10001111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00011110" severity error;

sA_s <= "00011111";
wait for waitTime;
assert sALU_s = "10001111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00011111" severity error;

sA_s <= "00100000";
wait for waitTime;
assert sALU_s = "10010000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00100000" severity error;

sA_s <= "00100001";
wait for waitTime;
assert sALU_s = "10010000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00100001" severity error;

sA_s <= "00100010";
wait for waitTime;
assert sALU_s = "10010001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00100010" severity error;

sA_s <= "00100011";
wait for waitTime;
assert sALU_s = "10010001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00100011" severity error;

sA_s <= "00100100";
wait for waitTime;
assert sALU_s = "10010010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00100100" severity error;

sA_s <= "00100101";
wait for waitTime;
assert sALU_s = "10010010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00100101" severity error;

sA_s <= "00100110";
wait for waitTime;
assert sALU_s = "10010011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00100110" severity error;

sA_s <= "00100111";
wait for waitTime;
assert sALU_s = "10010011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00100111" severity error;

sA_s <= "00101000";
wait for waitTime;
assert sALU_s = "10010100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00101000" severity error;

sA_s <= "00101001";
wait for waitTime;
assert sALU_s = "10010100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00101001" severity error;

sA_s <= "00101010";
wait for waitTime;
assert sALU_s = "10010101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00101010" severity error;

sA_s <= "00101011";
wait for waitTime;
assert sALU_s = "10010101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00101011" severity error;

sA_s <= "00101100";
wait for waitTime;
assert sALU_s = "10010110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00101100" severity error;

sA_s <= "00101101";
wait for waitTime;
assert sALU_s = "10010110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00101101" severity error;

sA_s <= "00101110";
wait for waitTime;
assert sALU_s = "10010111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00101110" severity error;

sA_s <= "00101111";
wait for waitTime;
assert sALU_s = "10010111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00101111" severity error;

sA_s <= "00110000";
wait for waitTime;
assert sALU_s = "10011000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00110000" severity error;

sA_s <= "00110001";
wait for waitTime;
assert sALU_s = "10011000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00110001" severity error;

sA_s <= "00110010";
wait for waitTime;
assert sALU_s = "10011001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00110010" severity error;

sA_s <= "00110011";
wait for waitTime;
assert sALU_s = "10011001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00110011" severity error;

sA_s <= "00110100";
wait for waitTime;
assert sALU_s = "10011010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00110100" severity error;

sA_s <= "00110101";
wait for waitTime;
assert sALU_s = "10011010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00110101" severity error;

sA_s <= "00110110";
wait for waitTime;
assert sALU_s = "10011011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00110110" severity error;

sA_s <= "00110111";
wait for waitTime;
assert sALU_s = "10011011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00110111" severity error;

sA_s <= "00111000";
wait for waitTime;
assert sALU_s = "10011100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00111000" severity error;

sA_s <= "00111001";
wait for waitTime;
assert sALU_s = "10011100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00111001" severity error;

sA_s <= "00111010";
wait for waitTime;
assert sALU_s = "10011101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00111010" severity error;

sA_s <= "00111011";
wait for waitTime;
assert sALU_s = "10011101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00111011" severity error;

sA_s <= "00111100";
wait for waitTime;
assert sALU_s = "10011110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00111100" severity error;

sA_s <= "00111101";
wait for waitTime;
assert sALU_s = "10011110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00111101" severity error;

sA_s <= "00111110";
wait for waitTime;
assert sALU_s = "10011111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 00111110" severity error;

sA_s <= "00111111";
wait for waitTime;
assert sALU_s = "10011111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 00111111" severity error;

sA_s <= "01000000";
wait for waitTime;
assert sALU_s = "10100000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01000000" severity error;

sA_s <= "01000001";
wait for waitTime;
assert sALU_s = "10100000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01000001" severity error;

sA_s <= "01000010";
wait for waitTime;
assert sALU_s = "10100001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01000010" severity error;

sA_s <= "01000011";
wait for waitTime;
assert sALU_s = "10100001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01000011" severity error;

sA_s <= "01000100";
wait for waitTime;
assert sALU_s = "10100010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01000100" severity error;

sA_s <= "01000101";
wait for waitTime;
assert sALU_s = "10100010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01000101" severity error;

sA_s <= "01000110";
wait for waitTime;
assert sALU_s = "10100011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01000110" severity error;

sA_s <= "01000111";
wait for waitTime;
assert sALU_s = "10100011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01000111" severity error;

sA_s <= "01001000";
wait for waitTime;
assert sALU_s = "10100100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01001000" severity error;

sA_s <= "01001001";
wait for waitTime;
assert sALU_s = "10100100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01001001" severity error;

sA_s <= "01001010";
wait for waitTime;
assert sALU_s = "10100101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01001010" severity error;

sA_s <= "01001011";
wait for waitTime;
assert sALU_s = "10100101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01001011" severity error;

sA_s <= "01001100";
wait for waitTime;
assert sALU_s = "10100110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01001100" severity error;

sA_s <= "01001101";
wait for waitTime;
assert sALU_s = "10100110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01001101" severity error;

sA_s <= "01001110";
wait for waitTime;
assert sALU_s = "10100111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01001110" severity error;

sA_s <= "01001111";
wait for waitTime;
assert sALU_s = "10100111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01001111" severity error;

sA_s <= "01010000";
wait for waitTime;
assert sALU_s = "10101000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01010000" severity error;

sA_s <= "01010001";
wait for waitTime;
assert sALU_s = "10101000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01010001" severity error;

sA_s <= "01010010";
wait for waitTime;
assert sALU_s = "10101001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01010010" severity error;

sA_s <= "01010011";
wait for waitTime;
assert sALU_s = "10101001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01010011" severity error;

sA_s <= "01010100";
wait for waitTime;
assert sALU_s = "10101010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01010100" severity error;

sA_s <= "01010101";
wait for waitTime;
assert sALU_s = "10101010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01010101" severity error;

sA_s <= "01010110";
wait for waitTime;
assert sALU_s = "10101011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01010110" severity error;

sA_s <= "01010111";
wait for waitTime;
assert sALU_s = "10101011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01010111" severity error;

sA_s <= "01011000";
wait for waitTime;
assert sALU_s = "10101100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01011000" severity error;

sA_s <= "01011001";
wait for waitTime;
assert sALU_s = "10101100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01011001" severity error;

sA_s <= "01011010";
wait for waitTime;
assert sALU_s = "10101101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01011010" severity error;

sA_s <= "01011011";
wait for waitTime;
assert sALU_s = "10101101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01011011" severity error;

sA_s <= "01011100";
wait for waitTime;
assert sALU_s = "10101110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01011100" severity error;

sA_s <= "01011101";
wait for waitTime;
assert sALU_s = "10101110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01011101" severity error;

sA_s <= "01011110";
wait for waitTime;
assert sALU_s = "10101111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01011110" severity error;

sA_s <= "01011111";
wait for waitTime;
assert sALU_s = "10101111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01011111" severity error;

sA_s <= "01100000";
wait for waitTime;
assert sALU_s = "10110000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01100000" severity error;

sA_s <= "01100001";
wait for waitTime;
assert sALU_s = "10110000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01100001" severity error;

sA_s <= "01100010";
wait for waitTime;
assert sALU_s = "10110001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01100010" severity error;

sA_s <= "01100011";
wait for waitTime;
assert sALU_s = "10110001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01100011" severity error;

sA_s <= "01100100";
wait for waitTime;
assert sALU_s = "10110010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01100100" severity error;

sA_s <= "01100101";
wait for waitTime;
assert sALU_s = "10110010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01100101" severity error;

sA_s <= "01100110";
wait for waitTime;
assert sALU_s = "10110011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01100110" severity error;

sA_s <= "01100111";
wait for waitTime;
assert sALU_s = "10110011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01100111" severity error;

sA_s <= "01101000";
wait for waitTime;
assert sALU_s = "10110100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01101000" severity error;

sA_s <= "01101001";
wait for waitTime;
assert sALU_s = "10110100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01101001" severity error;

sA_s <= "01101010";
wait for waitTime;
assert sALU_s = "10110101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01101010" severity error;

sA_s <= "01101011";
wait for waitTime;
assert sALU_s = "10110101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01101011" severity error;

sA_s <= "01101100";
wait for waitTime;
assert sALU_s = "10110110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01101100" severity error;

sA_s <= "01101101";
wait for waitTime;
assert sALU_s = "10110110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01101101" severity error;

sA_s <= "01101110";
wait for waitTime;
assert sALU_s = "10110111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01101110" severity error;

sA_s <= "01101111";
wait for waitTime;
assert sALU_s = "10110111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01101111" severity error;

sA_s <= "01110000";
wait for waitTime;
assert sALU_s = "10111000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01110000" severity error;

sA_s <= "01110001";
wait for waitTime;
assert sALU_s = "10111000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01110001" severity error;

sA_s <= "01110010";
wait for waitTime;
assert sALU_s = "10111001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01110010" severity error;

sA_s <= "01110011";
wait for waitTime;
assert sALU_s = "10111001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01110011" severity error;

sA_s <= "01110100";
wait for waitTime;
assert sALU_s = "10111010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01110100" severity error;

sA_s <= "01110101";
wait for waitTime;
assert sALU_s = "10111010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01110101" severity error;

sA_s <= "01110110";
wait for waitTime;
assert sALU_s = "10111011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01110110" severity error;

sA_s <= "01110111";
wait for waitTime;
assert sALU_s = "10111011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01110111" severity error;

sA_s <= "01111000";
wait for waitTime;
assert sALU_s = "10111100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01111000" severity error;

sA_s <= "01111001";
wait for waitTime;
assert sALU_s = "10111100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01111001" severity error;

sA_s <= "01111010";
wait for waitTime;
assert sALU_s = "10111101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01111010" severity error;

sA_s <= "01111011";
wait for waitTime;
assert sALU_s = "10111101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01111011" severity error;

sA_s <= "01111100";
wait for waitTime;
assert sALU_s = "10111110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01111100" severity error;

sA_s <= "01111101";
wait for waitTime;
assert sALU_s = "10111110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01111101" severity error;

sA_s <= "01111110";
wait for waitTime;
assert sALU_s = "10111111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 01111110" severity error;

sA_s <= "01111111";
wait for waitTime;
assert sALU_s = "10111111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 01111111" severity error;

sA_s <= "10000000";
wait for waitTime;
assert sALU_s = "11000000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10000000" severity error;

sA_s <= "10000001";
wait for waitTime;
assert sALU_s = "11000000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10000001" severity error;

sA_s <= "10000010";
wait for waitTime;
assert sALU_s = "11000001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10000010" severity error;

sA_s <= "10000011";
wait for waitTime;
assert sALU_s = "11000001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10000011" severity error;

sA_s <= "10000100";
wait for waitTime;
assert sALU_s = "11000010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10000100" severity error;

sA_s <= "10000101";
wait for waitTime;
assert sALU_s = "11000010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10000101" severity error;

sA_s <= "10000110";
wait for waitTime;
assert sALU_s = "11000011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10000110" severity error;

sA_s <= "10000111";
wait for waitTime;
assert sALU_s = "11000011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10000111" severity error;

sA_s <= "10001000";
wait for waitTime;
assert sALU_s = "11000100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10001000" severity error;

sA_s <= "10001001";
wait for waitTime;
assert sALU_s = "11000100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10001001" severity error;

sA_s <= "10001010";
wait for waitTime;
assert sALU_s = "11000101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10001010" severity error;

sA_s <= "10001011";
wait for waitTime;
assert sALU_s = "11000101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10001011" severity error;

sA_s <= "10001100";
wait for waitTime;
assert sALU_s = "11000110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10001100" severity error;

sA_s <= "10001101";
wait for waitTime;
assert sALU_s = "11000110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10001101" severity error;

sA_s <= "10001110";
wait for waitTime;
assert sALU_s = "11000111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10001110" severity error;

sA_s <= "10001111";
wait for waitTime;
assert sALU_s = "11000111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10001111" severity error;

sA_s <= "10010000";
wait for waitTime;
assert sALU_s = "11001000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10010000" severity error;

sA_s <= "10010001";
wait for waitTime;
assert sALU_s = "11001000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10010001" severity error;

sA_s <= "10010010";
wait for waitTime;
assert sALU_s = "11001001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10010010" severity error;

sA_s <= "10010011";
wait for waitTime;
assert sALU_s = "11001001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10010011" severity error;

sA_s <= "10010100";
wait for waitTime;
assert sALU_s = "11001010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10010100" severity error;

sA_s <= "10010101";
wait for waitTime;
assert sALU_s = "11001010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10010101" severity error;

sA_s <= "10010110";
wait for waitTime;
assert sALU_s = "11001011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10010110" severity error;

sA_s <= "10010111";
wait for waitTime;
assert sALU_s = "11001011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10010111" severity error;

sA_s <= "10011000";
wait for waitTime;
assert sALU_s = "11001100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10011000" severity error;

sA_s <= "10011001";
wait for waitTime;
assert sALU_s = "11001100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10011001" severity error;

sA_s <= "10011010";
wait for waitTime;
assert sALU_s = "11001101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10011010" severity error;

sA_s <= "10011011";
wait for waitTime;
assert sALU_s = "11001101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10011011" severity error;

sA_s <= "10011100";
wait for waitTime;
assert sALU_s = "11001110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10011100" severity error;

sA_s <= "10011101";
wait for waitTime;
assert sALU_s = "11001110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10011101" severity error;

sA_s <= "10011110";
wait for waitTime;
assert sALU_s = "11001111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10011110" severity error;

sA_s <= "10011111";
wait for waitTime;
assert sALU_s = "11001111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10011111" severity error;

sA_s <= "10100000";
wait for waitTime;
assert sALU_s = "11010000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10100000" severity error;

sA_s <= "10100001";
wait for waitTime;
assert sALU_s = "11010000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10100001" severity error;

sA_s <= "10100010";
wait for waitTime;
assert sALU_s = "11010001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10100010" severity error;

sA_s <= "10100011";
wait for waitTime;
assert sALU_s = "11010001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10100011" severity error;

sA_s <= "10100100";
wait for waitTime;
assert sALU_s = "11010010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10100100" severity error;

sA_s <= "10100101";
wait for waitTime;
assert sALU_s = "11010010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10100101" severity error;

sA_s <= "10100110";
wait for waitTime;
assert sALU_s = "11010011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10100110" severity error;

sA_s <= "10100111";
wait for waitTime;
assert sALU_s = "11010011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10100111" severity error;

sA_s <= "10101000";
wait for waitTime;
assert sALU_s = "11010100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10101000" severity error;

sA_s <= "10101001";
wait for waitTime;
assert sALU_s = "11010100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10101001" severity error;

sA_s <= "10101010";
wait for waitTime;
assert sALU_s = "11010101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10101010" severity error;

sA_s <= "10101011";
wait for waitTime;
assert sALU_s = "11010101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10101011" severity error;

sA_s <= "10101100";
wait for waitTime;
assert sALU_s = "11010110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10101100" severity error;

sA_s <= "10101101";
wait for waitTime;
assert sALU_s = "11010110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10101101" severity error;

sA_s <= "10101110";
wait for waitTime;
assert sALU_s = "11010111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10101110" severity error;

sA_s <= "10101111";
wait for waitTime;
assert sALU_s = "11010111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10101111" severity error;

sA_s <= "10110000";
wait for waitTime;
assert sALU_s = "11011000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10110000" severity error;

sA_s <= "10110001";
wait for waitTime;
assert sALU_s = "11011000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10110001" severity error;

sA_s <= "10110010";
wait for waitTime;
assert sALU_s = "11011001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10110010" severity error;

sA_s <= "10110011";
wait for waitTime;
assert sALU_s = "11011001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10110011" severity error;

sA_s <= "10110100";
wait for waitTime;
assert sALU_s = "11011010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10110100" severity error;

sA_s <= "10110101";
wait for waitTime;
assert sALU_s = "11011010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10110101" severity error;

sA_s <= "10110110";
wait for waitTime;
assert sALU_s = "11011011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10110110" severity error;

sA_s <= "10110111";
wait for waitTime;
assert sALU_s = "11011011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10110111" severity error;

sA_s <= "10111000";
wait for waitTime;
assert sALU_s = "11011100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10111000" severity error;

sA_s <= "10111001";
wait for waitTime;
assert sALU_s = "11011100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10111001" severity error;

sA_s <= "10111010";
wait for waitTime;
assert sALU_s = "11011101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10111010" severity error;

sA_s <= "10111011";
wait for waitTime;
assert sALU_s = "11011101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10111011" severity error;

sA_s <= "10111100";
wait for waitTime;
assert sALU_s = "11011110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10111100" severity error;

sA_s <= "10111101";
wait for waitTime;
assert sALU_s = "11011110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10111101" severity error;

sA_s <= "10111110";
wait for waitTime;
assert sALU_s = "11011111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 10111110" severity error;

sA_s <= "10111111";
wait for waitTime;
assert sALU_s = "11011111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 10111111" severity error;

sA_s <= "11000000";
wait for waitTime;
assert sALU_s = "11100000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11000000" severity error;

sA_s <= "11000001";
wait for waitTime;
assert sALU_s = "11100000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11000001" severity error;

sA_s <= "11000010";
wait for waitTime;
assert sALU_s = "11100001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11000010" severity error;

sA_s <= "11000011";
wait for waitTime;
assert sALU_s = "11100001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11000011" severity error;

sA_s <= "11000100";
wait for waitTime;
assert sALU_s = "11100010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11000100" severity error;

sA_s <= "11000101";
wait for waitTime;
assert sALU_s = "11100010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11000101" severity error;

sA_s <= "11000110";
wait for waitTime;
assert sALU_s = "11100011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11000110" severity error;

sA_s <= "11000111";
wait for waitTime;
assert sALU_s = "11100011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11000111" severity error;

sA_s <= "11001000";
wait for waitTime;
assert sALU_s = "11100100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11001000" severity error;

sA_s <= "11001001";
wait for waitTime;
assert sALU_s = "11100100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11001001" severity error;

sA_s <= "11001010";
wait for waitTime;
assert sALU_s = "11100101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11001010" severity error;

sA_s <= "11001011";
wait for waitTime;
assert sALU_s = "11100101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11001011" severity error;

sA_s <= "11001100";
wait for waitTime;
assert sALU_s = "11100110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11001100" severity error;

sA_s <= "11001101";
wait for waitTime;
assert sALU_s = "11100110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11001101" severity error;

sA_s <= "11001110";
wait for waitTime;
assert sALU_s = "11100111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11001110" severity error;

sA_s <= "11001111";
wait for waitTime;
assert sALU_s = "11100111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11001111" severity error;

sA_s <= "11010000";
wait for waitTime;
assert sALU_s = "11101000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11010000" severity error;

sA_s <= "11010001";
wait for waitTime;
assert sALU_s = "11101000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11010001" severity error;

sA_s <= "11010010";
wait for waitTime;
assert sALU_s = "11101001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11010010" severity error;

sA_s <= "11010011";
wait for waitTime;
assert sALU_s = "11101001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11010011" severity error;

sA_s <= "11010100";
wait for waitTime;
assert sALU_s = "11101010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11010100" severity error;

sA_s <= "11010101";
wait for waitTime;
assert sALU_s = "11101010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11010101" severity error;

sA_s <= "11010110";
wait for waitTime;
assert sALU_s = "11101011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11010110" severity error;

sA_s <= "11010111";
wait for waitTime;
assert sALU_s = "11101011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11010111" severity error;

sA_s <= "11011000";
wait for waitTime;
assert sALU_s = "11101100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11011000" severity error;

sA_s <= "11011001";
wait for waitTime;
assert sALU_s = "11101100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11011001" severity error;

sA_s <= "11011010";
wait for waitTime;
assert sALU_s = "11101101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11011010" severity error;

sA_s <= "11011011";
wait for waitTime;
assert sALU_s = "11101101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11011011" severity error;

sA_s <= "11011100";
wait for waitTime;
assert sALU_s = "11101110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11011100" severity error;

sA_s <= "11011101";
wait for waitTime;
assert sALU_s = "11101110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11011101" severity error;

sA_s <= "11011110";
wait for waitTime;
assert sALU_s = "11101111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11011110" severity error;

sA_s <= "11011111";
wait for waitTime;
assert sALU_s = "11101111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11011111" severity error;

sA_s <= "11100000";
wait for waitTime;
assert sALU_s = "11110000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11100000" severity error;

sA_s <= "11100001";
wait for waitTime;
assert sALU_s = "11110000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11100001" severity error;

sA_s <= "11100010";
wait for waitTime;
assert sALU_s = "11110001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11100010" severity error;

sA_s <= "11100011";
wait for waitTime;
assert sALU_s = "11110001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11100011" severity error;

sA_s <= "11100100";
wait for waitTime;
assert sALU_s = "11110010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11100100" severity error;

sA_s <= "11100101";
wait for waitTime;
assert sALU_s = "11110010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11100101" severity error;

sA_s <= "11100110";
wait for waitTime;
assert sALU_s = "11110011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11100110" severity error;

sA_s <= "11100111";
wait for waitTime;
assert sALU_s = "11110011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11100111" severity error;

sA_s <= "11101000";
wait for waitTime;
assert sALU_s = "11110100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11101000" severity error;

sA_s <= "11101001";
wait for waitTime;
assert sALU_s = "11110100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11101001" severity error;

sA_s <= "11101010";
wait for waitTime;
assert sALU_s = "11110101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11101010" severity error;

sA_s <= "11101011";
wait for waitTime;
assert sALU_s = "11110101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11101011" severity error;

sA_s <= "11101100";
wait for waitTime;
assert sALU_s = "11110110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11101100" severity error;

sA_s <= "11101101";
wait for waitTime;
assert sALU_s = "11110110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11101101" severity error;

sA_s <= "11101110";
wait for waitTime;
assert sALU_s = "11110111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11101110" severity error;

sA_s <= "11101111";
wait for waitTime;
assert sALU_s = "11110111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11101111" severity error;

sA_s <= "11110000";
wait for waitTime;
assert sALU_s = "11111000" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11110000" severity error;

sA_s <= "11110001";
wait for waitTime;
assert sALU_s = "11111000" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11110001" severity error;

sA_s <= "11110010";
wait for waitTime;
assert sALU_s = "11111001" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11110010" severity error;

sA_s <= "11110011";
wait for waitTime;
assert sALU_s = "11111001" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11110011" severity error;

sA_s <= "11110100";
wait for waitTime;
assert sALU_s = "11111010" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11110100" severity error;

sA_s <= "11110101";
wait for waitTime;
assert sALU_s = "11111010" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11110101" severity error;

sA_s <= "11110110";
wait for waitTime;
assert sALU_s = "11111011" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11110110" severity error;

sA_s <= "11110111";
wait for waitTime;
assert sALU_s = "11111011" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11110111" severity error;

sA_s <= "11111000";
wait for waitTime;
assert sALU_s = "11111100" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11111000" severity error;

sA_s <= "11111001";
wait for waitTime;
assert sALU_s = "11111100" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11111001" severity error;

sA_s <= "11111010";
wait for waitTime;
assert sALU_s = "11111101" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11111010" severity error;

sA_s <= "11111011";
wait for waitTime;
assert sALU_s = "11111101" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11111011" severity error;

sA_s <= "11111100";
wait for waitTime;
assert sALU_s = "11111110" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11111100" severity error;

sA_s <= "11111101";
wait for waitTime;
assert sALU_s = "11111110" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11111101" severity error;

sA_s <= "11111110";
wait for waitTime;
assert sALU_s = "11111111" and sZERO_s = '0' and sCarry_s='0'
	report "SR1 error at 11111110" severity error;

sA_s <= "11111111";
wait for waitTime;
assert sALU_s = "11111111" and sZERO_s = '0' and sCarry_s='1'
	report "SR1 error at 11111111" severity error;

