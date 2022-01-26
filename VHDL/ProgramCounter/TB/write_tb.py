import numpy

f = open("PC_tb_long.vhd", "w")
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
        for i in range(1, 2 ** 12):
            bin = numpy.binary_repr(i,12)
            f.write("pc_in_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            f.write("assert pc_out_s = \"" + bin + "\" \n")
            f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        #normal case
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
        f.write("enable_s <= \'0\';\n")
        #stop case
        for i in range(1, 2 ** 12):
            bin = numpy.binary_repr(i,12)
            f.write("pc_in_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            f.write("assert not(pc_out_s = \"" + bin + "\") \n")
            f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        #stop case
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
        f.write("enable_s <= \'0\';\n")
        #reset case
        for i in range(1, 2 ** 12):
            bin = numpy.binary_repr(i,12)
            f.write("pc_in_s <= \"" + bin + "\";\n")
            f.write("wait for waitTime;\n")
            f.write("assert not(pc_out_s = \"" + bin + "\") \n")
            f.write("\t" + "report \"PC error at " + bin + "\" severity error;\n\n")
            f.write("wait for waitTime;\n")
        #stop case
    else:
        f.write("")
f.close
