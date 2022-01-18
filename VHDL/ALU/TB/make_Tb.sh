#!/bin/bash
python3 ./write_tb.py
cp ALU_tb_ADD.vhd ALU_tb_ADD_kk.vhd	
sed -i 's/opcode_select_s <= "000000";/opcode_select_s <= "000001";/g' ALU_tb_ADD_kk.vhd
cp ALU_tb_ADDCY0.vhd ALU_tb_ADDCY0_kk.vhd	
sed -i 's/opcode_select_s <= "000010";/opcode_select_s <= "000011";/g' ALU_tb_ADDCY0_kk.vhd
cp ALU_tb_ADDCY1.vhd ALU_tb_ADDCY1_kk.vhd	
sed -i 's/opcode_select_s <= "000010";/opcode_select_s <= "000011";/g' ALU_tb_ADDCY1_kk.vhd

cp ALU_tb_SUB.vhd ALU_tb_SUB_kk.vhd	
sed -i 's/opcode_select_s <= "000100";/opcode_select_s <= "000101";/g' ALU_tb_SUB_kk.vhd
cp ALU_tb_SUBCY0.vhd ALU_tb_SUBCY0_kk.vhd	
sed -i 's/opcode_select_s <= "000110";/opcode_select_s <= "000111";/g' ALU_tb_SUBCY0_kk.vhd
cp ALU_tb_SUBCY1.vhd ALU_tb_SUBCY1_kk.vhd	
sed -i 's/opcode_select_s <= "000110";/opcode_select_s <= "000111";/g' ALU_tb_SUBCY1_kk.vhd

cp ALU_tb_COMPARE.vhd ALU_tb_COMPARE_kk.vhd	
sed -i 's/opcode_select_s <= "011010";/opcode_select_s <= "011011";/g' ALU_tb_COMPARE_kk.vhd
cp ALU_tb_TEST.vhd ALU_tb_TEST_kk.vhd	
sed -i 's/opcode_select_s <= "011000";/opcode_select_s <= "011001";/g' ALU_tb_TEST_kk.vhd

cp ALU_tb_AND.vhd ALU_tb_AND_kk.vhd	
sed -i 's/opcode_select_s <= "001000";/opcode_select_s <= "001001";/g' ALU_tb_AND_kk.vhd
cp ALU_tb_OR.vhd ALU_tb_OR_kk.vhd	
sed -i 's/opcode_select_s <= "001010";/opcode_select_s <= "001011";/g' ALU_tb_OR_kk.vhd
cp ALU_tb_XOR.vhd ALU_tb_XOR_kk.vhd	
sed -i 's/opcode_select_s <= "001100";/opcode_select_s <= "001101";/g' ALU_tb_XOR_kk.vhd

cp ALU_tb_LOAD.vhd ALU_tb_LOAD_kk.vhd	
sed -i 's/opcode_select_s <= "001110";/opcode_select_s <= "001111";/g' ALU_tb_LOAD_kk.vhd

cat template_begining.vhd ALU_tb_*.vhd template_end.vhd > ../ALU_tb_COMPLETE.vhd