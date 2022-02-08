import numpy
maxBit12_allOne = 2 ** 12

#generall filegenerating struckture
def generateTest(uut, testNr, function):
    f = open("" + uut +"_tb_long" + str(testNr) + ".vhd", "w")
    start_template = open("template_begining_" + uut +".vhd", "r")
    template = open("template.vhd", "r")
    end_template = open("template_end.vhd", "r")
    linemidle = template.readlines()
    linesstart = start_template.readlines()
    linesend = end_template.readlines()
    for line in linemidle:
        if line == "--insert_start_here\n":
            for lines in linesstart:
                f.write(lines.replace("sim_" + uut + "_tb","sim_" + uut + "_" + str(testNr) + "_tb"))
        elif line == "--insert_end_here\n":
            for linee in linesend:
                	f.write(linee)
        elif line == "--insert_code_here\n":
            function(f)
        else:
            f.write("")
    f.close
    print("generall filegeneration: " + uut + " with: " + str(testNr))
    

def generateTestIP(uut, testNr, function, fileData):
    f = open("" + uut +"_tb_long" + str(testNr) + ".vhd", "w")
    start_template = open("template_begining_" + uut +".vhd", "r")
    template = open("template.vhd", "r")
    end_template = open("template_end.vhd", "r")
    linemidle = template.readlines()
    linesstart = start_template.readlines()
    linesend = end_template.readlines()
    for line in linemidle:
        if line == "--insert_start_here\n":
            for lines in linesstart:
                f.write(lines.replace("sim_" + uut + "_tb","sim_" + uut + "_" + str(testNr) + "_tb").replace("Fibonacci",fileData))
        elif line == "--insert_end_here\n":
            for linee in linesend:
                	f.write(linee)
        elif line == "--insert_code_here\n":
            function(f)
        else:
            f.write("")
    f.close
    print("generall filegeneration: " + uut + " with: " + str(testNr))
    
    
#PC Test Benches
#standart Durchlauf
def insertTBCode11(f):
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


#enable_s=0 Verzögerungsdurchlauf
def insertTBCode12(f):
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


#reset Durchlauf
def insertTBCode13(f):
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


#ADD Test Benches
#standart Durchlauf
def insertTBCode21(f):
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


#IP Test Benches
#short File
def insertTBCode31(f):
    f.write("report \"The Test has started \";\n\n")
    for i in range(0, 2**6):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        bin = numpy.base_repr(i, base=2).zfill(18)
        f.write("assert instruction_s = \"" + bin + "\" \n")
        f.write("\t" + "report \"IP error before File at " + bin + "\" severity error;\n\n")
    for i in range(2**6, 2**12):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        bin = numpy.base_repr(2**12, base=2).zfill(18)
        f.write("assert instruction_s = \"" + bin + "\" \n")
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("\t" + "report \"IP error after File at " + bin + "\" severity error;\n\n")
    f.write("report \"The Test is finished \";\n\n")
    

#standart Durchlauf
def insertTBCode32(f):
    f.write("report \"The Test has started \";\n\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        bin = numpy.base_repr(i, base=2).zfill(18)
        f.write("assert instruction_s = \"" + bin + "\" \n")
        f.write("\t" + "report \"IP error before File at " + bin + "\" severity error;\n\n")
    f.write("report \"The Test is finished \";\n\n")
    
    
#long Durchlauf
def insertTBCode33(f):
    f.write("report \"The Test has started \";\n\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        bin = numpy.base_repr(i, base=2).zfill(18)
        f.write("assert instruction_s = \"" + bin + "\" \n")
        f.write("\t" + "report \"IP error before File at " + bin + "\" severity error;\n\n")
    for i in range(maxBit12_allOne, 2**13):
        bin = numpy.base_repr(i, base=2).zfill(13)[1:13]
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        bin = numpy.base_repr(i, base=2).zfill(13)[1:13].zfill(18)
        f.write("assert instruction_s = \"" + bin + "\" \n")
        f.write("\t" + "report \"IP error after 4096 at " + bin + "\" severity error;\n\n")
        bin = numpy.base_repr(i, base=2).zfill(18)
        f.write("assert not(instruction_s = \"" + bin + "\") \n")
        f.write("\t" + "report \"IP error after 4096 at " + bin + "\" severity error;\n\n")
    f.write("report \"The Test is finished \";\n\n")
    
    
    
#undefined Durchlauf
#TODO
def insertTBCode34(f):
    f.write("report \"The Test has started \";\n\n")
    for i in range(0, 5):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        bin = numpy.base_repr(i, base=2).zfill(18)
        f.write("assert instruction_s = \"" + bin + "\" \n")
        f.write("\t" + "report \"IP error before first UUU at " + bin + "\" severity error;\n\n")
    bin = numpy.base_repr(5, base=2).zfill(12)
    f.write("pc_s <= \"" + bin + "\";\n")
    f.write("wait until rising_edge(clk_s);\n")
    f.write("wait for waitTime;\n")
    f.write("assert instruction_s = \"UUUUUUUUUUUUUUUUUU\" \n")
    f.write("\t" + "report \"IP error at UUU at Undefined " + bin + "\" severity error;\n\n")
    for i in range(6, 11):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        bin = numpy.base_repr(i, base=2).zfill(18)
        f.write("assert instruction_s = \"" + bin + "\" \n")
        f.write("\t" + "report \"IP error after UUU at " + bin + "\" severity error;\n\n")
    bin = numpy.base_repr(11, base=2).zfill(12)
    f.write("pc_s <= \"" + bin + "\";\n")
    f.write("wait until rising_edge(clk_s);\n")
    f.write("wait for waitTime;\n")
    f.write("assert instruction_s = \"UUUUUUUUUUUUUUUUUU\" \n")
    f.write("\t" + "report \"IP error second UUU at Undefined " + bin + "\" severity error;\n\n")
    for i in range(12, 17):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        bin = numpy.base_repr(i, base=2).zfill(18)
        f.write("assert instruction_s = \"" + bin + "\" \n")
        f.write("\t" + "report \"IP error after second UUU at " + bin + "\" severity error;\n\n")
    f.write("report \"The Test is finished \";\n\n")
    

#standart Durchlauf
def insertTBCode35(f):
    f.write("report \"The Test has started \";\n\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        bin = numpy.base_repr(i, base=2).zfill(18)
        f.write("assert instruction_s = \"" + bin + "\" \n")
        f.write("\t" + "report \"IP error before File at " + bin + "\" severity error;\n\n")
    f.write("report \"The Test is finished \";\n\n")
    
    
#Stack Test Benches
#empty Test begin 
def insertTBCode41(f):
    f.write("report \"The Test has started. \";\n\n")
    f.write("write_or_read_s <= \'1\';\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait for waitTime;\n")
        #f.write("assert sStack_s = \"" + bin + "\"\n")
        #Undefined sollte in ordnung sein.
        f.write("assert sStack_s = \"UUUUUUUUUUUU\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'1\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
        f.write("wait for waitTime;\n")
    f.write("report \"The Test is finished. \";\n\n")
    f.write("report \"Under the asumption that UUU is fine. \";\n\n")
    f.write("wait for 10ns;\n")
    


#empty Test laufzeit 
def insertTBCode42(f):
    f.write("report \"The Test has started \";\n\n")
    #vorherige Benutzung simulieren Start
    f.write("write_or_read_s <= \'0\';\n")
    f.write("pc_s <= \"001111001111\";\n")
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
        f.write("assert sStack_s = \"001111001111\" \n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'1\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
        f.write("wait for waitTime;\n")
    f.write("report \"The Test is finished \";\n\n")
    f.write("wait for 10ns;\n")
    


#full Test begin
def insertTBCode43(f):
    f.write("report \"The Test has started \";\n\n")
    f.write("write_or_read_s <= \'0\';\n")
    f.write("wait for waitTime;\n")
    for i in range(0, 2 ** 7):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        #f.write("assert sStack_s = \"" + bin + "\"\n")
        #Undefined sollte in ordnung sein.
        f.write("assert sStack_s = \"UUUUUUUUUUUU\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'1\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'0\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("write_or_read_s <= \'1\';\n")
    bin = numpy.base_repr(2**7-2, base=2).zfill(12)
    f.write("pc_s <= \"001111001111\";\n")
    f.write("wait until rising_edge(clk_s);\n")
    f.write("wait for waitTime;\n")
    f.write("assert sStack_s = \"" + bin + "\"\n")
    f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
    f.write("assert full_s = \'0\' \n")
    f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
    f.write("assert empty_s = \'0\' \n")
    f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("report \"The Test is finished \";\n\n")
    f.write("report \"Under the asumption that UUU is fine. \";\n\n")
    


#full Test laufzeit
def insertTBCode44(f):
    f.write("report \"The Test has started \";\n\n")
    #vorherige Benutzung simulieren Start
    f.write("reset_s <= \'1\';\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    f.write("reset_s <= \'0\';\n")
    f.write("write_or_read_s <= \'0\';\n")
    f.write("pc_s <= \"001111001111\";\n")
    f.write("wait until rising_edge(clk_s);\n")
    f.write("wait for waitTime;\n")
    f.write("write_or_read_s <= \'1\';\n")
    f.write("wait until rising_edge(clk_s);\n")
    f.write("wait for waitTime;\n")
    #vorherige Benutzung simulieren Ende
    f.write("write_or_read_s <= \'0\';\n")
    f.write("wait for waitTime;\n")
    for i in range(0, 2 ** 7):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        #f.write("assert sStack_s = \"" + bin + "\"\n")
        #Undefined sollte in ordnung sein.
        f.write("assert sStack_s = \"001111001111\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'1\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'0\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("write_or_read_s <= \'1\';\n")
    bin = numpy.base_repr(2**7-1, base=2).zfill(12)
    f.write("pc_s <= \"001111001111\";\n")
    f.write("wait until rising_edge(clk_s);\n")
    f.write("wait for waitTime;\n")
    f.write("assert sStack_s = \"" + bin + "\"\n")
    f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
    f.write("assert full_s = \'0\' \n")
    f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
    f.write("assert empty_s = \'0\' \n")
    f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("report \"The Test is finished \";\n\n")
    


#LiFo Test
def insertTBCode45(f):
    f.write("report \"The Test has started \";\n\n")
    f.write("write_or_read_s <= \'0\';\n")
    f.write("wait for waitTime;\n")
    for i in range(0, 2 ** 7-1):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait for waitTime;\n")
        f.write("wait for waitTime;\n")
    f.write("write_or_read_s <= \'1\';\n")
    f.write("pc_s <= \"001111001111\";\n")
    f.write("wait for waitTime;\n")
    for i in range(0, 2 ** 7-1):
        bin = numpy.base_repr((2 ** 7-2) - i, base=2).zfill(12)
        f.write("wait for waitTime;\n")
        f.write("assert sStack_s = \"" + bin + "\" \n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'0\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
        f.write("wait for waitTime;\n")
    f.write("report \"The Test is finished \";\n\n")
    f.write("wait for 10ns;\n")


#standart Durchlauf
def insertTBCode46(f):
    f.write("report \"The Test has started \";\n\n")
    #vorherige Benutzung simulieren Start
    f.write("reset_s <= \'1\';\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    f.write("reset_s <= \'0\';\n")
    f.write("write_or_read_s <= \'0\';\n")
    f.write("pc_s <= \"001111001111\";\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    f.write("write_or_read_s <= \'1\';\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    f.write("write_or_read_s <= \'0\';\n")
    f.write("pc_s <= \"001111001111\";\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    #vorherige Benutzung simulieren Ende
    f.write("write_or_read_s <= \'0\';\n")
    for i in range(0, maxBit12_allOne):
        f.write("write_or_read_s <= \'0\';\n")
        for j in range(0, 2):
            bin = numpy.base_repr(j, base=2).zfill(12)
            f.write("pc_s <= \"" + bin + "\";\n")
            f.write("wait until rising_edge(clk_s);\n")
            f.write("wait for waitTime;\n")
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        for j in range(0, 2):
            bin = numpy.base_repr(j, base=2).zfill(12)
            f.write("pc_s <= \"" + bin + "\";\n")
            f.write("wait until rising_edge(clk_s);\n")
            f.write("wait for waitTime;\n")
        f.write("write_or_read_s <= \'1\';\n")
        for j in range(0, 2):
            bin = numpy.base_repr(1-j, base=2).zfill(12)
            f.write("pc_s <= \"001111001111\";\n")
            f.write("wait until rising_edge(clk_s);\n")
            f.write("wait for waitTime;\n")
            f.write("assert sStack_s = \"" + bin + "\" \n")
            f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
            f.write("assert full_s = \'0\' \n")
            f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
            f.write("assert empty_s = \'0\' \n")
            f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"001111001111\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        f.write("assert sStack_s = \"" + bin + "\" \n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'0\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
        for j in range(0, 2):
            bin = numpy.base_repr(1-j, base=2).zfill(12)
            f.write("pc_s <= \"001111001111\";\n")
            f.write("wait until rising_edge(clk_s);\n")
            f.write("wait for waitTime;\n")
            f.write("assert sStack_s = \"" + bin + "\" \n")
            f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
            f.write("assert full_s = \'0\' \n")
            f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
            f.write("assert empty_s = \'0\' \n")
            f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("report \"The Test is finished \";\n\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    

#enable = 0 Test begin 
def insertTBCode47(f):
    f.write("report \"The Test has started. \";\n\n")
    f.write("enable_s <= \'0\';\n")
    f.write("write_or_read_s <= \'1\';\n")
    f.write("wait for waitTime;\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        f.write("assert sStack_s = \"UUUUUUUUUUUU\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'1\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("write_or_read_s <= \'0\';\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        f.write("assert sStack_s = \"UUUUUUUUUUUU\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'1\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("write_or_read_s <= \'1\';\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        f.write("assert sStack_s = \"UUUUUUUUUUUU\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'1\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("reset_s <= \'1\';\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    f.write("reset_s <= \'0\';\n")
    f.write("write_or_read_s <= \'0\';\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        f.write("assert sStack_s = \"111111111111\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'1\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("write_or_read_s <= \'1\';\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        f.write("assert sStack_s = \"111111111111\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'1\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("report \"The Test is finished. \";\n\n")
    f.write("wait for 10ns;\n")
    

#enable = 0 Test laufzeit 
def insertTBCode48(f):
    f.write("report \"The Test has started \";\n\n")
    #vorherige Benutzung simulieren Start
    f.write("write_or_read_s <= \'0\';\n")
    f.write("pc_s <= \"001111001111\";\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    f.write("write_or_read_s <= \'1\';\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    #vorherige Benutzung simulieren Ende
    f.write("enable_s <= \'0\';\n")
    f.write("write_or_read_s <= \'1\';\n")
    f.write("wait for waitTime;\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        f.write("assert sStack_s = \"001111001111\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'1\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("write_or_read_s <= \'0\';\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        f.write("assert sStack_s = \"001111001111\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'1\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("write_or_read_s <= \'1\';\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        f.write("assert sStack_s = \"001111001111\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'1\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("reset_s <= \'1\';\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    f.write("reset_s <= \'0\';\n")
    f.write("write_or_read_s <= \'0\';\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        f.write("assert sStack_s = \"111111111111\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'1\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("write_or_read_s <= \'1\';\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
        f.write("assert sStack_s = \"111111111111\"\n")
        f.write("\t" + "report \"Stack error at " + bin + "\" severity error;\n\n")
        f.write("assert full_s = \'0\' \n")
        f.write("\t" + "report \"StackFull error at " + bin + "\" severity error;\n\n")
        f.write("assert empty_s = \'1\' \n")
        f.write("\t" + "report \"StackEmpty error at " + bin + "\" severity error;\n\n")
    f.write("report \"The Test is finished. \";\n\n")
    f.write("wait for 10ns;\n")
    
    
#reset Durchlauf
def insertTBCode49(f):
    f.write("report \"The Test has started. \";\n\n")
    f.write("write_or_read_s <= \'1\';\n")
    f.write("reset_s <= \'1\';\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    f.write("reset_s <= \'0\';\n")
    f.write("wait for waitTime;\n")
    f.write("assert sStack_s = \"111111111111\"\n")
    f.write("\t" + "report \"Stack error at first\" severity error;\n\n")
    f.write("assert full_s = \'0\' \n")
    f.write("\t" + "report \"StackFull error at first\" severity error;\n\n")
    f.write("assert empty_s = \'1\' \n")
    f.write("\t" + "report \"StackEmpty error at first\" severity error;\n\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
    f.write("assert sStack_s = \"111111111111\"\n")
    f.write("\t" + "report \"Stack error at second\" severity error;\n\n")
    f.write("assert full_s = \'0\' \n")
    f.write("\t" + "report \"StackFull error at second\" severity error;\n\n")
    f.write("assert empty_s = \'1\' \n")
    f.write("\t" + "report \"StackEmpty error at second\" severity error;\n\n")
    f.write("write_or_read_s <= \'0\';\n")
    f.write("reset_s <= \'1\';\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    f.write("reset_s <= \'0\';\n")
    f.write("assert sStack_s = \"111111111111\"\n")
    f.write("\t" + "report \"Stack error at third\" severity error;\n\n")
    f.write("assert full_s = \'0\' \n")
    f.write("\t" + "report \"StackFull error at thired\" severity error;\n\n")
    f.write("assert empty_s = \'1\' \n")
    f.write("\t" + "report \"StackEmpty error at thired\" severity error;\n\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
    f.write("assert sStack_s = \"111111111111\"\n")
    f.write("\t" + "report \"Stack error at forth\" severity error;\n\n")
    f.write("assert full_s = \'1\' \n")
    f.write("\t" + "report \"StackFull error at forth\" severity error;\n\n")
    f.write("assert empty_s = \'0\' \n")
    f.write("\t" + "report \"StackEmpty error at forth\" severity error;\n\n")
    f.write("write_or_read_s <= \'1\';\n")
    f.write("reset_s <= \'1\';\n")
    f.write("wait for waitTime;\n")
    f.write("wait for waitTime;\n")
    f.write("reset_s <= \'0\';\n")
    f.write("assert sStack_s = \"111111111111\"\n")
    f.write("\t" + "report \"Stack error at fith\" severity error;\n\n")
    f.write("assert full_s = \'0\' \n")
    f.write("\t" + "report \"StackFull error at fith\" severity error;\n\n")
    f.write("assert empty_s = \'1\' \n")
    f.write("\t" + "report \"StackEmpty error at fith\" severity error;\n\n")
    for i in range(0, maxBit12_allOne):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait until rising_edge(clk_s);\n")
        f.write("wait for waitTime;\n")
    f.write("assert sStack_s = \"111111111111\"\n")
    f.write("\t" + "report \"Stack error at sixed\" severity error;\n\n")
    f.write("assert full_s = \'0\' \n")
    f.write("\t" + "report \"StackFull error at sixed\" severity error;\n\n")
    f.write("assert empty_s = \'1\' \n")
    f.write("\t" + "report \"StackEmpty error at sixed\" severity error;\n\n")
    f.write("report \"The Test is finished. \";\n\n")
    f.write("wait for 10ns;\n")
    
    
#Unstable write_or_read_s
def insertTBCode51(f):
    f.write("report \"The Test has started \";\n\n")
    f.write("report \"Variant of Stack_tb_long5 with unstable write_or_read_s. \";\n\n")
    f.write("wait for waitTime;\n")
    for i in range(0, 2 ** 7-1):
        bin = numpy.base_repr(i, base=2).zfill(12)
        f.write("pc_s <= \"" + bin + "\";\n")
        f.write("wait for waitTime;\n")
        f.write("wait for waitTime;\n")
    f.write("pc_s <= \"001111001111\";\n")
    f.write("wait for waitTime;\n")
    for i in range(0, 2 ** 7-1):
        bin = numpy.base_repr((2 ** 7-2) - i, base=2).zfill(12)
        f.write("wait for waitTime;\n")
        f.write("wait for waitTime;\n")
    f.write("report \"You can see that this unstable write_or_read_s leads to inconsistency of the Stack \";\n\n")
    f.write("report \"The Test is finished \";\n\n")

#generate TBfiles
generateTest("PC", 1, insertTBCode11)
generateTest("PC", 2, insertTBCode12)
generateTest("PC", 3, insertTBCode13)
generateTest("ADD", 1, insertTBCode21)
generateTestIP("IP", 1, insertTBCode31,"ShorterTBFile")
generateTestIP("IP", 2, insertTBCode32,"NormalTBFile")
generateTestIP("IP", 3, insertTBCode33,"LongerTBFile")
generateTestIP("IP", 4, insertTBCode34,"UndefinedTBFile")
generateTestIP("IP", 5, insertTBCode35,"Numbers0to4096")
generateTest("Stack", 1, insertTBCode41)
generateTest("Stack", 2, insertTBCode42)
generateTest("Stack", 3, insertTBCode43)
generateTest("Stack", 4, insertTBCode44)
generateTest("Stack", 5, insertTBCode45)
generateTest("Stack", 6, insertTBCode46)
generateTest("Stack", 7, insertTBCode47)
generateTest("Stack", 8, insertTBCode48)
generateTest("Stack", 9, insertTBCode49)
generateTest("StackU", 1, insertTBCode51)
