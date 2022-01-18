import numpy

#RR

f = open("ALU_tb_RR.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_RR"))
    else:
        f.write("opcode_select_s <= \"110001\";\n")
        f.write("sA_s <= \"00000000\";\n")
        f.write("wait for waitTime;\n")
        f.write("assert sALU_s = \"00000000\" and sZERO_s = \'1\' and sCarry_s=\'0\'\n")
        f.write("\t report \"RR error at 00000000\" severity error;")
    
        for i in range(0, 2 ** 8):
            bin = numpy.binary_repr(i,8)
            f.write("sA_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            binRR = bin[7] + bin[0:7]
            f.write("assert sALU_s = \"" + binRR + "\" and sZERO_s = \'0\' and sCarry_s=\'" + bin[7] + "\'\n")
            f.write("\t" + "report \"RR error at " + bin + "\" severity error;\n\n")
f.close;



#RL

f = open("ALU_tb_RL.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_RL"))
    else:
        f.write("opcode_select_s <= \"110000\";")
        f.write("\n" + "sA_s <= \"00000000\";\n")
        f.write("wait for waitTime;\n")
        f.write("assert sALU_s = \"00000000\" and sZERO_s = \'1\' and sCarry_s=\'0\'\n")
        f.write("\t report \"RL error at 00000000\" severity error;\n\n")
        
        for i in range(0, 2 ** 8):
            bin = numpy.binary_repr(i,8)
            f.write("sA_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            binRL = bin[1:8] + bin[0]
            f.write("assert sALU_s = \"" + binRL + "\" and sZERO_s = \'0\' and sCarry_s=\'" + bin[0] + "\'\n")
            f.write("\t" + "report \"RL error at " + bin + "\" severity error;\n\n")
f.close()


# SL0
f = open("ALU_tb_SL0.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_SL0"))
    else:
        f.write("opcode_select_s <= \"110010\";")
        f.write("\n" + "sA_s <= \"00000000\";\n")
        f.write("wait for waitTime;\n")
        f.write("assert sALU_s = \"00000000\" and sZERO_s = \'1\' and sCarry_s=\'0\'\n")
        f.write("\t report \"SL0 error at 00000000\" severity error;\n\n")
        
        for i in range(0, 2 ** 8):
            bin = numpy.binary_repr(i,8)
            f.write("sA_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            binSL0 = bin[1:8] + "0"
            f.write("assert sALU_s = \"" + binSL0 + "\" and sZERO_s = \'0\' and sCarry_s=\'" + bin[0] + "\'\n")
            f.write("\t" + "report \"SL0 error at " + bin + "\" severity error;\n\n")

f.close()

# SL1
f = open("ALU_tb_SL1.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_SL1"))
    else:
        f.write("opcode_select_s <= \"110011\";")
        f.write("\n" + "sA_s <= \"00000000\";\n")
        f.write("wait for waitTime;\n")
        f.write("assert sALU_s = \"00000001\" and sZERO_s = \'1\' and sCarry_s=\'0\'\n")
        f.write("\t report \"SL1 error at 00000000\" severity error;\n\n")
        
        for i in range(0, 2 ** 8):
            bin = numpy.binary_repr(i,8)
            f.write("sA_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            binSL1 = bin[1:8] + "1"
            f.write("assert sALU_s = \"" + binSL1 + "\" and sZERO_s = \'0\' and sCarry_s=\'" + bin[0] + "\'\n")
            f.write("\t" + "report \"SL1 error at " + bin + "\" severity error;\n\n")
f.close()

# SLX
f = open("ALU_tb_SLX.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_SLX"))
    else:
        f.write("opcode_select_s <= \"110101\";")
        f.write("\n" + "sA_s <= \"00000000\";\n")
        f.write("wait for waitTime;\n")
        f.write("assert sALU_s = \"00000000\" and sZERO_s = \'1\' and sCarry_s=\'0\'\n")
        f.write("\t report \"SLX error at 00000000\" severity error;\n\n")
        
        for i in range(0, 2 ** 8):
            bin = numpy.binary_repr(i,8)
            f.write("sA_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            binSX = bin[1:8] + bin[7]
            f.write("assert sALU_s = \"" + binSX + "\" and sZERO_s = \'0\' and sCarry_s=\'" + bin[0] + "\'\n")
            f.write("\t" + "report \"SLX error at " + bin + "\" severity error;\n\n")
f.close()

#SR0
f = open("ALU_tb_SR0.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_SR0"))
    else:
        f.write("opcode_select_s <= \"110110\";")
        f.write("\n" + "sA_s <= \"00000000\";\n")
        f.write("wait for waitTime;\n")
        f.write("assert sALU_s = \"00000000\" and sZERO_s = \'1\' and sCarry_s=\'0\'\n")
        f.write("\t report \"SR0 error at 00000000\" severity error;\n\n")
        
        for i in range(0, 2 ** 8):
            bin = numpy.binary_repr(i,8)
            f.write("sA_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            binSX = "0" + bin[0:7]
            f.write("assert sALU_s = \"" + binSX + "\" and sZERO_s = \'0\' and sCarry_s=\'" + bin[7] + "\'\n")
            f.write("\t" + "report \"SR0 error at " + bin + "\" severity error;\n\n")
f.close()

#SR1
f = open("ALU_tb_SR1.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_SR1"))
    else:
        f.write("opcode_select_s <= \"110111\";")
        f.write("\n" + "sA_s <= \"00000000\";\n")
        f.write("wait for waitTime;\n")
        f.write("assert sALU_s = \"10000000\" and sZERO_s = \'1\' and sCarry_s=\'0\'\n")
        f.write("\t report \"SR1 error at 00000000\" severity error;\n\n")
        
        for i in range(0, 2 ** 8):
            bin = numpy.binary_repr(i,8)
            f.write("sA_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            binSX = "1" + bin[0:7]
            f.write("assert sALU_s = \"" + binSX + "\" and sZERO_s = \'0\' and sCarry_s=\'" + bin[7] + "\'\n")
            f.write("\t" + "report \"SR1 error at " + bin + "\" severity error;\n\n")
f.close()

#SRX
f = open("ALU_tb_SRX.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_SRX"))
    else:
        f.write("opcode_select_s <= \"111001\";")
        f.write("\n" + "sA_s <= \"00000000\";\n")
        f.write("wait for waitTime;\n")
        f.write("assert sALU_s = \"00000000\" and sZERO_s = \'1\' and sCarry_s=\'0\'\n")
        f.write("\t report \"SRX error at 00000000\" severity error;\n\n")
        
        for i in range(0, 2 ** 8):
            bin = numpy.binary_repr(i,8)
            f.write("sA_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            binSX = bin[0] + bin[0:7]
            f.write("assert sALU_s = \"" + binSX + "\" and sZERO_s = \'0\' and sCarry_s=\'" + bin[7] + "\'\n")
            f.write("\t" + "report \"SRX error at " + bin + "\" severity error;\n\n")
f.close()



#ADD
f = open("ALU_tb_ADD.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_ADD"))
    else:
        f.write("opcode_select_s <= \"000000\";")
        for i in range(0, 2 ** 8):
            for k in range(0, 2 ** 8):
                binI = numpy.binary_repr(i,8)
                binK = numpy.binary_repr(k,8)
                f.write("sA_s <= \"" + binI + "\";\n")
                f.write("sB_s <= \"" + binK + "\";\n")
                f.write("wait for waitTime;\n")
                binSum = numpy.binary_repr((i + k) % 256,8)
                f.write("assert sALU_s = \"" + binSum + "\" and sZERO_s = \'" + str(int((i + k) % 256 == 0)) + "\' and sCarry_s=\'" + str(int((i + k) > 255)) + "\'\n")
                f.write("\t" + "report \"ADD error at ADD " + binI + " " + binK + "\" severity error;\n\n")
f.close()


#SUB
f = open("ALU_tb_SUB.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_SUB"))
    else:
        f.write("opcode_select_s <= \"000100\";")
        for i in range(0, 2 ** 8):
            for k in range(0, 2 ** 8):
                binI = numpy.binary_repr(i,8)
                binK = numpy.binary_repr(k,8)
                f.write("sA_s <= \"" + binI + "\";\n")
                f.write("sB_s <= \"" + binK + "\";\n")
                f.write("wait for waitTime;\n")
                binSum = numpy.binary_repr((i - k) % 256,8)
                f.write("assert sALU_s = \"" + binSum + "\" and sZERO_s = \'" + str(int(i - k == 0)) + "\' and sCarry_s=\'" + str(int((i - k) < 0)) + "\'\n")
                f.write("\t" + "report \"SUB error at SUB " + binI + " " + binK + "\" severity error;\n\n")
f.close()


#COMPARE
f = open("ALU_tb_COMPARE.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_COMPARE"))
    else:
        f.write("opcode_select_s <= \"011010\";")
        for i in range(0, 2 ** 8):
            for k in range(0, 2 ** 8):
                binI = numpy.binary_repr(i,8)
                binK = numpy.binary_repr(k,8)
                f.write("sA_s <= \"" + binI + "\";\n")
                f.write("sB_s <= \"" + binK + "\";\n")
                f.write("wait for waitTime;\n")
                f.write("assert sZERO_s = \'" + str(int(i == k)) + "\' and sCarry_s=\'" + str(int(i < k)) + "\';\n")
                f.write("\t" + "report \"COMPARE error at COMPARE " + binI + " " + binK + "\" severity error;\n\n")
f.close()

#TEST
f = open("ALU_tb_TEST.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_TEST"))
    else:
        f.write("opcode_select_s <= \"000100\";")
        for i in range(0, 2 ** 8):
            for k in range(0, 2 ** 8):
                binI = numpy.binary_repr(i,8)
                binK = numpy.binary_repr(k,8)
                f.write("sA_s <= \"" + binI + "\";\n")
                f.write("sB_s <= \"" + binK + "\";\n")
                f.write("wait for waitTime;\n")
                binAND = numpy.binary_repr(i & k)
                n = 0
                for c in binAND:
                    if c == "1":
                        n+=1
                f.write("assert sZERO_s = \'" + str(int((i & k)==0)) + "\' and sCarry_s=\'" + str((n % 2)) + "\';\n")
                f.write("\t" + "report \"TEST error at TEST " + binI + " " + binK + "\" severity error;\n\n")
f.close()


#AND
f = open("ALU_tb_AND.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_AND"))
    else:
        f.write("opcode_select_s <= \"001000\";")
        for i in range(0, 2 ** 8):
            for k in range(0, 2 ** 8):
                binI = numpy.binary_repr(i,8)
                binK = numpy.binary_repr(k,8)
                binAND = numpy.binary_repr(i & k)
                f.write("sA_s <= \"" + binI + "\";\n")
                f.write("sB_s <= \"" + binK + "\";\n")
                f.write("wait for waitTime;\n")
                f.write("assert sALU_s = \"" + binAND + "\" and sZERO_s = \'" + str(int(i == 0)) + "\' and sCarry_s=\'0\'\n")
                f.write("\t" + "report \"AND error at AND " + binI + " " + binK + "\" severity error;\n\n")
f.close()


#OR
f = open("ALU_tb_OR.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_OR"))
    else:
        f.write("opcode_select_s <= \"001010\";")
        for i in range(0, 2 ** 8):
            for k in range(0, 2 ** 8):
                binI = numpy.binary_repr(i,8)
                binK = numpy.binary_repr(k,8)
                binOR = numpy.binary_repr(i | k)
                f.write("sA_s <= \"" + binI + "\";\n")
                f.write("sB_s <= \"" + binK + "\";\n")
                f.write("wait for waitTime;\n")
                f.write("assert sALU_s = \"" + binOR + "\" and sZERO_s = \'" + str(int(i == 0)) + "\' and sCarry_s=\'0\'\n")
                f.write("\t" + "report \"OR error at OR " + binI + " " + binK + "\" severity error;\n\n")
f.close()


#XOR
f = open("ALU_tb_XOR.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_XOR"))
    else:
        f.write("opcode_select_s <= \"001010\";")
        for i in range(0, 2 ** 8):
            for k in range(0, 2 ** 8):
                binI = numpy.binary_repr(i,8)
                binK = numpy.binary_repr(k,8)
                binXOR = numpy.binary_repr(i ^ k)
                f.write("sA_s <= \"" + binI + "\";\n")
                f.write("sB_s <= \"" + binK + "\";\n")
                f.write("wait for waitTime;\n")
                f.write("assert sALU_s = \"" + binXOR + "\" and sZERO_s = \'" + str(int(i == 0)) + "\' and sCarry_s=\'0\'\n")
                f.write("\t" + "report \"XOR error at XOR " + binI + " " + binK + "\" severity error;\n\n")
f.close()


#LOAD i guess
f = open("ALU_tb_LOAD.vhd", "w")
template = open("template.vhd", "r")
lines = template.readlines()
for line in lines:
    if line != "--insert_code_here\n":
        f.write(line.replace("sim_ALU_tb","sim_ALU_tb_LOAD"))
    else:
        f.write("opcode_select_s <= \"001110\";")
        for i in range(0, 2 ** 8):
            bin = numpy.binary_repr(i,8)
            f.write("sA_s <= \"" + binI + "\";\n")
            f.write("wait for waitTime;\n")
            f.write("assert sALU_s = \"" + binI + "\"\n")
            f.write("\t" + "report \"LOAD error at LOAD " + binI + "\" severity error;\n\n")
f.close()