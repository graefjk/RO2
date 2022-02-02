import numpy
maxBit12_allOne = 2 ** 12

#PC Test Benches
#standart Durchlauf
f = open("PC_tb_long1.vhd", "w")
start_template = open("template_begining_pc.vhd", "r")
template = open("template.vhd", "r")
end_template = open("template_end.vhd", "r")
lines = template.readlines()
linesstart = start_template.readlines()
linesend = end_template.readlines()
for line in lines:
    if line == "--insert_start_here\n":
        for lines in linesstart:
            f.write(lines)
    elif line == "--insert_end_here\n":
        for linee in linesend:
            	f.write(linee)
    elif line == "--insert_code_here\n":
        f.write("report \"The Test has started \";\n\n")
        for i in range(0, maxBit12_allOne):
            bin = numpy.base_repr(i, base=2).zfill(12)
            f.write("pc_in_s <= \"" + bin + "\";\n")
            f.write("wait until rising_edge(clk_s);\n")
            f.write("wait for waitTime;\n")
            f.write("assert pc_out_s = \"" + bin + "\" \n")
            f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        f.write("report \"The Test is finished \";\n\n")
        f.write("wait for 10ns;\n")
    else:
        f.write("")
f.close

#enable_s=0 Verzögerungsdurchlauf
f = open("PC_tb_long2.vhd", "w")
start_template = open("template_begining_pc.vhd", "r")
template = open("template.vhd", "r")
end_template = open("template_end.vhd", "r")
lines = template.readlines()
linesstart = start_template.readlines()
linesend = end_template.readlines()
for line in lines:
    if line == "--insert_start_here\n":
        for lines in linesstart:
            f.write(lines)
    elif line == "--insert_end_here\n":
        for linee in linesend:
            	f.write(linee)
    elif line == "--insert_code_here\n":
        f.write("report \"The Test has started \";\n\n")
        for i in range(0, maxBit12_allOne):
            bin = numpy.base_repr(i, base=2).zfill(12)
            f.write("pc_in_s <= \"" + bin + "\";\n")
            f.write("enable_s <= \'0\';\n")
            f.write("wait until rising_edge(clk_s);\n")
            f.write("wait for waitTime;\n")
            f.write("assert not(pc_out_s = \"" + bin + "\") \n")
            f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
            f.write("enable_s <= \'1\';\n")
            f.write("wait until rising_edge(clk_s);\n")
            f.write("wait for waitTime;\n")
            f.write("assert pc_out_s = \"" + bin + "\" \n")
            f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        f.write("report \"The Test is finished \";\n\n")
        f.write("wait for 10ns;\n")
    else:
        f.write("")
f.close

#reset Durchlauf
f = open("PC_tb_long3.vhd", "w")
start_template = open("template_begining_pc.vhd", "r")
template = open("template.vhd", "r")
end_template = open("template_end.vhd", "r")
lines = template.readlines()
linesstart = start_template.readlines()
linesend = end_template.readlines()
for line in lines:
    if line == "--insert_start_here\n":
        for lines in linesstart:
            f.write(lines)
    elif line == "--insert_end_here\n":
        for linee in linesend:
            	f.write(linee)
    elif line == "--insert_code_here\n":
        f.write("report \"The Test has started \";\n\n")
        for i in range(0, maxBit12_allOne):
            bin = numpy.base_repr(i, base=2).zfill(12)
            f.write("pc_in_s <= \"" + bin + "\";\n")
            f.write("reset_s <= \'1\';\n")
            f.write("wait until rising_edge(clk_s);\n")
            f.write("wait for waitTime;\n")
            f.write("assert pc_out_s = \"111111111111\" \n")
            f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
            f.write("reset_s <= \'0\';\n")
            f.write("wait for waitTime;\n")
        f.write("report \"The Test is finished \";\n\n")
        f.write("wait for 10ns;\n")
    else:
        f.write("")
f.close

#ADD Test Benches
#standart Durchlauf
f = open("ADD_tb_long1.vhd", "w")
start_template = open("template_begining_add.vhd", "r")
template = open("template.vhd", "r")
end_template = open("template_end.vhd", "r")
lines = template.readlines()
linesstart = start_template.readlines()
linesend = end_template.readlines()
for line in lines:
    if line == "--insert_start_here\n":
        for lines in linesstart:
            f.write(lines)
    elif line == "--insert_end_here\n":
        for linee in linesend:
            	f.write(linee)
    elif line == "--insert_code_here\n":
        f.write("report \"The Test has started \";\n\n")
        for i in range(0, maxBit12_allOne-1):
            bin = numpy.base_repr(i, base=2).zfill(12)
            f.write("sA_s <= \"" + bin + "\";\n")
            f.write("wait for 1ns;\n")
            inext = i + 1
            bin = numpy.base_repr(inext, base=2).zfill(12)
            f.write("assert sB_s = \"" + bin + "\" \n")
            f.write("\t" + "report \"ADD error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        #overflow case
        bin = numpy.base_repr(maxBit12_allOne-1, base=2).zfill(12)
        f.write("sA_s <= \"" + bin + "\";\n")
        f.write("wait for 1ns;\n")
        inext = 0
        bin = numpy.base_repr(inext, base=2).zfill(12)
        f.write("assert sB_s = \"" + bin + "\" \n")
        f.write("\t" + "report \"ADD error at " + bin + "\" severity error;\n\n")
        f.write("wait for waitTime;\n")
        #
        f.write("report \"The Test is finished \";\n\n")
        f.write("wait for 10ns;\n")
    else:
        f.write("")
f.close

#IP Test Benches

f = open("IP_tb_long1.vhd", "w")
start_template = open("template_begining_ip.vhd", "r")
template = open("template.vhd", "r")
end_template = open("template_end.vhd", "r")
lines = template.readlines()
linesstart = start_template.readlines()
linesend = end_template.readlines()
for line in lines:
    if line == "--insert_start_here\n":
        for lines in linesstart:
            f.write(lines)
    elif line == "--insert_end_here\n":
        for linee in linesend:
            	f.write(linee)
    elif line == "--insert_code_here\n":
        f.write("report \"The Test has started \";\n\n")
        for i in range(0, maxBit12_allOne):
            bin = numpy.base_repr(i, base=2).zfill(12)
            f.write("pc_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            #f.write("assert sB_s = \"" + bin + "\" \n")
            #f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        f.write("report \"The Test is finished \";\n\n")
        f.write("wait for 10ns;\n")
    else:
        f.write("")
f.close

#Stack Test Benches
#empty Test begin 
f = open("Stack_tb_long1.vhd", "w")
start_template = open("template_begining_stack.vhd", "r")
template = open("template.vhd", "r")
end_template = open("template_end.vhd", "r")
lines = template.readlines()
linesstart = start_template.readlines()
linesend = end_template.readlines()
for line in lines:
    if line == "--insert_start_here\n":
        for lines in linesstart:
            f.write(lines)
    elif line == "--insert_end_here\n":
        for linee in linesend:
            	f.write(linee)
    elif line == "--insert_code_here\n":
        f.write("report \"The Test has started \";\n\n")
        f.write("write_or_read_s <= \'1\';\n")
        for i in range(0, maxBit12_allOne):
            bin = numpy.base_repr(i, base=2).zfill(12)
            f.write("pc_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            f.write("assert sStack_s = \"" + bin + "\" \n")
            f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
            f.write("assert full_s = \'0\' \n")
            f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
            f.write("assert empty_s = \'1\' \n")
            f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        f.write("report \"The Test is finished \";\n\n")
        f.write("wait for 10ns;\n")
    else:
        f.write("")
f.close

#empty Test laufzeit 
f = open("Stack_tb_long2.vhd", "w")
start_template = open("template_begining_stack.vhd", "r")
template = open("template.vhd", "r")
end_template = open("template_end.vhd", "r")
lines = template.readlines()
linesstart = start_template.readlines()
linesend = end_template.readlines()
for line in lines:
    if line == "--insert_start_here\n":
        for lines in linesstart:
            f.write(lines)
    elif line == "--insert_end_here\n":
        for linee in linesend:
            	f.write(linee)
    elif line == "--insert_code_here\n":
        f.write("report \"The Test has started \";\n\n")
        #vorherige Benutzung simulieren Start
        f.write("write_or_read_s <= \'0\';\n")
        f.write("pc_s <= \"111111111111\";\n")
        f.write("wait for waitTime;\n")
        f.write("wait for waitTime;\n")
        f.write("write_or_read_s <= \'1\';\n")
        f.write("wait for waitTime;\n")
        f.write("wait for waitTime;\n")
        #vorherige Benutzung simulieren Ende
        f.write("write_or_read_s <= \'1\';\n")
        for i in range(0, maxBit12_allOne):
            bin = numpy.base_repr(i, base=2).zfill(12)
            f.write("pc_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            f.write("assert sStack_s = \"" + bin + "\" \n")
            f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
            f.write("assert full_s = \'0\' \n")
            f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
            f.write("assert empty_s = \'1\' \n")
            f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        f.write("report \"The Test is finished \";\n\n")
        f.write("wait for 10ns;\n")
    else:
        f.write("")
f.close

#full Test begin
f = open("Stack_tb_long3.vhd", "w")
start_template = open("template_begining_stack.vhd", "r")
template = open("template.vhd", "r")
end_template = open("template_end.vhd", "r")
lines = template.readlines()
linesstart = start_template.readlines()
linesend = end_template.readlines()
for line in lines:
    if line == "--insert_start_here\n":
        for lines in linesstart:
            f.write(lines)
    elif line == "--insert_end_here\n":
        for linee in linesend:
            	f.write(linee)
    elif line == "--insert_code_here\n":
        f.write("report \"The Test has started \";\n\n")
        f.write("write_or_read_s <= \'0\';\n")
        f.write("wait for waitTime;\n")
        for i in range(0, 2 ** 7):
            bin = numpy.base_repr(i, base=2).zfill(12)
            f.write("pc_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            f.write("wait for waitTime;\n")
        for i in range(0, maxBit12_allOne):
            bin = numpy.base_repr(i, base=2).zfill(12)
            f.write("pc_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            f.write("assert sStack_s = \"" + bin + "\" \n")
            f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
            f.write("assert full_s = \'1\' \n")
            f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
            f.write("assert empty_s = \'0\' \n")
            f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        f.write("report \"The Test is finished \";\n\n")
        f.write("wait for 10ns;\n")
    else:
        f.write("")
f.close
