import tkinter as tk
from tkinter import filedialog

instructionDict = {
    # Block 1: Instructions on registers or constants kk/pp/ss (8 bits). Starting with 0, ending with ?.
    # The ? is replaced by a 1, if the instruction contains a constant, else it is replaced with 00 or 01.
    "ADD": "00000?", "ADDCY": "00001?", "SUB": "00010?", "SUBCY": "00011?",
    "AND": "00100?", "OR": "00101?", "XOR": "00110?", "LOAD": "00111?", "STORE": "01000?",
    "FETCH": "01001?", "OUTPUT": "01010?", "INPUT": "01011?", "TEST": "01100?", "COMPARE": "01101?",
    # Block 2: Instructions on 12 bits constants aaa. Starting with 10.
    "CALL": "100001", "CALLC": "100010", "CALLNC": "100011", "CALLNZ": "100100", "CALLZ": "100101",
    "JUMP": "100110", "JUMPC": "100111", "JUMPNC": "101000", "JUMPNZ": "101001", "JUMPZ": "101010",
    # Block 3: Instructions on only one register and return instructions. Starting with 11.
    "RETURN": "111010", "RETURNC": "111011", "RETURNNC": "111100", "RETURNZ": "111101", "RETURNNZ": "111110",
    "RL": "110000", "RR": "110001", "SL0": "110010", "SL1": "110011",
    "SLA": "110100", "SLX": "110101", "SR0": "110110", "SR1": "110111", "SRA": "111000", "SRX": "111001"}

registerDict = {
    "x0": "0000", "x1": "0001", "x2": "0010", "x3": "0011", "x4": "0100",
    "x5": "0101", "x6": "0110", "x7": "0111", "x8": "1000", "x9": "1001",
    "xA": "1010", "xB": "1011", "xC": "1100", "xD": "1101", "xE": "1110", "xF": "1111"}

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


def changeToBinary(n, bits):
    system = n[0]
    if system == "b":
        number = n[1:]
        while len(number) < bits:
            number = "0" + number
        return number
    elif system == "h":
        number = int(n[1:], 16)
        if (128 > number > -129 and bits == 8) or (4096 > number > -1 and bits == 12):
            b = bin(int(number) & int("1" * bits, 2))[2:]
            return ("{0:0>%s}" % bits).format(b)
        else:
            return "1111111111111"
    else:
        number = int(n[0:])
        print(number)
        if (128 > number > -129 and bits == 8) or (4096 > number > -1 and bits == 12):
            b = bin(int(number) & int("1" * bits, 2))[2:]
            return ("{0:0>%s}" % bits).format(b)
        else:
            return "1111111111111"


def generateMachinecode():
    """
    This function takes assembler code and converts it into machinecode.
    Each line in the assembler textfield should have one Instruction of the following structures:
    1. Operation register1, register2; //comment
    2. Operation register, constant; //comment
    3. Operation register; //comment
    4. Operation; //comment
    The comments starting wit a "//", the "," aswell as the ";" are optional.
    """
    text_field_machinecode.delete("1.0", "end")
    lines = text_field_assembler.get("1.0", "end").splitlines()
    instructions = []
    current_line = 0
    for line in lines:
        line = line.replace(",", "").replace(";", "").split("//")[0].split()
        current_line += 1
        if len(line) == 1 and checkOneList.__contains__(line[0]):
            try:
                instructions.append(instructionDict[line[0]] + "000000000000")
            except KeyError:
                text_field_machinecode.insert("end", "Error in line {} {}, "
                                                     "not a valid instruction!".format(current_line, line) + "\n")
                text_field_machinecode.tag_add("error", "end-2c linestart", "end")
                text_field_assembler.mark_set("insert", str(current_line) + ".0 lineend")
                text_field_assembler.see(str(current_line) + ".0")
                return
        elif len(line) == 2 and checkTwoList.__contains__(line[0]):
            try:
                opcode = instructionDict[line[0]]
                if registerDict.__contains__(line[1]):
                    value = registerDict[line[1]] + "00000000"
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
        elif len(line) == 3 and checkThreeList.__contains__(line[0]):
            try:
                if registerDict.__contains__(line[2]):
                    opcode = instructionDict[line[0]].replace("?", "0")
                    value1 = registerDict[line[1]]
                    value2 = registerDict[line[2]] + "0000"
                else:
                    opcode = instructionDict[line[0]].replace("?", "1")
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
    f = open(filedialog.askopenfilename(), "r")
    text_field_assembler.delete("1.0", "end")
    text_field_assembler.insert("1.0", f.read())
    f.close()


def saveAssembler():
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
