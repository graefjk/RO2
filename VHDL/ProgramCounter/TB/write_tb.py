import numpy

#PC Test Benches

f = open("PC_tb_long1.vhd", "w")
start_template = open("template_begining.vhd", "r")
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
        #normal case
        for i in range(0, 2 ** 12):
            bin = numpy.binary_repr(i,12)
            f.write("pc_in_s <= \"" + bin + "\";\n")
            f.write("wait until rising_edge(clk_s);\n")
            f.write("wait for waitTime;\n")
            f.write("assert pc_out_s = \"" + bin + "\" \n")
            f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        #normal case
        f.write("reset_s <= \'1\';\n")
        f.write("wait for 100ns;\n")
    else:
        f.write("")
f.close

f = open("PC_tb_long2.vhd", "w")
start_template = open("template_begining.vhd", "r")
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
        #stop case
        for i in range(0, 2 ** 12):
            bin = numpy.binary_repr(i,12)
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
        #stop case
        f.write("reset_s <= \'1\';\n")
        f.write("wait for 100ns;\n")
    else:
        f.write("")
f.close

f = open("PC_tb_long3.vhd", "w")
start_template = open("template_begining.vhd", "r")
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
        #reset case
        for i in range(0, 2 ** 12):
            bin = numpy.binary_repr(i,12)
            f.write("pc_in_s <= \"" + bin + "\";\n")
            f.write("reset_s <= \'1\';\n")
            f.write("wait until rising_edge(clk_s);\n")
            f.write("wait for waitTime;\n")
            f.write("assert pc_out_s = \"111111111111\" \n")
            f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
            f.write("reset_s <= \'0\';\n")
            f.write("wait for waitTime;\n")
        #stop case
        f.write("reset_s <= \'0\';\n")
        f.write("wait for 100ns;\n")
    else:
        f.write("")
f.close

#ADD Test Benches

f = open("ADD_tb_long1.vhd", "w")
start_template = open("template_begining2.vhd", "r")
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
        #reset case
        for i in range(0, 2 ** 12):
            bin = numpy.binary_repr(i,12)
            f.write("sA_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            inext = i + 1
            bin = numpy.binary_repr(inext,12)
            f.write("assert sB_s = \"" + bin + "\" \n")
            f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        #stop case
        f.write("wait for 100ns;\n")
    else:
        f.write("")
f.close

#IP Test Benches

f = open("IP_tb_long1.vhd", "w")
start_template = open("template_begining3.vhd", "r")
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
        #reset case
        for i in range(0, 2 ** 12):
            bin = numpy.binary_repr(i,12)
            f.write("pc_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            #f.write("assert sB_s = \"" + bin + "\" \n")
            #f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        #stop case
        f.write("wait for 100ns;\n")
    else:
        f.write("")
f.close

#Stack Test Benches

f = open("Stack_tb_long1.vhd", "w")
start_template = open("template_begining4.vhd", "r")
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
        #reset case
        for i in range(0, 2 ** 12):
            bin = numpy.binary_repr(i,12)
            #f.write("pc_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            #f.write("assert sB_s = \"" + bin + "\" \n")
            #f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        #stop case
        f.write("wait for 100ns;\n")
    else:
        f.write("")
f.close
