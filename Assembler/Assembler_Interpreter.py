import tkinter as tk
from tkinter import filedialog

instructionDict = {
    # Block 1: Instructions on registers or constants kk/pp/ss (8 bits). Starting with 0, ending with ?.
    # The ? is replaced by a 1, if the instruction contains a constant, else it is replaced with 0.
    "ADD": "00000?", "ADDCY": "00001?", "SUB": "00010?", "SUBCY": "00011?",
    "AND": "00100?", "OR": "00101?", "XOR": "00110?", "LOAD": "00111?", "STORE": "01000?",
    "FETCH": "01001?", "OUTPUT": "01010?", "INPUT": "01011?", "TEST": "01100?", "COMPARE": "01101?",
    # Block 2: Jumps. Starting with 10.
    "CALL": "100001", "CALLC": "100010", "CALLNC": "100011", "CALLNZ": "100100", "CALLZ": "100101",
    "JUMP": "100110", "JUMPC": "100111", "JUMPNC": "101000", "JUMPNZ": "101001", "JUMPZ": "101010",
    "RETURN": "101011", "RETURNC": "101100", "RETURNNC": "101101", "RETURNZ": "101110", "RETURNNZ": "101111",
    # Block 3: Shifts. Starting with 11.
    "RL": "110000", "RR": "110001", "SL0": "110010", "SL1": "110011",
    "SLA": "110100", "SLX": "110101", "SR0": "110110", "SR1": "110111", "SRA": "111000", "SRX": "111001"}

registerDict = {
    "x0": "0000", "x1": "0001", "x2": "0010", "x3": "0011", "x4": "0100",
    "x5": "0101", "x6": "0110", "x7": "0111", "x8": "1000", "x9": "1001",
    "xA": "1010", "xB": "1011", "xC": "1100", "xD": "1101", "xE": "1110", "xF": "1111",
    "s0": "0000", "s1": "0001", "s2": "0010", "s3": "0011", "s4": "0100",
    "s5": "0101", "s6": "0110", "s7": "0111", "s8": "1000", "s9": "1001",
    "sA": "1010", "sB": "1011", "sC": "1100", "sD": "1101", "sE": "1110", "sF": "1111"}

label = {}


checkOneList = ("RETURN", "RETURNC", "RETURNNC", "RETURNZ", "RETURNNZ")

checkTwoList = ("CALL", "CALLC", "CALLNC", "CALLNZ", "CALLZ", "JUMP", "JUMPC", "JUMPNC", "JUMPNZ", "JUMPZ",
                "RL", "RR", "SL0", "SL1", "SLA", "SLX", "SR0", "SR1", "SRA", "SRX")

checkThreeList = ("ADD", "ADDCY", "SUB", "SUBCY", "AND", "OR", "XOR", "LOAD", "STORE",
                  "FETCH", "OUTPUT", "INPUT", "TEST", "COMPARE")

root = tk.Tk()
root.geometry("1000x600")
root.title("Assembler Interpreter")
root.state("zoomed")
root.configure(bg="black")
scrollbar = tk.Scrollbar(root)


def removeUnnecessary(instructions):
    """
    Removes unnecessary instructions from the instruction list.
    :param instructions: instruction list.
    """
    for instruction in instructions:
        i = instruction
        instruction = instruction.replace(" ", "")
        if instruction[0:2] == "//" or instruction == "":
            instructions.remove(i)
            removeUnnecessary(instructions)
    return instructions


def changeToBinary(n, bits):
    """
    Takes a number in dezimal, hexadezimal or binary and
    converts it to a binary number in 2's complement of a specified length.
    Hexadezimal numbers have to start with prefix "h" and can be signed and in 2's complement.
    Dezimal numbers have no prefix and can be signed.
    Binary numbers have to start with prefix "b" and have to be in 2's complement.
    :param n: the number in binary, hexa, dezimal.
    :param bits: length of the bit number.
    :return: an 8 bit or 12 bit number.
    """
    system = n[0]
    if system == "b":
        number = n[1:]
        while len(number) < bits:
            number = "0" + number
        return number
    elif system == "h":
        number = int(n[1:], 16)
        if (256 > number > -129 and bits == 8) or (4096 > number > -1 and bits == 12):
            b = bin(int(number) & int("1" * bits, 2))[2:]
            return ("{0:0>%s}" % bits).format(b)
        else:
            return "1111111111111"
    else:
        number = int(n[0:])
        if (256 > number > -129 and bits == 8) or (4096 > number > -1 and bits == 12):
            b = bin(int(number) & int("1" * bits, 2))[2:]
            return ("{0:0>%s}" % bits).format(b)
        else:
            return "1111111111111"


def generateMachinecode():
    """
    This function takes assembler code and converts it into machinecode.
    Each line in the assembler textfield should be empty or have one Instruction of the following structure:
    1. Operation register1, register2; //comment
    2. Operation register, constant; //comment
    3. Operation register; //comment
    4. Operation constant; //Comment
    5. Operation Label; //Comment
    6. Operation; //comment
    7. Label
    8. //Comment
    The comments starting wit a "//", the ",", the ";" aswell as "()" are optional.
    """
    text_field_machinecode.delete("1.0", "end")
    lines = text_field_assembler.get("1.0", "end").splitlines()
    current_line = 0
    label.clear()
    removeUnnecessary(lines)
    for line in lines:
        line = line.replace(",", "").replace(";", "").replace("(", "").replace(")", "").split("//")[0].split()
        current_line += 1
        if len(line) == 1 and not checkOneList.__contains__(line[0].upper()):
            try:
                label[line[0].upper()] = str(current_line - label.__len__() - 1)
            except KeyError:
                text_field_machinecode.insert("end", "Error in line {} {}, "
                                                     "not a valid label!".format(current_line, line) + "\n")
                text_field_machinecode.tag_add("error", "end-2c linestart", "end")
                text_field_assembler.mark_set("insert", str(current_line) + ".0 lineend")
                text_field_assembler.see(str(current_line) + ".0")
                return
    lines = text_field_assembler.get("1.0", "end").splitlines()
    instructions = []
    current_line = 0
    for line in lines:
        line = line.replace(",", "").replace(";", "").replace("(", "").replace(")", "").split("//")[0].split()
        current_line += 1
        if len(line) == 0:
            pass
        elif len(line) == 1 and checkOneList.__contains__(line[0].upper()):
            try:
                instructions.append(instructionDict[line[0].upper()] + "000000000000")
            except KeyError:
                text_field_machinecode.insert("end", "Error in line {} {}, "
                                                     "not a valid instruction!".format(current_line, line) + "\n")
                text_field_machinecode.tag_add("error", "end-2c linestart", "end")
                text_field_assembler.mark_set("insert", str(current_line) + ".0 lineend")
                text_field_assembler.see(str(current_line) + ".0")
                return
        elif len(line) == 1 and label.__contains__(line[0].upper()):
            pass
        elif len(line) == 2 and checkTwoList.__contains__(line[0].upper()):
            try:
                opcode = instructionDict[line[0].upper()]
                if registerDict.__contains__(line[1]):
                    value = registerDict[line[1]] + "00000000"
                else:
                    if label.__contains__(line[1].upper()):
                        value = changeToBinary(label.get(line[1].upper()), 12)
                    else:
                        value = changeToBinary(line[1], 12)
                    if len(value) > 12:
                        text_field_machinecode.insert(
                            "end", "Error in line {} {}, invalid number!"
                                   "Number range for 12 bit constant aaa-->(0, 4095)"
                                   .format(current_line, line) + "\n")
                        text_field_machinecode.tag_add("error", "end-2c linestart", "end")
                        text_field_assembler.mark_set("insert", str(current_line) + ".0 lineend")
                        text_field_assembler.see(str(current_line) + ".0")
                        return
                instructions.append(opcode + str(value))
            except (KeyError, ValueError):
                text_field_machinecode.insert("end", "Error in line {} {}, not a valid instruction "
                                                     "or number!".format(current_line, line) + "\n")
                text_field_machinecode.tag_add("error", "end-2c linestart", "end")
                text_field_assembler.mark_set("insert", str(current_line) + ".0 lineend")
                text_field_assembler.see(str(current_line) + ".0")
                return
        elif len(line) == 3 and checkThreeList.__contains__(line[0].upper()):
            try:
                if registerDict.__contains__(line[2]):
                    opcode = instructionDict[line[0].upper()].replace("?", "0")
                    value1 = registerDict[line[1]]
                    value2 = registerDict[line[2]] + "0000"
                else:
                    opcode = instructionDict[line[0].upper()].replace("?", "1")
                    value1 = registerDict[line[1]]
                    value2 = changeToBinary(line[2], 8)
                    if len(value2) > 8:
                        text_field_machinecode.insert(
                            "end", "Error in line {} {}, invalid number!"
                                   "Number range for 8 bit constants kk/pp/ss-->(-128, 127)"
                                   .format(current_line, line) + "\n")
                        text_field_machinecode.tag_add("error", "end-2c linestart", "end")
                        text_field_assembler.mark_set("insert", str(current_line) + ".0 lineend")
                        text_field_assembler.see(str(current_line) + ".0")
                        return
                instructions.append(opcode + str(value1) + str(value2))
            except (KeyError, ValueError):
                text_field_machinecode.insert("end", "Error in line {} {}, not a valid instruction, "
                                                     "register or number!".format(current_line, line) + "\n")
                text_field_machinecode.tag_add("error", "end-2c linestart", "end")
                text_field_assembler.mark_set("insert", str(current_line) + ".0 lineend")
                text_field_assembler.see(str(current_line) + ".0")
                return
        else:
            text_field_machinecode.insert("end", "Error in line {} {}, not a valid instruction!"
                                          .format(current_line, line) + "\n")
            text_field_machinecode.tag_add("error", "end-2c linestart", "end")
            text_field_assembler.mark_set("insert", str(current_line) + ".0 lineend")
            text_field_assembler.see(str(current_line) + ".0")
            return

    root.clipboard_clear()
    for instruction in instructions:
        text_field_machinecode.insert("end", instruction + "\n")
        root.clipboard_append(instruction + "\n")
        text_field_machinecode.tag_remove("error", "end-2c linestart", "end")
    text_field_machinecode.insert("end", "Successfully converted assembler to "
                                         "machinecode and copied it to clipboard!" + "\n")


def loadAssembler():
    """
    Opens a dialouge to select a file, to load assembler code.
    """
    f = open(filedialog.askopenfilename(), "r")
    text_field_assembler.delete("1.0", "end")
    text_field_assembler.insert("1.0", f.read())
    f.close()


def saveAssembler():
    """
    Opens a dialogue to select a file, to store assembler code.
    """
    with open(filedialog.asksaveasfilename(defaultextension=".txt"), "w") as f:
        f.write(text_field_assembler.get("1.0", "end"))
        f.close()


text_field_assembler = tk.Text(root, yscrollcommand=scrollbar.set, fg="darkblue",
                               bg="lightgrey", font=("Ariel", 20))
text_field_assembler.place(x=0, y=0, relwidth=0.45, relheight=1)

text_field_machinecode = tk.Text(root, yscrollcommand=scrollbar.set,
                                 bg="lightgrey", font=("Ariel", 14))
text_field_machinecode.place(relx=1, rely=0.11, x=0, y=0, relwidth=0.54, relheight=0.81, anchor="ne")
text_field_machinecode.tag_configure("error", foreground="red")

button_generateMachinecode = tk.Button(root, text="Create machinecode", font=("Ariel", 40),
                                       command=generateMachinecode)
button_generateMachinecode.place(relx=1, rely=0, x=0, y=0, relwidth=0.54, relheight=0.1, anchor="ne")

button_loadAssembler = tk.Button(root, text="Load assembler", font=("Ariel", 20),
                                 command=loadAssembler)
button_loadAssembler.place(relx=0.46, rely=0.98, x=0, y=0, relwidth=0.26, relheight=0.05, anchor="sw")

button_saveAssembler = tk.Button(root, text="Save assembler", font=("Ariel", 20),
                                 command=saveAssembler)
button_saveAssembler.place(relx=0.74, rely=0.98, x=0, y=0, relwidth=0.26, relheight=0.05, anchor="sw")

scrollbar.config(command=text_field_assembler.yview)

root.mainloop()
